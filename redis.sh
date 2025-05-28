docker run -d \
  --name redis-local \
  -p 6379:6379 \
  redis:latest

docker ps

docker exec -it redis-local redis-cli

PING, expect PONG

SET testkey hello
GET testkey

CUBEJS_CACHE_AND_QUEUE_DRIVER=redis
CUBEJS_REDIS_URL=redis://localhost:6379

docker-compose down && docker-compose up -d