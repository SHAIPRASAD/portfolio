#stage 1
FROM node:17-alpine as builder
WORKDIR /profile-app
COPY package-lock.json ./
COPY package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#stage 2
FROM nginx:1.19.0
WORKDIR /usr/share/mginx/html
RUN rm -rf ./*
COPY --from=builder /profile-app/build
ENTRYPOINT ["nginx","-g","daemon off"]