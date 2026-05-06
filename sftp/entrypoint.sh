#!/bin/bash
set -e

echo "SFTP shared hosting (single site, 3 admins)"

addgroup -S web || true

# crear usuarios administradores
for u in kp dev admin; do
  adduser -D -h /var/www/html -u $(shuf -i 1001-2000 -n 1) $u
  echo "$u:Password$u" | chpasswd
  addgroup $u web || true
done

# 🔥 TODO EL SITIO ES COMPARTIDO
chown -R root:web /var/www/html
chmod -R 2775 /var/www/html

/usr/sbin/sshd -D -e


