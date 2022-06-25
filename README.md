# CDC Data collection

Collects daily coronavirus data from the CDC

## Requirements

- nodejs >= 16
- docker
- pm2

## Setup

1. Build typescript: `npm run build`
1. Bring up the db: `docker-compose up -d`
1. Run the node script on an hourly cron: `pm2 start services.yml`
