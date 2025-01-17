# Use the official Node.js image as a base image
FROM node:14

# Create and set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Next.js application
RUN npm run build

# Expose the application port
EXPOSE 3000

# Define environment variables
ENV API_SERVER=http://localhost:3000

# Start the application
CMD ["npm", "run", "start"]
