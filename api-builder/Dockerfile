FROM alpine:latest

COPY ./src/scripts /scripts

RUN mkdir -p /run/nginx && \
    apk add --no-cache nginx-mod-http-lua curl gettext && \
    addgroup -S testuser && adduser -S testuser -G testuser && \
    chmod +x /scripts/* && \
    chown -R testuser:testuser /var/log/nginx /var/lib/nginx /run/nginx /scripts

COPY ./src/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./src/nginx/vhost.conf /etc/nginx/http.d/vhost.conf

USER testuser

ENTRYPOINT ["/scripts/entrypoint.sh"]
