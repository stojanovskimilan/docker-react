# Specify a base image
FROM node:alpine

WORKDIR '/app'

# install some dependencies
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

FROM nginx
EXPOSE 80

# Default command
CMD ["npm", "start"]