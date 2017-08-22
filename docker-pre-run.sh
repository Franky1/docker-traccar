docker run \
--rm \
--entrypoint cat \
traccar:3.13 \
/opt/traccar/conf/traccar.xml > /var/docker/traccar/traccar.xml
