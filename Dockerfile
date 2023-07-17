# Use the official Nginx image as the base image
FROM nginx:latest

# Copy your files into the container's web root directory
COPY CAPI/ /usr/share/nginx/html/

# Expose port 80 for HTTP traffic
EXPOSE 80
