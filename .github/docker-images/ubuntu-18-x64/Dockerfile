FROM ubuntu:18.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

ARG OPENSSL_VERSION=1.1.1n

###############################################################################
# Install prereqs
###############################################################################
RUN apt-get update -qq \
    && apt-get -y install \
    git \
    curl \
    build-essential \
    wget \
    cppcheck \
    libc6-dbg \
    softhsm \
    && apt-get clean

###############################################################################
# Install OpenSSL 1.1.1
###############################################################################
WORKDIR /tmp
RUN wget https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz \
    && tar -zxvf openssl-${OPENSSL_VERSION}.tar.gz \
    && cd openssl-${OPENSSL_VERSION} \
    && ./config \
    && make \
    && make install \
    && ldconfig

###############################################################################
# Install pre-built CMake
###############################################################################
WORKDIR /tmp
RUN curl -sSL https://github.com/Kitware/CMake/releases/download/v3.10.0/cmake-3.10.0.tar.gz -o cmake-3.10.0.tar.gz \
    && tar -zxvf cmake-3.10.0.tar.gz \
    && cd cmake-3.10.0 \
    && ./bootstrap \
    && make -j 2 \
    && make install

###############################################################################
# Clone and build device client
###############################################################################
RUN git clone https://github.com/awslabs/aws-iot-device-client.git /src/aws-iot-device-client \
    && mkdir -p /src/aws-iot-device-client/build \
    && cd /src/aws-iot-device-client/build \
    && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON -DCMAKE_BUILD_TYPE=Debug .. \
    && cmake --build . --target aws-iot-device-client

FROM ubuntu:18.04 AS deploy

COPY --from=builder /src/aws-iot-device-client/build/aws-iot-device-client ./aws-iot-device-client
CMD ["./aws-iot-device-client"]
