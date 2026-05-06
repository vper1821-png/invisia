FROM alpine:3.20

RUN apk add --no-cache openssh bash shadow

# crear usuario fijo
RUN adduser -D -u 1001 kp

# preparar directorio
RUN mkdir -p /home/kp/upload && \
    chown -R kp:kp /home/kp

# ssh config básico
RUN ssh-keygen -A

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 22

ENTRYPOINT ["/entrypoint.sh"]
