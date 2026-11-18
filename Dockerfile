FROM node:24.22.3-trixie-slim
WORKDIR /app
COPY package.json ./
RUN npm ci --omit=dev --ignore-scripts --no-audit --no-fund
COPY index.js ./
USER node
CMD ["node", "index.js"]
