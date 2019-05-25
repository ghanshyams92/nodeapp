#Dockerfile for Node app###
FROM node:12.2.0-alpine
LABEL Maintainer=dstadmin@in.ibm.com Name=node Version=8
USER root
EXPOSE 3000
WORKDIR /app
COPY package.json app.js ./
RUN npm install
USER node
CMD ["npm", "start"]
