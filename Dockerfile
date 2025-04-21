FROM ubuntu:24.04

RUN DEBIAN_FRONTEND=noninteractive \
apt update \
&& apt install -y python3 python3-pip\
&& rm -rf /var/lib/apt/lists/*

COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt --break-system-packages

WORKDIR /workspace