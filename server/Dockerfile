FROM node:17-alpine3.14

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm install
# RUN npm ci --only=production

# RUN npm build # for production

EXPOSE 5000

# CMD ["npm", "start"] # for production

CMD ["npm", "run", "dev"]