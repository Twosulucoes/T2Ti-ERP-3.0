# Front React Admin do módulo Cadastros, servido pelo Caddy (HTTPS automático).
FROM node:22-alpine AS build
WORKDIR /app
COPY ["fontes/frontend/react/cadastros-React Admin.zip", "/tmp/front.zip"]
# o unzip do busybox já vem na imagem alpine
RUN unzip -q /tmp/front.zip && cd cadastros && npm ci --legacy-peer-deps --no-audit --no-fund

ARG VITE_CHAVE_CRIPTOGRAFIA
ARG VITE_VETOR_CRIPTOGRAFIA
ENV VITE_VYCANIS_SERVER=/api/cadastros
RUN cd cadastros && npm run build

FROM caddy:2.8-alpine
COPY --from=build /app/cadastros/dist /srv
COPY deploy/cadastros/Caddyfile /etc/caddy/Caddyfile
