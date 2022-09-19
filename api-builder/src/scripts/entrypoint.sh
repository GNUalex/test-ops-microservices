#!/bin/sh

envsubst < /scripts/build.sh > /var/lib/nginx/build.sh
chmod +x /var/lib/nginx/build.sh
sh /var/lib/nginx/build.sh

nginx -g "daemon off;"
