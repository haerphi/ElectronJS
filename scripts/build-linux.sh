#!/bin/bash

# remove ./build/linux folder
rm -rf ./apps/linux

# remove existing app
docker rm portmanagerApp.linux --force

# build the image
docker build -t portmanagerimage.linux -f .\\DockerFiles\\linux\\Dockerfile . 

# remove old image
docker image prune -f

# start new app
docker run --name portmanagerApp.linux  -d portmanagerimage.linux

echo "Waiting for the build..."

VAR=0;
ROUND=0;

# check if the app is stil active
while [ "$VAR" -eq 0 ];
do
    APP_RUNNING=`docker ps --filter "name=portmanagerApp.linux"`
    if [[ $APP_RUNNING != *"portmanagerApp.linux"* ]]; then
        echo "Build done !"
        VAR=1;
    fi
    # 600000 = 10min
    if [[ "$ROUND" -eq 600000 ]]; then
        echo "Build took to long !"
        VAR=1;
    fi
    ((ROUND=ROUND+1))
    sleep 1
done

# copy the build folder
docker cp portmanagerApp.linux:/app/linux ./apps/linux
