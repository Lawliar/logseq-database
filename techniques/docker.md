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
### run a container and attach
`
docker run --name ubuntu_bash -v /home/lcm/Github/indy-sdk:/home -i -t ubuntu:xenial bash
`
