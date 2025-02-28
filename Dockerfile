# Use Node.js Alpine (or another version)
FROM node:18

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your app files
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Build application
RUN npm run build

# Start the NestJS application
CMD ["node", "server.js"]
