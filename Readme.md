# 1. Build Docker Image

Inside `docker` directory run:

```sh
expot DOCKER_NAME=my_docker
docker build -t $DOCKER_NAME .
```

# 2. Run Docker

Inside the folder desired folder, run:
``` sh
docker run --rm -it -u root -v "$(pwd):$(pwd)" -w "$(pwd)" $DOCKER_NAME
```

For instance, to build a linux image (on root directory):

```sh
git clone https://github.com/Diogo21Costa/evaluation-guests.git
cd evaluation-guests

docker run --rm -it -u root -v "$(pwd):$(pwd)" -w "$(pwd)" $DOCKER_NAME
bash build_linux.sh
```

