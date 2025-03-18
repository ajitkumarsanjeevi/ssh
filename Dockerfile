# Use the official Nginx image from Docker Hub as the base image
FROM nginx:latest

# Copy the custom Nginx configuration file into the container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy your website's static files to the Nginx web root directory
COPY ./html /usr/share/nginx/html

# Expose port 80 (HTTP)
EXPOSE 80

# The default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
