FROM alpine:3.20

RUN apk add --no-cache openssh bash shadow

RUN adduser -D -u 1001 kp

RUN echo "kp:PasswordSeguro123!" | chpasswd

RUN ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd","-D","-e"]
