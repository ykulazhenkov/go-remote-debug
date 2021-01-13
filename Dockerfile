FROM golang

ADD . /go/src/go-remote-debug

ENV CGO_ENABLED 0
RUN go build -gcflags "all=-N -l" -o /main go-remote-debug
RUN go get github.com/go-delve/delve/cmd/dlv

CMD ["dlv", "--listen=:2345", "--headless=true", "--api-version=2", "--continue", "--accept-multiclient", "--only-same-user=false", "exec", "/main"]
