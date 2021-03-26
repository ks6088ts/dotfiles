FROM ubuntu:20.04

ARG WORK_DIR=""
ARG HTTP_PROXY=""
ARG HTTPS_PROXY=""

WORKDIR ${WORK_DIR}

ENV HTTP_PROXY=${HTTP_PROXY}
ENV HTTPS_PROXY=${HTTPS_PROXY}
ENV http_proxy=${HTTP_PROXY}
ENV https_proxy=${HTTPS_PROXY}

# https://stackoverflow.com/a/58264927/4457856
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt-get install -y \
        make \
        sudo \
        tzdata

COPY ./ ./
RUN make -f ubuntu.mk install
