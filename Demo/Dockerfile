FROM httpd:latest

RUN apt-get update && \
    apt-get install -y gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY index.html /usr/local/apache2/htdocs/index.html
COPY entrypoint.sh /usr/local/bin/

# Set permissions
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set environment variables
ENV BACKEND_NAME="backend"

# Set entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Expose ports
EXPOSE 80
EXPOSE 443