FROM node:12.13.0 AS build
WORKDIR /awesome_cats_frontend
COPY package*.json ./
RUN npm install
COPY public ./public
COPY src ./src
RUN npm run build

FROM nginx:1.19.6
COPY --from=build /awesome_cats_frontend/build /usr/share/nginx/html