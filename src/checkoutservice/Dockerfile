FROM golang:1.24.0 AS build-stage

ARG TARGETOS
ARG TARGETARCH

WORKDIR /app

COPY go.mod go.sum .
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}  go build -o checkoutservice . 

FROM alpine:3.21.3 

WORKDIR /app

COPY --from=build-stage /app/checkoutservice .

EXPOSE 5050

ENTRYPOINT [ "/app/checkoutservice" ]
