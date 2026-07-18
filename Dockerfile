FROM alpine:3.20

WORKDIR /app

ENV TZ=Asia/Tehran

RUN apk add --no-cache \
    bash \
    curl \
    ca-certificates \
    tzdata

RUN mkdir -p /etc/x-ui

RUN curl -L \
    https://github.com/MHSanaei/3x-ui/releases/latest/download/x-ui-linux-amd64.tar.gz \
    -o /tmp/x-ui.tar.gz \
    && tar -xzf /tmp/x-ui.tar.gz -C /app \
    && rm /tmp/x-ui.tar.gz

RUN chmod +x /app/x-ui

COPY install.sh /app/install.sh

RUN chmod +x /app/install.sh

EXPOSE 2053

CMD ["/app/install.sh"]
