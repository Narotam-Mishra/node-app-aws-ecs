FROM node:lts

# Create app directory
WORKDIR /app

# Copy package.json and optionally package-lock.json
COPY package*.json ./

# Clean and install with force flags to resolve dependency conflicts
RUN rm -rf node_modules package-lock.json && \
    npm cache clean --force && \
    npm install --force --legacy-peer-deps
    
# Copy the rest of the application
COPY . .

# Expose port
EXPOSE 6543

# Start the application
CMD ["npm", "run", "start"]