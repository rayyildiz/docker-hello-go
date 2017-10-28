Docker Multi Build
===

[![](https://images.microbadger.com/badges/image/rayyildiz/hello-go.svg)](https://microbadger.com/images/rayyildiz/hello-go "Get your own image badge on microbadger.com")

Docker [Multi Build Stage Test](https://docs.docker.com/engine/userguide/eng-image/multistage-build/#use-multi-stage-builds)

[https://hub.docker.com/r/rayyildiz/hello-go](https://hub.docker.com/r/rayyildiz/hello-go)


Run
---

```bash
docker run --rm rayyildiz/hello-go
```


Dockerfile
---


```dockerfile
FROM        golang:1.9.2 as builder
WORKDIR     /go/src/github.com/rayyildiz/hello/
COPY        main.go .
RUN         CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

FROM        alpine:3.6
RUN         apk --no-cache add ca-certificates
WORKDIR     /app/
COPY        --from=builder /go/src/github.com/rayyildiz/hello/hello .
CMD         ["/app/hello"]
```
