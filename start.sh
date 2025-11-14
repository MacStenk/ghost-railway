#!/bin/sh
set -e

echo "🚀 Ghost Startup Script..."
echo "Environment check:"
echo "URL: ${url}"
echo "Mail transport: ${mail__transport}"
echo "Database host: ${database__connection__host}"

# Config generieren
cat > /var/lib/ghost/config.production.json <<EOF
{
  "url": "${url}",
  "server": {
    "port": ${PORT},
    "host": "::"
  },
  "database": {
    "client": "${database__client}",
    "connection": {
      "host": "${database__connection__host}",
      "user": "${database__connection__user}",
      "password": "${database__connection__password}",
      "database": "${database__connection__database}",
      "port": ${database__connection__port}
    }
  },
  "mail": {
    "transport": "${mail__transport}",
    "options": {
      "host": "${mail__options__host}",
      "port": ${mail__options__port},
      "secure": ${mail__options__secure},
      "auth": {
        "user": "${mail__options__auth__user}",
        "pass": "${mail__options__auth__pass}"
      },
      "from": "${mail__from}"
    }
  },
  "logging": {
    "transports": ["file", "stdout"]
  },
  "paths": {
    "contentPath": "/var/lib/ghost/content"
  }
}
EOF

echo "✅ Config generated!"
cat /var/lib/ghost/config.production.json

echo "🚀 Starting Ghost..."
exec node current/index.js