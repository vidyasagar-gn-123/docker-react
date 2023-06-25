FROM node:16-alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install 
COPY . .
RUN npm run build

# /app/build - where we have all the created things

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html