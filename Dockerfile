##Dockerfile for NodeAppLICATION###
FROM node:8
LABEL Maintainer=dstadmin@in.ibm.com Name=node Version=8
USER root
EXPOSE 3000
WORKDIR /app
COPY package.json index.js ./
RUN npm install
#USER node
CMD ["npm", "start"]
