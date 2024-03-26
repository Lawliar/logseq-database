## docker inside wsl2
basically, you should install docker within windows instead of wsl and expose windows's docker to wsl
https://docs.docker.com/docker-for-windows/wsl/
## basic operations:
### start and enter an exited container:
`
docker start  `docker ps -q -l` # restart it in the background
docker attach `docker ps -q -l` # reattach the terminal & stdin
`
### attached to a container that is running
`
docker exec -it [container-id] bash
`
### attach to a container as root
docker exec -u 0 -it [container-id] bash

### run a container and attach
`
docker run --name ubuntu_bash -v /home/lcm/Github/indy-sdk:/home -i -t ubuntu:xenial bash
`

### app running inside container connecting to localhost
instead of using `localhost` as the ip address, use `host.docker.internal` instead.
Since container has its own network interface, "localhost" or "127.0.0.1" are not the same as outside the container


### docker bind to tcp 4 ports
docker will expose container's port to the host tcp6 port even if the port inside the container is tcp 4.
fix this by adding `-p 127.0.0.1:port1-port2:port1-port2` at `docker run`
related discussion:
https://github.com/moby/moby/issues/2174

### listen to host port on the container
- EXPOSE port in the dockerfile
- -p <hostip>:<containerip>
- in the app(inside the container) use `0.0.0.0` instead of `127.0.0.1`
https://stackoverflow.com/questions/39525820/docker-port-forwarding-not-working


### docker without sudo
$ sudo groupadd docker
$ sudo usermod -aG docker $USER
$ newgrp docker 
then reboot

### you mount some dir into the container, and inside the container, you create some folder, since the folder is created under root inside the container, when you edit it outside the container, it also requires root.  Now, in order for a easy access, you just chown the folder -R for the folder created inside the container. 

## re-direct stdin stdout from the container to the terminal
use `-a stdin -a stderr -a stdout` to `docker run` in this way, if you did any redirect inside the container, it will be printed out to the terminal instead of writing into somefile inside the container

## docker network:
https://docs.docker.com/network/network-tutorial-standalone/

## docker cannot resolve dns:

https://medium.com/@faithfulanere/solved-docker-build-could-not-resolve-archive-ubuntu-com-apt-get-fails-to-install-anything-9ea4dfdcdcf2

## docker system df: local volume still exist after docker volume prune
https://stackoverflow.com/a/40654726/7244310

## use docker ce without docker desktop as according to some people docker desktop sucks
### MacOS
- use colima as the runtime https://github.com/abiosoft/colima
- install buildx https://github.com/fullheart/my-dev-env/blob/main/osx/docker/colima/install_latest_buildx.sh
Not sure about anything else, it is indeed faster than docker desktop.

## bypass usb to docker container:
### MacOS:
- https://github.com/docker/for-mac/issues/900
- in one word, no luck. Use usb to ip. 