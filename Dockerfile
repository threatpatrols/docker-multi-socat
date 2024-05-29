
# https://hub.docker.com/_/debian/tags
FROM debian:stable-slim

# Hello
LABEL maintainer="Nicholas de Jong <ndejong@threatpatrols.com>"
LABEL source="https://github.com/threatpatrols/docker-multi-socat"

# install prerequisites and cloudflare-warp
RUN \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y socat procps && \
    apt-get install -y iputils-ping inetutils-traceroute && \
    apt-get clean && \
    apt-get autoremove -y


COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
