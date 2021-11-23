FROM node:12-alpine

WORKDIR /usr/src/app

RUN apk update && apk add git

RUN git clone https://xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@github.com/falgifaisal/typescript-starter.git

WORKDIR typescript-starter

RUN npm install pm2 -g

RUN npm install && npm run build

CMD ["pm2-runtime","dist/main.js"]
