FROM alpine:3.20

RUN apk add --no-cache openssh

RUN adduser -D -u 1001 kp && echo "kp:PasswordSeguro123!" | chpasswd

RUN mkdir -p /home/kp/upload && chown -R kp:kp /home/kp

RUN ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd","-D","-e"]
