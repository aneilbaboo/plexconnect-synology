#!/bin/bash

sudo docker network create macpublic
sudo docker network create macprivate
sudo docker-compose up -d
