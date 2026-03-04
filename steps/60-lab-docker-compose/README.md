# Lab 6 - Docker Compose

## Create your Compose file

Create a `compose.yaml` for a Flask application (Python) that uses Redis.

### Tips

### Create your file

1. There are two files:
   1. `requirements.txt`, contains Python dependencies
   2. `app.py`, contains our Flask app that listens on port `9090`
2. Create a new directory named `myapp-compose`
3. Copy `requirements.txt` and `app.py` in `myapp-compose`
4. Run `cd myapp-compose`
5. Create a file named `compose.yaml`

### Modify the compose.yaml

1. Define 2 services:
   1. `web`
      1. Build on demand the Dockerfile
      2. Expose the port `9092:9090`
      3. Attach to the network `my-shared-network`
   2. `redis`
      1. Image: `redis:alpine`
      2. Attach to the network `my-shared-network`
2. A network `my-shared-network`

### set up the stack

1. Use the `docker compose up -d` command
2. curl the `localhost:9092`
   1. Check that the `number` of visit is incremented at each call
