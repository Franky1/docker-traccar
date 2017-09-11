docker run \
--tty \
--detach \
--restart always \
--name traccar \
--hostname traccar \
-p 8082:8082 \
-p 5055:5055 \
-p 5055:5055/udp \
-v /etc/timezone:/etc/timezone:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /var/docker/traccar/logs:/opt/traccar/logs:rw \
maven:traccar
