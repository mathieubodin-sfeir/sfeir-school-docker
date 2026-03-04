<!-- .slide: class="with-code" -->

# Docker compose

## Basics

> Docker Compose is a tool that was developed to help define and share multi-container applications. With Compose, we can create a YAML file to define the services and with a single command, can spin everything up or tear it all down.

- Descriptive approach of the applicative full stack
- Avoid redundancy of commands
- Yaml file
- Infra as code

Notes:

Think of Docker Compose as:

- an automated multi-container workflow
- a tool for development, testing, CI workflows, and staging environments

Speaker **Mathieu**

##--##

# Docker compose

## CLI

- `docker compose up -d` - run the container stack (detach mode)
- `docker compose ps` - check stack status
- `docker compose logs` - print stack logs
- `docker compose stop` - stop a stack
- `docker compose down` - remove stack
- `docker compose config` - check compose file

Notes:

Speaker **Mathieu**
