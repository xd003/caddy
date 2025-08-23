ARG CADDY_VERSION=2.10.1

FROM caddy:${CADDY_VERSION}-builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/WeidiDeng/caddy-cloudflare-ip \
    --with github.com/hslatman/caddy-crowdsec-bouncer/http

FROM caddy:${CADDY_VERSION}

# RUN apt-get update && apt-get install -y tzdata && rm -rf /var/lib/apt/lists/*

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
