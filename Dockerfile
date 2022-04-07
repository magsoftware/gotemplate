FROM golang:1.18-alpine

RUN apk update && apk add --no-cache git

WORKDIR /go/src

ADD . /go/src

ENTRYPOINT ["go", "test", "-v", "./..."]
