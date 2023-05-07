FROM debian:bullseye-slim
# RUN echo 'Acquire::http::Proxy "socks5h://192.168.1.214:9995";' > /etc/apt/apt.conf.d/proxy.conf && \
#       echo 'Acquire::https::Proxy "socks5h://192.168.1.214:9995";' >> /etc/apt/apt.conf.d/proxy.conf && \
RUN apt-get update && apt-get install --no-install-recommends -y gophernicus
