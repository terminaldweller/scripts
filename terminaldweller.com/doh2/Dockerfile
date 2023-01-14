FROM alpine:3.17 as builder
ENV GOPROXY=https://goproxy.io
RUN apk update && apk upgrade
RUN apk add go git
ENV GOPROXY=https://goproxy.io
RUN git clone https://github.com/AdguardTeam/dnsproxy && cd dnsproxy && go build -mod=vendor

FROM alpine:3.17 as certbuilder
RUN apk add openssl
WORKDIR /certs
RUN openssl req -nodes -new -x509 -subj="/C=US/ST=Denial/L=springfield/O=Dis/CN=doh2.terminaldweller.com" -keyout server.key -out server.cert

# FROM gcr.io/distroless/static-debian10
FROM alpine:3.17
COPY --from=certbuilder /certs /certs
COPY --from=builder /dnsproxy/dnsproxy /dnsproxy/dnsproxy
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
