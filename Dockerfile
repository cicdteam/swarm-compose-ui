FROM python:2.7-alpine
MAINTAINER Andrew Taranik <me@pureclouds.net>

RUN pip install virtualenv

RUN apk add -U --no-cache git

WORKDIR /app
ADD . /app
RUN virtualenv /env && /env/bin/pip install --no-cache-dir -r /app/requirements.txt

ADD projects /opt/docker-compose-projects

EXPOSE 5000

CMD []
ENTRYPOINT ["/env/bin/python", "/app/main.py"]
