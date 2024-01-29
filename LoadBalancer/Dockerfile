FROM haproxy:latest

# Switch to root user to install packages
USER root

# Install certbot and cron
RUN apt-get update && \
    apt-get install -y certbot gettext-base cron && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV DOMAIN_NAME=yourdomain.com
ENV EMAIL_ADDRESS=your@email.com
ENV BACKEND1_URL=back1.test.com:80
ENV BACKEND2_URL=back2.test.com:80
ENV ENABLE_HTTPS=false

# Copy files
COPY entrypoint.sh /usr/local/bin/
COPY haproxy.cfg.http.template /usr/local/etc/haproxy/haproxy.cfg.http.template
COPY haproxy.cfg.https.template /usr/local/etc/haproxy/haproxy.cfg.https.template
COPY renew-certs.sh /usr/local/bin/
COPY renew-cron /etc/cron.d/

# Set permissions
RUN chmod +x /usr/local/bin/entrypoint.sh /usr/local/bin/renew-certs.sh && \
    chmod 0644 /etc/cron.d/renew-cron && \
    crontab /etc/cron.d/renew-cron

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]