FROM node:14

WORKDIR /app

COPY ./Server ./Server
RUN cd ./Server && npm install

COPY ./Client ./Client
RUN cd ./Client && npm install


COPY package.json .
COPY package-lock.json .
COPY webpack.config.js .

RUN npm install webpack webpack-dev-server -g

RUN npm install 

COPY . .

EXPOSE 9000

CMD ["npm","start"]