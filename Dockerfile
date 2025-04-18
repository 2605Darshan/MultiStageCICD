FROM node:18-slim AS scraper

RUN apt-get update && apt-get install -y chromium

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

WORKDIR /app
COPY package.json .
RUN npm install
COPY scrape.js .

ENV SCRAPE_URL=https://quotes.toscrape.com/
RUN node scrape.js

FROM python:3.10-slim

WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY --from=scraper /app/scraped_data.json .
COPY server.py .

EXPOSE 5000

CMD ["python", "server.py"]
