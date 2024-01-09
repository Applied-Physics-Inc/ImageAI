# syntax=docker/dockerfile:1

# Use an official Node.js runtime as the base image
FROM node:20
#FROM node:21

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y git

# Set the working directory
WORKDIR /app

# Copy the local package files to the container
COPY package*.json ./

# Copy package.json, tsconfig.json and the local project files to the container
COPY ./package.json ./
COPY ./tsconfig.json ./
COPY . .

# Install project dependencies
RUN npm install --legacy-peer-deps

# Use a non-root user to run the application
USER node

# Set environment variables (you can adjust these as needed)
LABEL org.opencontainers.image.source="https://github.com/Applied-Physics-Inc/ImageAI"
ENV PORT 3000
#ENV HOST 0.0.0.0

# Expose the port the app will run on
EXPOSE 3008

# Define the command to run the app
#CMD ["npm", "start"]

# Start Application
CMD npm run dev