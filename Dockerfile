FROM golang:alpine as builder
RUN apk add --update alpine-sdk
RUN make build-cross-linux

FROM alpine:3.9
WORKDIR /
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY webhook /
CMD ["/webhook"]
