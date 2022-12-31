#FROM alpine:3.16 as certbuilder
#RUN apk add openssl
#WORKDIR /certs
#RUN openssl req -x509 -newkey rsa:4096 -keyout key.rsa -out cert.pem -days 3650 -nodes -subj "/CN=gemini.terminaldweller.com"

FROM alpine:3.16 as builder
RUN apk update \
      && apk upgrade \
      && apk add --no-cache cargo \
      && cargo install agate
#COPY --from=certbuilder /certs /certs
COPY ./index.gmi /srv/index.gmi
#ENTRYPOINT ["agate"]
