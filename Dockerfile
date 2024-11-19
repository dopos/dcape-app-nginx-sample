ARG IMAGE=nginx
ARG IMAGE_VER=1.19.4-alpine

FROM --platform=$BUILDPLATFORM ${IMAGE}:${IMAGE_VER}

COPY nginx/*.conf /etc/nginx/conf.d/
COPY nginx/enable404.sh /docker-entrypoint.d/
COPY html /usr/share/nginx/html
