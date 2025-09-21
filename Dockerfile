# Use an official Node runtime as a parent image
# FROM node:20.15.0
FROM nginx:latest

# Set the working directory inside the container
# WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
# COPY package*.json ./

# Install Angular CLI globally
# RUN npm install -g @angular/cli

# Install dependencies from package.json
# RUN npm install

# Copy the rest of the application code to the container
# COPY . .

# Build the Angular app in production mode
# RUN ng build

# Install Nginx
# RUN yum update && yum install -y nginx

# Remove default Nginx website
RUN rm -f /usr/share/nginx/html/*

# Copy the Angular build output to the Nginx html directory
COPY dist/ /usr/share/nginx/html/

# Expose the port the app runs on
EXPOSE 80


# Copy Nginx configuration
# COPY nginx.conf /etc/nginx/nginx.conf

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
