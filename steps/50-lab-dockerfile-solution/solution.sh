#!/usr/bin/env bash

docker build -t my_flask:1.0 .

# Optional: push to Docker Hub (requires an account)
# docker tag my_flask:1.0 <dockerHubId>/my_flask:1.0
# docker login
# docker push <dockerHubId>/my_flask:1.0

docker run -d -p 9090:9090 --name app --rm my_flask:1.0

curl localhost:9090