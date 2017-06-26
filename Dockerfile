FROM sbani/google-gloud-sdk:latest

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
     apk update && \
     apk add jq docker tar consul-template@testing
