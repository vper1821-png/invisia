#!/bin/bash
set -e

echo "SFTP shared hosting"

addgroup -S web || true

for u in kp dev admin; do
  adduser -D -h /var/www/html -u $(shuf -i 1001-2000 -n 1) $u

  # passwords consistentes (NO del Deployment)
  echo "$u:Password$u" | chpasswd

  addgroup $u web || true
done

chown -R root:web /var/www/html
chmod -R 2775 /var/www/html

/usr/sbin/sshd -D -e
