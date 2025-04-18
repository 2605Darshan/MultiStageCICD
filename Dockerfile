# Stage 1: Scraper
FROM node:18-slim AS scraper

# Install Chromium
RUN apt-get update && apt-get install -y chromium

# Set env to skip Puppeteer Chromium download
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Set working dir and copy files
WORKDIR /app
COPY package.json .
RUN npm install
COPY scrape.js .

# Run the scraper
ENV SCRAPE_URL=https://quotes.toscrape.com/
RUN node scrape.js

# Stage 2: Server
FROM python:3.10-slim

# Install Python deps
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy scraped data
COPY --from=scraper /app/scraped_data.json .
COPY server.py .

# Expose Flask port
EXPOSE 5000

# Start the Flask server
CMD ["python", "server.py"]
