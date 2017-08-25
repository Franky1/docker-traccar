docker run --tty --name builder maven:traccar &&
docker cp builder:/usr/src/traccar/ &&
docker stop builder &&
docker rm builder
