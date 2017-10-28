FROM        golang:1.9.2 as builder
WORKDIR     /go/src/github.com/rayyildiz/hello/
COPY        main.go .
RUN         CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

FROM        scratch
WORKDIR     /app/
COPY        --from=builder /go/src/github.com/rayyildiz/hello/hello /app/hello
CMD         ["/app/hello"]
