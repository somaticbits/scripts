#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"

apt update
apt install -y certbot python3-certbot-nginx

certbot --nginx -d "$domain"

nginx -t && systemctl reload nginx

echo "SSL certificate for $domain has been obtained and configured."
