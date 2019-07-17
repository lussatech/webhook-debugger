FROM golang:alpine as builder
WORKDIR /root
COPY . /root
RUN apk add --update alpine-sdk
RUN make build-cross-linux

FROM alpine:3.9
LABEL maintainer="Muhammad Hasan <hasan@lussa.net>"
WORKDIR /
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
COPY --from=builder /root/webhook /
CMD ["/webhook"]
