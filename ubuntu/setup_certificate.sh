#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"

apt update > /dev/null 2>&1
apt install -y certbot python3-certbot-nginx > /dev/null 2>&1

certbot --nginx -d "$domain"

nginx -t && systemctl reload nginx

echo "SSL certificate for $domain has been obtained and configured."
