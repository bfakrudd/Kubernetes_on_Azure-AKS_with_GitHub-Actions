FROM node:18-alpine

WORKDIR /app

# Copy only package files first
COPY app/package*.json ./

RUN npm install

# Copy the rest of the source
COPY app/ .

EXPOSE 80

CMD ["npm", "start"]