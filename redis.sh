docker run -d \
  --name redis-local \
  -p 6379:6379 \
  redis:latest

docker ps

docker exec -it redis-local redis-cli

PING, expect PONG

SET testkey hello
GET testkey


# ~/Sites                                                                                                                                                             14:46:31
# docker exec -it redis-local redis-cli
# 127.0.0.1:6379>
# 127.0.0.1:6379>
# 127.0.0.1:6379>
# 127.0.0.1:6379> PING
# PONG
# 127.0.0.1:6379> SET testkey hello
# OK
# 127.0.0.1:6379> GET testkey
# "hello"
# 127.0.0.1:6379>

CUBEJS_CACHE_AND_QUEUE_DRIVER=redis
CUBEJS_REDIS_URL=redis://localhost:6379

docker-compose down && docker-compose up -d