#!/bin/bash

set -e

echo "🔄 Quick update of Rozbiegana..."

source .env

echo "📥 Pulling latest changes..."
git pull origin main

echo "🔄 Restarting app container..."
docker-compose -f docker-compose.prod.yml restart app

echo "📊 Showing logs..."
docker-compose -f docker-compose.prod.yml logs --tail=50 -f app
