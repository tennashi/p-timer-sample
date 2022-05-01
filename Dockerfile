FROM golang as builder

WORKDIR /go/src/app
ADD . /go/src/app

ENV CGO_ENABLED=0

RUN go build -o /go/bin/app

FROM busybox

COPY --from=builder /go/bin/app /usr/local/bin/app

CMD ["/usr/local/bin/app"]
