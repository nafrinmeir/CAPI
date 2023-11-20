# Use an official Nginx base image
FROM nginx:latest

# Remove the default Nginx configuration
RUN rm -v /etc/nginx/nginx.conf

# Copy your custom Nginx configuration to the container
COPY nginx.conf /etc/nginx/

# Copy the built project files to the Nginx web root
COPY dist/ /usr/share/nginx/html/

# Expose the port that Nginx will run on
EXPOSE 8010

# Command to start Nginx
CMD ["nginx", "-g", "daemon off;"]
