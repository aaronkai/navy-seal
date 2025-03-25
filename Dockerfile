# Step 1: Build the site
FROM node:20 AS builder

# Set working directory
WORKDIR /app

# Copy project files
COPY package*.json ./
COPY . .

# Install dependencies and build site
RUN npm install
RUN npm run build

# Step 2: Serve the built site
FROM node:20-slim

WORKDIR /app

# Install static file server
RUN npm install -g serve

# Copy the built site from previous step
COPY --from=builder /app/dist ./dist

# Expose port 8080 for OpenShift
EXPOSE 8080

# Start server
CMD ["serve", "-s", "dist", "-l", "8080"]
