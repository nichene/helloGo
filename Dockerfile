FROM golang:alpine as builder

WORKDIR /app 

COPY . .

RUN CGO_ENABLED=0 go build -ldflags="-w -s" .

FROM scratch

WORKDIR /app

COPY --from=builder /app/hellogo /usr/bin/

ENTRYPOINT ["hellogo"]