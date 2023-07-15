FROM node:latest AS builder

RUN apt-get update && apt-get install zip

WORKDIR /app

COPY . .

RUN npm install -g webpack webpack-cli webpack-merge

RUN echo "production" > /app/server/config/application_env

RUN npm install --ignore-scripts

RUN npm run build:linux && node build/release.js

#---

FROM ubuntu:latest

WORKDIR /app

COPY --from=builder /app/dist/linux/inpx-web .

EXPOSE 12380

CMD ["/app/inpx-web", "--app-dir=/app/config", "--lib-dir=/app/data"]
