FROM rustlang/rust:nightly-slim AS builder

RUN apt-get update && apt-get install -y \
    pkg-config \
    libssl-dev \
    build-essential \
    git \
    curl \
    ca-certificates \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src

RUN git clone --depth 1 https://github.com/paviro/KoShelf.git .

RUN cargo +nightly build --release

FROM debian:12-slim

WORKDIR /

COPY --from=builder /src/target/release/koshelf /koshelf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

LABEL org.opencontainers.image.title="KoShelf"
LABEL org.opencontainers.image.description="Self-hosted ebook library with KOReader integration"
LABEL org.opencontainers.image.source="https://github.com/paviro/KoShelf"

ENTRYPOINT ["/entrypoint.sh"]
