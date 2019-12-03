FROM node:12-alpine

RUN apk --no-cache --virtual build-dependencies add \
    git \
    && npm i npm@latest -g

WORKDIR /var/www/html

