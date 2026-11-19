FROM node:26.13.1-trixie-slim AS dependencies
WORKDIR /app
COPY package.json ./
RUN npm install --omit=dev --ignore-scripts --no-audit --no-fund --package-lock=false

FROM node:26.13.1-trixie-slim
WORKDIR /app
RUN rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx
COPY --from=dependencies /app/node_modules ./node_modules
COPY package.json index.js ./
USER node
CMD ["node", "index.js"]
