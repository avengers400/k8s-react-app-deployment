#stage 1: Build
FROM node:l8 as build
MAINTAINER xxxxx@gmail.com
WORKDIR /app   
COPY . .
RUN npm run build 

# stage 2: Deploying the app
FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]






