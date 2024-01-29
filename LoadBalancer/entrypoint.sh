#!/bin/sh

# Check if the ENABLE_HTTPS variable is set to true
if [ "$ENABLE_HTTPS" = "true" ]; then
    /usr/local/bin/renew-certs.sh
    export DOMAIN_CERT_PATH="/etc/letsencrypt/live/$DOMAIN_NAME/fullchain.pem"
    envsubst < /usr/local/etc/haproxy/haproxy.cfg.https.template > /usr/local/etc/haproxy/haproxy.cfg
    cron -f &
else
    envsubst < /usr/local/etc/haproxy/haproxy.cfg.http.template > /usr/local/etc/haproxy/haproxy.cfg
fi

# Start HAProxy with the generated config file
exec haproxy -f /usr/local/etc/haproxy/haproxy.cfg
