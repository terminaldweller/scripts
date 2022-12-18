FROM alpine:3.16
RUN apk update && apk add --no-cache git cronie busybox-initscripts
# RUN rc-service crond start && rc-update add crond
COPY ./bootstrap.sh /bootstrap.sh 
COPY ./docker-entrypoint.sh /docker-entrypoint.sh
COPY ./crontab /etc/crontabs/root
RUN chmod 0744 /bootstrap.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
