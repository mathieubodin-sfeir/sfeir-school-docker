# Lab 2 - Your first docker images

## Create an image from a running container

### Tips

- Use the `docker commit`

### Make our image

1. Run `nginx` image detached with param `-p 8080:80` named `mynginx1`
2. Check that the nginx page (localhost:8080)
3. Run a shell without stopping the Container
4. Update the file `/usr/share/nginx/html/index.html` in the container
5. Check that the nginx page has been updated (localhost:8080)
6. Create an image named `my_awesome_image`
7. Run the new image
8. Check that the modifications are still present (localhost:8080)
9. Check the layer with the `docker history` command

### Tag our image

1. Tag your image with the tag `my_awesome_image:1.0`
2. List your docker images
   1. What do you see?
3. _(Optional — requires a Docker Hub account)_ Push your image to a registry:
   1. Tag your image as `<dockerHubId>/my_awesome_image:1.0`
   2. Log in with `docker login`
   3. Push with `docker push <dockerHubId>/my_awesome_image:1.0`
