FROM node:12-alpine

RUN apk --no-cache --virtual build-dependencies add \
    chromium \
    git \
    && npm i npm@latest -g

ENV CHROME_BIN /usr/bin/chromium-browser
ENV LIGHTHOUSE_CHROMIUM_PATH /usr/bin/chromium-browser

WORKDIR /var/www/html

