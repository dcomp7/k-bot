FROM debian:10

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /tmp

# Atualiza os pacotes do sistema e instala dependências essenciais
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y \
    curl \
    wget \
    vim \
    git \
    ca-certificates \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# Configura o repositório do Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_current.x | bash -

# Instala dependências do sistema necessárias para o Chrome e bibliotecas gráficas
RUN apt-get update && apt-get install -y \
    ca-certificates \
    fonts-liberation \
    libappindicator3-1 \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgbm1 \
    libgcc1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    libvulkan1 \
    wget \
    xdg-utils \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

# Baixa e instala o Google Chrome direto, problemas com o chrome do apt
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb

WORKDIR /app
COPY . .

ENV PUPPETEER_SKIP_DOWNLOAD=true
RUN npm install --verbose
RUN npm run build

CMD ["npm", "run", "start"]
