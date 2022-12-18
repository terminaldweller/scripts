# https://github.com/jessfraz/irssi
# For the time being we have build on alpine:edge since perl::Glib::Object::Introspection is only available on edge/testing
FROM alpine:edge
# https://georgik.rocks/how-to-start-d-bus-in-docker-container/
# apk add dbus dbus-x11
# dbus-uuidgen > /var/lib/dbus/machine-id
# mkdir -p /var/run/dbus
# dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address
# export $(dbus-launch)

RUN echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && apk update
RUN apk add --no-cache \
    ca-certificates \
    perl-libwww

ENV HOME /home/user
RUN set -eux; \
  adduser -u 1001 -D -h "$HOME" user; \
  mkdir "$HOME/.irssi"; \
  chown -R user:user "$HOME"

ENV LANG C.UTF-8

ENV IRSSI_VERSION 1.4.3

RUN set -eux; \
  \
  apk add --no-cache --virtual .build-deps \
    autoconf \
    automake \
    coreutils \
    dpkg-dev dpkg \
    gcc \
    glib-dev \
    gnupg \
    libc-dev \
    libtool \
    lynx \
    make \
    meson \
    ninja \
    xz \
    ncurses-dev \
    openssl \
    openssl-dev \
    perl-dev \
    pkgconf \
    tar \
    libotr-dev \
    libgcrypt-dev \
  ; \
  \
  wget "https://github.com/irssi/irssi/releases/download/${IRSSI_VERSION}/irssi-${IRSSI_VERSION}.tar.xz" -O /tmp/irssi.tar.xz; \
  wget "https://github.com/irssi/irssi/releases/download/${IRSSI_VERSION}/irssi-${IRSSI_VERSION}.tar.xz.asc" -O /tmp/irssi.tar.xz.asc; \
  export GNUPGHOME="$(mktemp -d)"; \
# gpg: key DDBEF0E1: public key "The Irssi project <staff@irssi.org>" imported
  gpg --batch --keyserver keyserver.ubuntu.com --recv-keys 7EE65E3082A5FB06AC7C368D00CCB587DDBEF0E1; \
  gpg --batch --verify /tmp/irssi.tar.xz.asc /tmp/irssi.tar.xz; \
  gpgconf --kill all; \
  rm -rf "$GNUPGHOME" /tmp/irssi.tar.xz.asc; \
  \
  mkdir -p /usr/src/irssi; \
  tar -xf /tmp/irssi.tar.xz -C /usr/src/irssi --strip-components 1; \
  rm /tmp/irssi.tar.xz; \
  \
  cd /usr/src/irssi; \
  meson \
    -Denable-true-color=yes \
    -Dwith-bot=yes \
    -Dwith-perl=yes \
    -Dwith-proxy=yes \
    -Dwith-otr=yes \
    Build \
  ; \
  ninja -C Build -j "$(nproc)"; \
  ninja -C Build install;
RUN cd /; \
  rm -rf /usr/src/irssi; \
  \
  runDeps="$( \
    scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
      | tr ',' '\n' \
      | sort -u \
      | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
  )"; \
  apk add --virtual .irssi-rundeps $runDeps; \
  echo https://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && apk update; \
  apk add --no-cache perl-glib perl-datetime perl-dbi perl-dbd-pg perl-lwp-protocol-https proxychains-ng perl-glib-object-introspection libnotify; \
  # apk add dbus; \
  # dbus-uuidgen > /var/lib/dbus/machine-id; \
  # mkdir -p /var/run/dbus; \
  # dbus-daemon --config-file=/usr/share/dbus-1/system.conf --print-address; \
  # export $(dbus-launch); \
  apk del --no-network .build-deps; \
  \
# basic smoke test
  irssi --version

COPY ./proxychains.conf /etc/proxychains/
WORKDIR $HOME

USER user
CMD ["proxychains4", "-q", "irssi"]
