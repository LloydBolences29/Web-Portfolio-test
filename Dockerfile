# 1️⃣ Build stage
FROM node:20-alpine AS builder


WORKDIR /app


# Copy only the React app from your portfolio folder
COPY portfolio/package*.json ./
RUN apk add --no-cache python3 make g++
RUN npm install -g npm@11.6.2
RUN npm install


# Copy the rest of the React app source
COPY portfolio/ ./


# Build the production React app
RUN npm run build


# 2️⃣ Serve with Nginx
FROM nginx:alpine


# Copy the built files from the builder stage to Nginx public directory
COPY --from=builder /app/dist /usr/share/nginx/html


# Expose port 80 for web traffic
EXPOSE 80


# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]