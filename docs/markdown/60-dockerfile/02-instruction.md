<!-- .slide: class="with-code" -->

# Dockerfile - Instruction

## ARG

- **ARG** is used to pass argument to docker at image build
- Define default value

```dockerfile
FROM busybox
ARG version=1.0.0
```

- Overwrite of these argument at build time.

```docker
docker build --build-arg foo=some_value
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## FROM

- Initialise a new **build stage** - Define the image that will be used to create the new one. Can be available on local or in a registry
- **ARG** can be used before **FROM** and will be scoped to **FROM** only — re-declare it inside the build stage (without a value) to make it available in subsequent instructions

```dockerfile
ARG  CODE_VERSION=latest
FROM base:${CODE_VERSION}
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## LABEL

- **LABEL** allows to set metadatas for a Docker image
- Metadatas are set as key value pair.

```dockerfile
LABEL maintainer="Sophie FONFEC"
LABEL version=1.0.0
```

- **Inspect** labels using the `inspect` command

```docker
docker inspect image
```

- See [OCI pre-defined annotations](https://github.com/opencontainers/image-spec/blob/main/annotations.md)
  - `org.opencontainers.image.title`
  - `org.opencontainers.image.version`
  - `org.opencontainers.image.authors`

Notes:

We have to protect char such as space with backslash

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## COPY and ADD

- **COPY** allows to copy _local file_ to the _container_

```dockerfile
COPY file.txt /tmp/destination
```

- **ADD** allows to copy _local/remote file_ then untar it inside the _container_

```dockerfile
ADD application.tar /opt
```

- By defaut copied file are owned by root. You can specified the user/group too as long as they already exist

```dockerfile
COPY --chown=<user>:<group> <src> <dest>
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## RUN

- **RUN** allows to execute commandes on the transitive container. It make new layer

```dockerfile
RUN apt-get dist-upgrade -y
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## EXPOSE

- **EXPOSE** document the exposition of port and protocol

- Metadatas are set using the key - value format

```dockerfile
EXPOSE 80/tcp
EXPOSE 80/udp
```

- `--publish-all` option expose every port that are set by **EXPOSE**

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## VOLUME

- **VOLUME** set an mount point that will be created we the container is instantiated

```dockerfile
VOLUME /myVolume
```

Notes:

Volume created this way are managed by Docker and aren't named.

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## WORKDIR

- **WORKDIR** define the dirrectory that will be used for the next instructions
  - RUN
  - CMD
  - ENTRYPOINT
  - COPY
  - ADD

```dockerfile
WORKDIR /opt
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## USER

- **USER** set the next UID (and GID not mandatory) that will be used in:
  - RUN
  - CMD
  - ENTRYPOINT

```dockerfile
USER webserver:application
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## ENV

- **ENV** set **ENV VARIABLE** that will be available at the **EXECUTION** of the container and for the next step of the build

```dockerfile
ENV application=”my-application”
ENV environment=”development”
RUN pass secrets/${environment}/${application}
```

- You can set/override at run time

```docker
docker container run -e environment=”development” busybox
```

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## ENTRYPOINT and CMD

- **ENTRYPOINT** set the executable the container will run when instantiated

- **CMD** is used to set **default option** for **ENTRYPOINT**.

```dockerfile
FROM ubuntu
ENTRYPOINT ["bash", "-c"]
CMD ["sleep 3600"]
```

`bash -c "sleep 3600"`

Notes:

if no foreground process then the container stop

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## ENTRYPOINT and CMD

![center](./assets/images/60-dockerfile/table_entrypoint_cmd.png)

Notes:

Speaker **Alexandre**

##--##

# Dockerfile - Instruction

## Multistage

```dockerfile
FROM golang:1.7.3 as builder
WORKDIR /go/src/foo/href-counter/
RUN go get -d -v golang.org/x/net/html
COPY app.go    .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /app
COPY --from=builder /go/src/foo/href-counter/app .
USER appuser
CMD ["./app"]
```

Notes:

keep layer from last **FROM** only

Speaker **Alexandre**
