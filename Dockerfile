FROM node:lts

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

EXPOSE 6543

CMD ["npm", "run", "start"]