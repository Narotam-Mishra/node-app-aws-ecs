FROM node:lts

# Create app directory
WORKDIR /app

# Copy package.json and optionally package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production && npm cache clean --force

# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 6543

# Start the application
CMD ["npm", "run", "start"]