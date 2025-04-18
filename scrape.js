const puppeteer = require('puppeteer');
const fs = require('fs');

const url = process.env.SCRAPE_URL;

(async () => {
  const browser = await puppeteer.launch({ headless: true, args: ['--no-sandbox'] });
  const page = await browser.newPage();
  await page.goto(url, { waitUntil: 'networkidle2' }); 

  const data = await page.evaluate(() => {
    const quotesList = Array.from(document.querySelectorAll('.quote')).map(quote => ({
      text: quote.querySelector('.text')?.innerText || '',
      author: quote.querySelector('.author')?.innerText || '',
      tags: Array.from(quote.querySelectorAll('.tag')).map(tag => tag.innerText) || [],
    }));
    return quotesList;
  });

  fs.writeFileSync('scraped_data.json', JSON.stringify(data, null, 2));

  await browser.close();
})();
