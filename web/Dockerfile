# Specify a base image
FROM node:alpine

# Set the working directory of the container
WORKDIR /app

# Install dependencies
COPY package.json .
RUN npm install

# Include application files with the image
# Note that this follows dependencies to optimize cache
COPY . .

# Run the webserver
CMD ["npm", "start"]