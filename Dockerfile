# Serve React build with Nginx
FROM nginx:stable-alpine

# Copy built files into Nginx
COPY build/ /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
