FROM ubuntu:20.04

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    build-essential \
    cmake \
    tree \
    && rm -rf /var/lib/apt/lists/*
