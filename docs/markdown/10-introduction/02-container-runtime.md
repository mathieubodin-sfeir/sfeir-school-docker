<!-- .slide: -->

# Container Runtimes

> Runtimes are responsible of creating and running containers.

Notes:

Speaker **Mathieu**

##--##

<!-- .slide: -->

# Container Runtimes

- Docker
- Podman
- Containerd
- Cri-o
- And more

<!-- .element: class="list-fragment" -->

Notes:

Issue :

Docker uses `containerd`, which itself uses `runc`.

Speaker **Mathieu**

##--##

<!-- .slide: -->

# Container Runtimes

- Low-level runtimes run containers following the [Open Container Initiative](https://opencontainers.org/) specification
- High-level runtimes use low-level runtimes but add features like image management and APIs on top

Notes:

Low-Level: Execute container as OCI container
High-Level: More abstractions layer like API, push feature, pull feature etc.

Speaker **Mathieu**
