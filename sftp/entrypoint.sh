#!/bin/bash

set -e

echo "Iniciando SFTP custom..."

# asegurar permisos correctos siempre
chown -R kp:kp /home/kp
chmod -R 775 /home/kp

# password del usuario (simple, luego lo mejoramos a secrets)
echo "kp:PasswordSeguro123!" | chpasswd

# iniciar sshd en foreground
/usr/sbin/sshd -D -e
