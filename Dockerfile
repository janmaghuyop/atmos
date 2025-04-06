# https://hub.docker.com/_/alpine/
# https://hub.docker.com/_/alpine/tags
FROM alpine:3.21.3

# https://releases.hashicorp.com/terraform/
# https://developer.hashicorp.com/terraform/install
# https://github.com/cloudposse/atmos/releases
ARG TF_VER=1.11.3
ARG AT_VER=1.169.0

# https://releases.hashicorp.com/terraform/
# https://github.com/cloudposse/atmos/releases
RUN apk update && apk add --no-cache git bash; \
    cd /tmp; \
    ARCH="amd"; \
    [ "$(uname -m)" = "aarch64" ] && ARCH="arm"; \
    wget https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_${ARCH}64.zip \
    && unzip terraform_${TF_VER}_linux_${ARCH}64.zip \
    && mv terraform /usr/local/bin/terraform \
    && wget https://github.com/cloudposse/atmos/releases/download/v${AT_VER}/atmos_${AT_VER}_linux_${ARCH}64 \
    && mv atmos* /usr/local/bin/atmos \
    && chmod +x /usr/local/bin/atmos \
    && rm -r /tmp/*

SHELL ["/bin/bash", "-c"]
