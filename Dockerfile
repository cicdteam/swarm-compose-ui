FROM python:2.7-alpine
MAINTAINER Andrew Taranik <me@pureclouds.net>

ADD app /app
ADD projects /opt/docker-compose-projects
WORKDIR /app

RUN apk add --no-cache git \
 && pip install --no-cache-dir -r /app/requirements.txt \
 && rm -r /root/.cache

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/python", "/app/main.py"]
