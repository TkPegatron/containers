FROM ghcr.io/tkpegatron/alpine:rolling

RUN true \
    && curl -1sLf 'https://dl.cloudsmith.io/public/isc/stork/cfg/setup/bash.alpine.sh' | bash \
    && apk add --no-cache isc-stork-server isc-stork-server-hook-ldap

# Healthcheck for stork: "wget --delete-after -q http://localhost:8080/api/version" ]
ENTRYPOINT ["/usr/bin/catatonit", "--", "stork-server"]