FROM golang:1.23-alpine AS builder
RUN apk update && \
  apk add bash git && \
  rm -rf /var/lib/cache/apk/*
RUN git clone https://github.com/vouch/vouch-proxy.git
RUN cd vouch-proxy && ./do.sh goget && ./do.sh build

FROM alpine:3.20
WORKDIR /app
COPY --from=builder /go/vouch-proxy/vouch-proxy /app
EXPOSE 9090/tcp
VOLUME ["/app/config"]
ENTRYPOINT ["/app/vouch-proxy"]

