---
title: docker
comments: true
date: 2017-07-18 21:56:08
tags:
---
Docker
<!-- more -->

# Installation

## Ubuntu 16.04.2
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update 
apt-cache policy docker-ce 
sudo apt-get install -y docker-ce 
sudo systemctl status docker 
#Execute with Sudo (Optional) 
sudo usermod -aG docker ${USER} 
su - ${USER} 
id -nG 
#Docker Compose
https://github.com/docker/compose/releases
sudo curl -o /usr/local/bin/docker-compose -L "https://github.com/docker/compose/releases/download/1.11.2/docker-compose-$(uname -s)-$(uname -m)" 
sudo chmod +x /usr/local/bin/docker-compose 
docker-compose -v 
``` 

# CheatSheet

## Docker

```bash
docker run -p 8080:8080 -p 9990:9990 --name=CONTAINER_NAME CONTAINER_UID
docker CONTAINER_NAME ps
docker exec -it CONTAINER_NAME  /bin/bash
docker attach CONTAINER_NAME
docker kill CONTAINER_NAME
docker rm CONTAINER_NAME
# Check open ports
## Method 1 
docker exec -it CONTAINER_NAME netstat -tunelp
## Method 2 
docker inspect -f '{{.State.Pid}}' CONTAINER_NAME 
sudo nsenter -t ID -n netstat -tunelp
```

### DockerFile

```
FROM python:3.6
RUN mkdir /code
WORKDIR /code
ADD . /code/
RUN pip install -r requirements.txt
RUN ls -l
RUN pwd
CMD ["python", "/code/manage.py", "runserver"]
```

## Docker Compose

```bash
docker-compose up -d
docker-compose down 
```

### Docker Compose YML
```
---
version: "2"

services:
  our-app:
    build: ./service_providers
    environment:
      - MODE=dev
      - ELASTICSEARCH_HOST=127.0.0.1
      - ELASTICSEARCH_PORT=9200
    volumes:
      - .:/service_providers
    depends_on:
      - elasticsearch
      - rabbitmq
    ports:
      - "9090:9090"
    dns:
      - 8.8.8.8
      
  rabbitmq:
    image: rabbitmq:3.6.1-management
    environment:
      - RABBITMQ_DEFAULT_USER=admin
      - RABBITMQ_DEFAULT_PASS=admin
    ports:
      - "8023:15672"
      - "80:24:5672"
    dns:
      - 8.8.8.8

  elasticsearch:
    image: elasticsearch:5-alpine
    restart: unless-stopped
    command: elasticsearch -Etransport.host=127.0.0.1
    environment:
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ports:
      - "9200:9200"
      - "9300:9300"
    volumes:
      - ../data:/usr/share/elasticsearch/data
    dns:
      - 8.8.8.8
```