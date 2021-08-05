FROM debian:buster-slim
RUN apt update && apt upgrade -y
RUN apt install wget build-essential -y
COPY ./*.cpp ./*.hpp ./makefile /dummy/
WORKDIR /dummy
RUN make exe CXX=g++ run
