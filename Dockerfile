#stage 1
FROM node:17-alpine as builder
WORKDIR /profile-app
COPY package-lock.json ./
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build