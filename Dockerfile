# Multi step docker file

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80      # Used by AWS elasticbeanstalk
COPY --from=builder /app/build /usr/share/nginx/html
