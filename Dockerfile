# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory to /app
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# Copy the current directory contents into the container at /app
COPY . .

# Build the React app for production
RUN npm run build

# Install serve to run the production build
RUN npm install -g serve

# Expose port 3000 to the outside world
EXPOSE 3000

# Run serve to serve the React app
CMD ["serve", "-s", "build"]