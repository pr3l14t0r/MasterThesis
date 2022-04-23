FROM golang:latest

RUN git clone https://github.com/google/container-explorer.git \
    && cd container-explorer/ \
    && go build \
    && cp ./container-explorer /usr/bin/ \
    && cd /go \
    && rm -rf container-explorer/

CMD [ "bash" ]