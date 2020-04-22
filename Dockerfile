FROM alpine

RUN apk add node
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build

#Second Phase. NGinx copying

FROM nginx
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html
#COPY /build /usr/share/nginx/html