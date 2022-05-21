#!/bin/bash

sudo docker network create macpublic
sudo docker network create macprivate
touch atvsettings.cfg
sudo docker-compose up -d
