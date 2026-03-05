<!-- .slide: class="with-code"-->

# Docker compose

## Service

```yaml
services:
  frontend: ...
  backend: ...
  db: ...
```

- `services` refer to the container's configuration

Notes:

The `version` field is obsolete and ignored by Docker Compose V2+. It should be omitted from new files. Legacy files that still have it will work but may generate a warning.
It follows the [Docker Compose specification](https://docs.docker.com/compose/compose-file/)

Speaker **Mathieu**

##--##

# Docker compose

## Container image

```yaml
services:
  frontend:
    image: my-vue-app
    ...
```

- `image` refer to the container's image to use
<!-- .element: class="list-fragment" -->

Notes:

Speaker **Mathieu**

##--##

# Docker compose

## Container build

```yaml
services:
  frontend:
    build: /path/to/dockerfile/ # can also use a URL
    ...
```

- `image` can be replaced by **build** to use dockerfile
<!-- .element: class="list-fragment" -->

Notes:

Speaker **Mathieu**

##--##

# Docker compose

## Container image & build

```yaml
services:
  frontend:
    build: /path/to/dockerfile/ # can also use a URL
    image: my-vue-app
    ...
```

- Both **image** and **build** to name the images build
<!-- .element: class="list-fragment" -->

Notes:

Speaker **Mathieu**

##--##

# Docker compose

## Network

```yaml
services:
  network-example-service:
    image: busybox
    expose:
      - '80' # PORT IS EXPOSED THROUGH THE DOCKERFILE
```

```yaml
services:
  network-example-service:
    image: busybox
    ports:
      - '80:80' # PORT IS EXPOSED ON HOST
```

- Avoid collision on host

Notes:

Speaker **Mathieu**

##--##

<!-- .slide: class="with-code"-->

# Docker compose

## Network - virtual

```yaml[5,10,15|18,19]
services:
  network-example-service:
    image: busybox
    networks:
      - my-shared-network
    ...
  another-service-in-the-same-network:
    image: alpine:latest
    networks:
      - my-shared-network
    ...
  another-service-in-its-own-network:
    image: alpine:latest
    networks:
      - my-private-network
    ...
networks:
  my-shared-network: {}
  my-private-network: {}
```

<!-- .element: class="max-height" -->

Notes:

Speaker **Mathieu**

##--##

<!-- .slide: class="with-code"-->

# Docker compose

## Volume

```yaml
services:
  volumes-example-service:
    image: alpine:latest
    volumes:
      - my-named-global-volume:/my-volumes/named-global-volume # RWO
      - /tmp:/my-volumes/host-volume # RWO - HOST
      - /home:/my-volumes/readonly-host-volume:ro # RO
    ...
  another-volumes-example-service:
    image: alpine:latest
    volumes:
      - my-named-global-volume:/another-path/the-same-named-global-volume # RWO
    ...
volumes:
  my-named-global-volume:

```

<!-- .element: class="max-height" -->

Notes:

Speaker **Mathieu**

##--##

<!-- .slide: class="with-code"-->

# Docker compose

## Dependencies

```yaml
services:
  kafka:
    image: bitnami/kafka
    depends_on:
      - zookeeper
    ...
  zookeeper:
    image: bitnami/zookeeper
    ...
```

<!-- .element: class="max-height" -->

Notes:

No wait at all - if we want to wait utile load we should use `command` with custom sh script

Speaker **Mathieu**

##--##

<!-- .slide: class="with-code"-->

# Docker compose

## Environment Variables

```yaml
services:
  database:
    image: 'postgres:${POSTGRES_VERSION}'
    environment:
      DB: mydb
      USER: '${USER}'
```

<!-- .element: class="max-height" -->

- Using an **env file** (only work with `docker compose up`) with `--env-file`

```
POSTGRES_VERSION=alpine
USER=foo
```

- Before running the command

```shell
export POSTGRES_VERSION=alpine
export USER=foo
docker compose up
```

Notes:

No wait at all - if we want to wait utile load we should use `command` with custom sh script

order :

1. Compose file
2. Shell environment variables
3. Environment file
4. Dockerfile
5. Variable not defined

Speaker **Mathieu**

##--##

<!-- .slide: class="with-code"-->

# Docker compose

## Environment Variables — env_file

```
# env file (no extension needed)
DB_PASSWORD=supersecret
APP_ENV=production
```

```yaml
# compose.yaml
services:
  app:
    image: myapp
    env_file:
      - envfile
```

- File extension is **not required** — any filename works
- `env_file` is the recommended approach to keep secrets out of the compose file

Notes:

The env_file key injects variables directly into the container environment (unlike --env-file which sets variables for compose itself). Multiple files can be listed. The `required` attribute (default: true) can be set to false to make the file optional.

Speaker **Mathieu**
