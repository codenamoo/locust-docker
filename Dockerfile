FROM    python:2.7.15-alpine3.7

RUN     apk update \
        && apk add --no-cache --virtual .build-deps \
           alpine-sdk \
           bash
RUN     pip install pyzmq locustio
RUN     mkdir -p /opt/locustfile

COPY    start.sh /opt/
COPY    locustfile/ /opt/locustfile/

EXPOSE 8089

CMD ["/opt/start.sh"]