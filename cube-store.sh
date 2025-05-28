Make sure your docker-compose.yml includes:
	•	cube_api
	•	cube_refresh_worker
	•	cubestore_router
	•	At least one cubestore_worker



~/Sites/node-cube main ● docker ps                                                                                                                    15:04:54
CONTAINER ID   IMAGE                     COMMAND                  CREATED         STATUS        PORTS                    NAMES
e4fb3c17ab38   cubejs/cube:latest        "docker-entrypoint.s…"   7 minutes ago   Up 1 second   0.0.0.0:4002->4000/tcp   node-cube-cube_api-1
a6d6ecf4371e   cubejs/cube:latest        "docker-entrypoint.s…"   7 minutes ago   Up 1 second   4000/tcp                 node-cube-cube_refresh_worker-1
72c703cdfd8f   cubejs/cubestore:latest   "./cubestored"           7 minutes ago   Up 1 second   3306/tcp                 node-cube-cubestore_worker_2-1
3dcd453ff979   cubejs/cubestore:latest   "./cubestored"           7 minutes ago   Up 1 second   3306/tcp                 node-cube-cubestore_worker_1-1
0a385a0130f5   cubejs/cubestore:latest   "./cubestored"           7 minutes ago   Up 1 second   3306/tcp                 node-cube-cubestore_router-1

=============================================

pre_aggregations:
  daily_rollup:
    type: rollup
    measures:
      - count
    dimensions:
      - status
    time_dimension: date
    granularity: day
    refresh_key:
      every: 1 hour

=============================================

docker-compose.yml

=============================================

docker-compose down && docker-compose up -d




=============================================

NODE_ENV=production
CUBEJS_DEV_MODE=false
CUBEJS_CACHE_AND_QUEUE_DRIVER=cubestore
CUBEJS_CUBESTORE_HOST=cubestore_router
CUBEJS_API_SECRET=your_strong_secret