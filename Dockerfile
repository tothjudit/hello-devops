# 1. stage: build
FROM node:20-alpine AS build

WORKDIR /app

# Csak a package fájlokat másoljuk a jobb cache miatt
COPY package*.json ./

RUN npm ci

# App forrás
COPY . .

# Buildelt statikus fájlok
RUN npm run build

# 2. stage: runtime (Nginx)
FROM nginx:stable-alpine AS runtime

# A buildelt React app bemásolása az Nginx document root-ba
COPY --from=build /app/dist /usr/share/nginx/html

# Nginx alap portja
EXPOSE 80

# Nginx indítása
CMD ["nginx", "-g", "daemon off;"]
