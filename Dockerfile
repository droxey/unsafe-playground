FROM xiam/go-playground-unsafebox:latest

RUN apt-get update && \
    apt-get install -y \
    gcc \
    iptables \
    net-tools \
    iftop \
    htop \
    netcat \
    curl

COPY entrypoint.sh /bin/entrypoint.sh

ENV WORKDIR /home/sandbox

WORKDIR $WORKDIR

RUN useradd -ms /bin/bash sandbox

ENV GOPATH /go

RUN go get github.com/gocolly/colly

ENTRYPOINT ["/bin/entrypoint.sh"]
