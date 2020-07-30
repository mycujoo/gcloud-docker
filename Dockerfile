FROM google/cloud-sdk:alpine

ENV VAULT_VERSION=0.11.0

RUN gcloud components install kubectl

RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
     apk update && \
     apk add --no-cache make gcc g++ python jq docker tar consul-template@testing nodejs nodejs-npm bash openssl postgresql mariadb-client git py-pip

RUN pip install docker-compose~=1.23.0

ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip /tmp

WORKDIR /tmp
RUN unzip vault_${VAULT_VERSION}_linux_amd64.zip && mv vault /usr/local/bin
RUN chmod +x /usr/local/bin/vault

# Install HELM
RUN bash -c "$(curl -sS https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get)"
