FROM golang:latest AS build-stage

WORKDIR /app

COPY go.mod go.sum .

RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o app

FROM alpine:latest

WORKDIR /app

COPY --from=build-stage /app/app .

COPY templates ./templates
COPY static ./static

EXPOSE 8080

ENTRYPOINT [ "./app" ]