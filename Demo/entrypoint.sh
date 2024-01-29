#!/bin/sh

# Use envsubst to replace the environment variables in the index.html file
envsubst < /usr/local/apache2/htdocs/index.html > /usr/local/apache2/htdocs/index_temp.html
mv /usr/local/apache2/htdocs/index_temp.html /usr/local/apache2/htdocs/index.html

# Start Apache in the foreground
exec httpd-foreground