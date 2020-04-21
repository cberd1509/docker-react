FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#Second Phase. NGinx copying

FROM nginx
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html