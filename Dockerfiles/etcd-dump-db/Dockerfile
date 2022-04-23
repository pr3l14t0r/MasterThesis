FROM golang:latest

RUN git clone https://github.com/etcd-io/etcd.git \
    && cd etcd/tools/etcd-dump-db \
    && go build \
    && cp ./etcd-dump-db /usr/bin/ \
    && cd /go \
    && rm -rf /etcd

CMD [ "bash" ]