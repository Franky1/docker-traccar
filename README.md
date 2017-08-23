# Traccar server on Alpine Linux

Free and Open Source GPS Tracking Platform  
Current version: **3.13**  
Official website: https://www.traccar.org  

_____

## Docker Container  

- Forked from GitHub https://github.com/magna-z/docker-traccar  
- Based on `openjdk:jre-8-alpine`

## Disclaimer (2017-08-24)  

- This repo is under development, do not use it in this stage...
- Traccar Dockerfile and Bash scripts are not fully tested yet
- Maven Dockerfile and Bash scripts are not fully tested yet
- docker-compose.yml file is not yet done
- Bash scripts for quick installation not finished yet

_____

## Create container example:  

1. **Copy or git clone the Dockerfile to your Docker Host**

    ```bash
    git clone https://github.com/Franky1/docker-traccar.git
    ```

2. **Create work directories in Docker Host:**     

    ```bash
    mkdir -p /var/docker/traccar/logs
    ```

3. **Build your docker image:**  

    ```bash
    docker build -t traccar:3.13 .
    ```

4. **Get default traccar.xml from default installation package:**  

    ```bash
    docker run \
    --rm \
    --entrypoint cat \
    traccar:3.13 \
    /opt/traccar/conf/traccar.xml > /var/docker/traccar/traccar.xml
    ```

5. **Edit traccar.xml config file according to your needs:**  

    https://www.traccar.org/configuration-file/

6. **Run container with Traccar server:**

    ```bash
    docker run \
    --detach \
    --restart always \
    --name traccar \
    --hostname traccar \
    -p 8082:8082 \
    -p 5000-5150:5000-5150 \
    -p 5000-5150:5000-5150/udp \
    -v /etc/timezone:/etc/timezone:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/docker/traccar/logs:/opt/traccar/logs:rw \
    -v /var/docker/traccar/traccar.xml:/opt/traccar/conf/traccar.xml:ro \
    traccar:3.13
    ```
