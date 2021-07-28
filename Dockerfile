FROM golang:alpine3.10 as builder
RUN mkdir /build
ADD *.go /build/
WORKDIR /build
RUN go build -ldflags "-s -w" -o  main .

FROM scratch
COPY --from=builder /build/main .
ENTRYPOINT [ "./main" ]