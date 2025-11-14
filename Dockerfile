#!/bin/sh
set -e

echo "🚀 Ghost Startup Script..."

# Config generieren aus Environment Variables
cat > /var/lib/ghost/config.production.json <<EOF
{
  "url": "${url:-http://localhost:2368}",
  "server": {
    "port": ${PORT:-2368},
    "host": "::"
  },
  "database": {
    "client": "${database__client:-mysql}",
    "connection": {
      "host": "${database__connection__host}",
      "user": "${database__connection__user}",
      "password": "${database__connection__password}",
      "database": "${database__connection__database}",
      "port": ${database__connection__port:-3306}
    }
  },
  "mail": {
    "transport": "${mail__transport:-Direct}",
    "options": {
      "host": "${mail__options__host:-}",
      "port": ${mail__options__port:-587},
      "secure": ${mail__options__secure:-false},
      "auth": {
        "user": "${mail__options__auth__user:-}",
        "pass": "${mail__options__auth__pass:-}"
      },
      "from": "${mail__from:-noreply@localhost}"
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