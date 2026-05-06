#!/bin/bash
set -e

echo "Iniciando SFTP multiusuario..."

# crear usuarios dinámicamente
while IFS=: read -r user uid pass; do
  echo "Creando usuario $user ($uid)"

  adduser -D -u $uid $user
  echo "$user:$pass" | chpasswd

  mkdir -p /home/$user
  chown -R $user:$user /home/$user
  chmod 755 /home/$user

done << EOF
kp:1001:PasswordKP
dev:1002:PasswordDEV
admin:1003:PasswordADMIN
EOF

# permisos globales RWX (Longhorn)
chown -R root:root /data || true
chmod -R 775 /data || true

/usr/sbin/sshd -D -e
