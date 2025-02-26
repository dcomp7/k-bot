FROM node:20

WORKDIR /app

# Instala o Chromium e dependências do Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-ipafont-gothic \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libx11-xcb1 \
    libxss1 \
    libasound2 \
    libxcomposite1 \
    libxdamage1 \
    libxrandr2 \
    fonts-liberation \
    && rm -rf /var/lib/apt/lists/*

# Configura variáveis para o Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=false \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# Copia e instala dependências
COPY package*.json ./
RUN npm ci --verbose

# Copia o código-fonte e compila
COPY . .
RUN npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]
