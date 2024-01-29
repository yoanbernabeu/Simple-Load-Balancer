#!/bin/sh

# Generate the certificate with certbot and reload HAProxy
certbot certonly --standalone -d $DOMAIN_NAME --non-interactive --agree-tos --email $EMAIL_ADDRESS --expand --renew-by-default --post-hook "haproxy -f /usr/local/etc/haproxy/haproxy.cfg -c && systemctl reload haproxy"
