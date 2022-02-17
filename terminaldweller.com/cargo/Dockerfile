FROM alpine:3.15 AS certbuilder
RUN apk update && apk add openssl
WORKDIR /certs
RUN openssl req -nodes -new -x509 -subj="/C=US/ST=Denial/L=springfield/O=Dis/CN=localhost" -keyout server.key -out server.cert

FROM nginx:mainline-alpine
COPY --from=certbuilder /certs/ /certs
