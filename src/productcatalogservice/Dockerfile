FROM golang:1.24.0 AS build-stage
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app

COPY go.mod go.sum .
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH}  go build -o productcatalogservice . 

FROM alpine:3.21.3 

WORKDIR /app

COPY --from=build-stage /app/productcatalogservice .

COPY --from=build-stage /app/products.json .

COPY --from=build-stage /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt


EXPOSE 3550

ENTRYPOINT [ "/app/productcatalogservice" ]
