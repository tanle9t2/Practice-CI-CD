BACKEND=$1
ACTIVE_FILE=$2

echo "Switching Nginx to backend: $BACKEND"

# Generate updated Nginx config
sed "s|REPLACE_ME|$BACKEND|" nginx/conf.d/default.template.conf > nginx/conf.d/default.conf

# Copy to nginx container and reload
docker cp nginx/conf.d/default.conf nginx-proxy:/tmp/default.conf
docker exec nginx-proxy sh -c 'cat /tmp/default.conf > /etc/nginx/conf.d/default.conf && nginx -s reload'

# Write active version
echo "$BACKEND" > "$ACTIVE_FILE"