FROM python:3.9-alpine as build 

WORKDIR /app

RUN apk update \
    && apk add --no-cache g++ linux-headers \
    && rm -rf /var/cache/apk/*

COPY requirements.txt .
RUN pip install -r requirements.txt


FROM python:3.9-alpine

RUN apk update \
    && apk add --no-cache libstdc++ \
    && rm -rf /var/cache/apk/*

WORKDIR /app

COPY --from=build /usr/local/lib/python3.9/ /usr/local/lib/python3.9/
COPY . .

ENV PORT "8080"
EXPOSE 8080

ENTRYPOINT [ "python" , "recommendation_server.py" ]