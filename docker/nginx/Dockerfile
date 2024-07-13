# environment variables
ARG NGINX_IMAGE=1.22-alpine

FROM nginx:${NGINX_IMAGE} AS nginx-dev

WORKDIR /var/www/public

COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./src/public/* /var/www/public/