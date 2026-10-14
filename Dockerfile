# Use Node.js 18 on Alpine Linux for a lightweight backend image
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy dependency manifests first to improve build caching
COPY package*.json ./

# Install backend dependencies
RUN npm install

# Copy the remaining backend application files
COPY . .

# Create the directory used for SQLite database persistence
RUN mkdir -p /app/data

# Document the backend listening port
EXPOSE 5000

# Start the backend application
CMD ["npm", "start"]
