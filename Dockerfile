FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# buld is in /app/build on container

FROM nginx
COPY  --from=builder /app/build /usr/share/nginx/html