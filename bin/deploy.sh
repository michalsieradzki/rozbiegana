#!/bin/bash

set -e

echo "🚀 Starting deployment of Rozbiegana..."

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

if [ ! -f .env ]; then
    print_error "Plik .env nie istnieje!"
    print_warning "Skopiuj .env.example do .env i wypełnij wartościami"
    exit 1
fi

source .env

if [ -z "$DB_PASSWORD" ] || [ -z "$SECRET_KEY_BASE" ] || [ -z "$RAILS_MASTER_KEY" ]; then
    print_error "Brakujące zmienne środowiskowe w .env!"
    exit 1
fi

print_status "Pulling latest changes from GitHub..."
git pull origin main

print_status "Building Docker images..."
docker-compose -f docker-compose.prod.yml down
docker-compose -f docker-compose.prod.yml build --no-cache

print_status "Starting database and Redis..."
docker-compose -f docker-compose.prod.yml up -d db redis

print_status "Waiting for database to be ready..."
sleep 15

print_status "Running database migrations..."
docker-compose -f docker-compose.prod.yml run --rm app bin/rails db:prepare

print_status "Precompiling assets..."
docker-compose -f docker-compose.prod.yml run --rm app bin/rails assets:precompile

print_status "Starting all services..."
docker-compose -f docker-compose.prod.yml up -d

print_status "Showing container status..."
docker-compose -f docker-compose.prod.yml ps

print_status "Deployment complete! 🎉"
echo ""
print_warning "Sprawdź logi: docker-compose -f docker-compose.prod.yml logs -f app"
print_warning "Sprawdź status: docker-compose -f docker-compose.prod.yml ps"
echo ""
print_status "Aplikacja powinna być dostępna na: http://$(curl -s ifconfig.me)"
