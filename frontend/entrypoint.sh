#!/bin/sh

# /entrypoint.sh

# Entrypoint for the frontend with Nginx

# Check if the build directory exists
if [ ! -d "dist" ]; then
    echo "Frontend has not been built yet. Building..."
    npm run build
else
    echo "Frontend build already exists. Skipping..."
fi

# Start Nginx
echo "Starting Nginx..."
nginx -g "daemon off;"
