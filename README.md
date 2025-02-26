# K-Bot

A proof of concept for a WhatsApp customer service bot powered by GPT/OpenAI and Deepseek models. Written in Node.js/Typescript and Venom.

## How to run?

To run the bot, you will need a WhatsApp account, [Node.js](https://nodejs.org/en/), and [Docker](https://www.docker.com/products/docker-desktop/) installed.

You will also need an account and API Key from [OpenAI](https://platform.openai.com/account/api-keys).

With these in hand, you will need to create a `.env` file at the root of the project with the following variables:

```env
OPENAI_API_KEY=sk-xxx <- Your OpenAI API Key
REDIS_HOST=localhost
REDIS_PORT=6379
REDIS_DB=0
```

After that, you will need to install the project dependencies:

```bash
npm install
```

And then, run docker

```bash
docker-compose up
```

Finally, run the bot:

```bash
npm run dev
```
