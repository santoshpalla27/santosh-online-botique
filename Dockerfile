FROM node:20.18.1-alpine as build 

WORKDIR /usr/src/app

RUN apk add --update --no-cache \
    python3 \
    make \
    g++



COPY package*.json ./

RUN npm install --only=production

FROM alpine::3.21.3

RUN apk add --no-cache nodejs

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/node_modules ./node_modules

COPY . .

EXPOSE 7000

ENTRYPOINT [ "node", "server.js" ]