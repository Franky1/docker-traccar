docker run \
--rm \
--entrypoint cat \
traccar \
/opt/traccar/conf/traccar.xml > /var/docker/traccar/traccar.xml
