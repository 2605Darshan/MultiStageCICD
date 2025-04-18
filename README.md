# 📄 ExactSpace DevOps & Cloud Assessment

This project demonstrates scraping data from a dynamic website using Node.js (Puppeteer) and hosting the scraped content via Python Flask, containerized using a multi-stage Dockerfile.

# Project Structure
ExactSpace_Assessment/ ├── scrape.js # Node.js Puppeteer scraper 
                       ├── server.py # Python Flask web server 
                       ├── package.json # Node.js dependencies 
                       ├── requirements.txt # Python dependencies 
                       ├── Dockerfile # Multi-stage Dockerfile 
                       └── README.md #

Project documentation

# Setup Instructions

# 1. Clone or Transfer the Repository
git clone https://github.com/2605Darshan/MultiStageCICD.git
cd ExactSpace_Assessment

# 2. Install Docker
sudo apt update
sudo apt install docker.io
sudo systemctl start docker
sudo systemctl enable docker

# 3. Build the Docker Image
docker build -t scraper-host .

# 4. Run the Container
docker run -p 5000:5000 scraper-host

# 5. Access the Web Server
http:/<localhost or public-ip>:5000/

# the Scrape URL
first I tried with https://example.com
 
to view the large date to Scrape I used this URL https://quotes.toscrape.com/

# Completed by DARSHAN SHINDE  mb: 7483125547

