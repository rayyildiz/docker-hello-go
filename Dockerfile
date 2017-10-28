FROM        golang:1.9.2 as build
WORKDIR     /go/src/github.com/rayyildiz/hello/
COPY        main.go .
RUN         CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .


FROM        alpine:3.6
RUN         apk --no-cache add ca-certificates
WORKDIR     /app/
COPY        --from=builder /go/src/github.com/rayyildiz/hello/hello .
CMD         ["/app/hello"]
