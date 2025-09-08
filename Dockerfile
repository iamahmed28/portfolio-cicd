# Step 1: Use official Nginx image as base
FROM nginx:alpine

# Step 2: Copy all website files (HTML, CSS, JS) into Nginx default folder
COPY . /usr/share/nginx/html

# Step 3: Expose port 80 (web server port)
EXPOSE 80
