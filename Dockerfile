

FROM python:3.9-alpine as build 

WORKDIR /app

RUN apk update \
    && apk add --no-cache g++ linux-headers \
    && rm -rf /var/cache/apk/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt


FROM python:3.9-alpine

WORKDIR /app

RUN apk update \
    && apk add --no-cache libstdc++ \
    && rm -rf /var/cache/apk/*

COPY --from=build /usr/local/lib/python3.12/ /usr/local/lib/python3.12/

ENV PYTHONUNBUFFERED=1

ENV DISABLE_PROFILER=1

COPY . .

EXPOSE 8080
ENTRYPOINT [ "python", "email_server.py" ]