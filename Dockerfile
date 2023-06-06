# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (if present)
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the application code into the container
COPY . .

# Build the React app for production
RUN npm run build

# Expose the desired port (e.g., 3000)
EXPOSE 3000

# Define the command to run your app using a simple HTTP server
CMD [ "npx", "serve", "-s", "build" ]
