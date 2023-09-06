FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN chmod a+rwx /app/node_modules
RUN npm run build


FROM nginx
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html 
# docker run -p 8080:80 <image-name> 
# port 80 is default port that nginx serves 