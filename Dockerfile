FROM alpine:3.11.3

RUN apk update && apk add --no-cache nginx && rm -rf /var/cache/apk/*
RUN mkdir -p /run/nginx && sed -i 's|return 404|root /usr/share/nginx/html|g' /etc/nginx/conf.d/default.conf

COPY index.html /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]