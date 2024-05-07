# 1. Build Docker Image

Select your docker (check the [table](#3-available-dockers) of available dockers) and run:

```sh
expot DOCKER=<docker_name>
cd $DOCKER
docker build -t $DOCKER .
```

# 2. Run Docker

Inside the desired folder, run:
``` sh
docker run --rm -it -u root -v "$(pwd):$(pwd)" -w "$(pwd)" $DOCKER
```

For instance, to build a linux image (on root directory):

```sh
git clone https://github.com/Diogo21Costa/evaluation-guests.git
cd evaluation-guests

docker run --rm -it -u root -v "$(pwd):$(pwd)" -w "$(pwd)" $DOCKER
bash build_linux.sh
```

#  3. Available Dockers


| Docker                 | Description                                                        | shell |
| ---------------------- | ------------------------------------------------------------------ | :---: |
| [bao](/bao/Dockerfile) | Include support to develop & deploy solutions using bao hypervisor |  zsh  |