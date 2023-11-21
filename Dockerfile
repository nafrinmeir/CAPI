# Use the official Nginx image
FROM nginx:latest

# Copy the compiled artifacts from the Jenkins workspace into the Nginx html directory
COPY target/*.war /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Default command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
