# --------------------
# Build stage
# --------------------
FROM node:18-alpine AS build

WORKDIR /app

ARG VITE_APP_TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=$VITE_APP_TMDB_V3_API_KEY

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# --------------------
# Runtime stage
# --------------------
FROM nginx:alpine

# Remove default config
RUN rm /etc/nginx/conf.d/default.conf

# Copy our SPA config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy built app
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
