FROM node:alpine as builder
WORKDIR '/app'
RUN apk add yarn
COPY ./package*.json ./
RUN yarn install
COPY ./ ./
RUN npm run build

#Second Phase. NGinx copying

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html