FROM alpine:3.15 as builder
RUN apk update && apk upgrade
RUN apk add go git make
ENV GOPROXY=https://goproxy.io
RUN git clone https://github.com/insomniacslk/irc-slack
WORKDIR irc-slack
RUN go mod download
RUN cd /irc-slack/cmd/irc-slack && make

FROM alpine:3.15 as certbuilder
RUN apk add openssl
WORKDIR /certs
RUN openssl req -nodes -new -x509 -subj="/C=US/ST=Denial/L=springfield/O=Dis/CN=ircslack.terminaldweller.com" -keyout server.key -out server.cert

FROM alpine:3.13
COPY --from=certbuilder /certs /certs
COPY --from=builder /irc-slack/cmd/irc-slack/irc-slack /irc-slack/
