FROM golang:alpine as builder

WORKDIR /app 

COPY . .

RUN go build -ldflags="-w -s" .

FROM scratch

WORKDIR /app

COPY --from=builder /app/hellogo /usr/bin/

ENTRYPOINT ["hellogo"]