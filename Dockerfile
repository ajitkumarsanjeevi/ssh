# Use the official Nginx image from Docker Hub as the base image
FROM nginx:latest

# The default command to run Nginx
CMD ["nginx", "-g", "daemon off;"]
