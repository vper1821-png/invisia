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

# grupo compartido
addgroup -S www || true

for u in kp dev admin; do
  addgroup $u www || true
done

# permisos consistentes SIN romper ownership de usuarios
chown -R root:www /var/www/html
chmod -R 2775 /var/www/html

/usr/sbin/sshd -D -e


