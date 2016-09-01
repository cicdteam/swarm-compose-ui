FROM python:2.7-alpine
MAINTAINER Andrew Taranik <me@pureclouds.net>

ENV GIT_REPO https://github.com/pureclouds/swarm-compose-ui-demo-projects.git

ADD app /app
WORKDIR /app

RUN apk add --no-cache git \
 && pip install --no-cache-dir -r /app/requirements.txt \
 && rm -r /root/.cache

EXPOSE 5000

ENTRYPOINT ["/usr/local/bin/python", "/app/main.py"]
