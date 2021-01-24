
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
EPOSE 80
COPY --from=node:alpine /app/build /usr/share/nginx/html 
