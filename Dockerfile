FROM node:24.22.3-trixie-slim
WORKDIR /app
COPY package.notsafe.json ./package.json
RUN npm install --omit=dev --ignore-scripts --no-audit --no-fund --package-lock=false
COPY index.js ./
USER node
CMD ["node", "index.js"]
