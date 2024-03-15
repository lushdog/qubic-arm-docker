FROM arm64v8/debian:12

ARG VERSION

RUN apt-get update && \
    apt-get install -y wget tar libicu-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /download

RUN wget https://github.com/Qubic-Solutions/rqiner-builds/releases/download/${VERSION}/rqiner-aarch64

RUN chmod +x rqiner-aarch64

WORKDIR /app

RUN cp /download/rqiner-aarch64 /app/ && rm -rf /download

VOLUME /app

CMD ./rqiner-aarch64 -i $WALLET -t $T
