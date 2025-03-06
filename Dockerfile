# Use an official Nginx image as a base
FROM nginx:alpine

# Copy the index.html into the Nginx container
COPY index.html /usr/share/nginx/html/index.html
