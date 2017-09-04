docker run --name builder maven:traccar /bin/echo Temporary Traccar container runs and exits immediately... &&
docker cp builder:/usr/src/traccar/ . &&
docker stop builder &&
echo Temporary Traccar container stopped... &&
docker rm builder &&
echo Temporary Traccar container removed...
