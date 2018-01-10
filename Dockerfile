FROM sbani/google-gloud-sdk:latest

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
     apk update && \
     apk add jq docker tar consul-template@testing nodejs bash openssl postgresql mariadb-client git py-pip

RUN pip install docker-compose

# Install HELM
RUN bash -c "$(curl -sS https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get)"
