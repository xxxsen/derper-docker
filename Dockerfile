FROM golang:1.22

ARG VER=v1.34.2

RUN CGO_ENABLED=0 go install -a -tags netgo -ldflags '-w' tailscale.com/cmd/derper@$VER

FROM alpine:3.12
RUN apk add --no-cache ca-certificates 
COPY --from=0 /go/bin/derper /usr/bin

VOLUME /var/run/tailscale/tailscaled.sock

EXPOSE 3478/udp
EXPOSE 443/tcp

ENTRYPOINT ["/usr/bin/derper"]
