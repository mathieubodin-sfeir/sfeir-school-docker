<!-- .slide: class="two-column" -->

## Images

- Immutable
- Stored in an image registry
- Composed of "layers", that may come from other images
- Defined by the [OCI Image Specification](https://github.com/opencontainers/image-spec)

##--##

## Container

- An instance of an image
- Isolated place where an application runs without affecting the rest of the system

Notes:

- programming metaphor: if an image is a class, then a container is an instance of a class
- Images can exist without containers
- container needs to run an image to exist

Speaker **Alexandre**
