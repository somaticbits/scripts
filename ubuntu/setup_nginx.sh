#!/bin/bash

read -p "Enter deployment path: " deployment_path
read -p "Enter domain: " domain

#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: $0 <deployment_path>"
    exit 1
fi

deployment_path="$1"
config_file="/etc/nginx/sites-available/${deployment_path//\//domain}"

config_content=$(cat <<EOL
server {
    listen 80;
    server_name $domain;

    location / {
        root $deployment_path;
        index index.html;
    }
}
EOL
)

echo "$config_content" > "$config_file"

ln -s "$config_file" "/etc/nginx/sites-enabled/"

nginx -t && systemctl reload nginx

echo "Nginx configuration for $deployment_path completed."

read -p "Do you need a certificate? [YES/no]: " install_certificate
case "install_certificate" in
    "YES")
        echo "Getting that sweet certificate"
        source setup_certificate.sh $domain
        ;;
    "no")
        echo "That will be all."
        ;;
    *)
        echo "That won't work either."
        ;;
esac
;;
