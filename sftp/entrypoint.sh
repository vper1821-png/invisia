#!/bin/bash
set -e

echo "Iniciando SFTP multiusuario..."

USERS_FILE="/users.conf"

if [ -f "$USERS_FILE" ]; then
  echo "Usando users.conf"
else
cat <<EOF > /tmp/users.conf
kp:1001:PasswordKP
dev:1002:PasswordDEV
admin:1003:PasswordADMIN
EOF
  USERS_FILE="/tmp/users.conf"
fi

while IFS=: read -r user uid pass; do
  echo "Creando usuario $user ($uid)"

  # 🔥 HOME REAL EN PVC
  adduser -D -h /var/www/html/$user -u $uid $user

  echo "$user:$pass" | chpasswd

  mkdir -p /var/www/html/$user
  chown -R $user:$user /var/www/html/$user
  chmod 775 /var/www/html/$user

done < "$USERS_FILE"

# permisos compartidos
chown -R root:www-data /var/www/html || true
chmod -R 775 /var/www/html || true

/usr/sbin/sshd -D -e


