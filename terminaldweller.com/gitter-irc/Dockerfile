FROM node:lts-alpine3.17
RUN apk update \
      && apk add git \
      && git clone https://gitlab.com/gitterHQ/irc-bridge \
      && cd irc-bridge \
      && npm install
WORKDIR /irc-bridge
