FROM ghcr.io/tkpegatron/alpine:rolling
COPY ./containers/python/requirements.txt requirements.txt
RUN apk add --no-cache python3 py3-pip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install -r requirements.txt