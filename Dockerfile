from node:21-alpine3.18 as builder

WORKDIR /app

COPY package.json .

RUN npm i

COPY . .

RUN npm run build

from nginx

expose 80

COPY --from=builder /app/build /usr/share/nginx/html