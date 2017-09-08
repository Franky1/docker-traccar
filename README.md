# **Traccar server on Alpine Linux**

Free and Open Source GPS Tracking Platform  
Current Traccar version: **3.14**  
Official Traccar Website: **[Traccar Website](https://www.traccar.org)**  
Official Traccar GitHub Repository: **[Traccar GitHub Repository](https://github.com/tananaev)**

_____
## Status of this Repository
Latest changes in this repository were made on **2017-09-08**
#### Versions (2017-09-08)
- Current Traccar version: `3.14`
- Current Alpine Linux version: `3.6`
- Current OpenJDK/Java version: `8.131.11-r2`
- Current Maven version: `3.5.0`

#### ToDo (2017-09-08)  
- Test all bash scripts and Dockerfiles
- Rewrite bash scripts for the multi stage Dockerfiles
- Test Multistage Dockerfiles

#### Disclaimer (2017-09-08)  
- This repo is under development. ___Do not use it in this stage!___
- Dockerfiles and Bash scripts are _only drafts and are not tested yet_  
- I'm neither a Docker nor a Linux expert, so be patient...  

_____
## Docker Containers  
### Docker Containers built from sources
#### Docker Container for building latest Traccar Server from source with Maven
- Maven Container documentation: https://hub.docker.com/_/maven/
- Image is based on `maven:3-jdk-8-alpine` based on `openjdk:8-jdk-alpine` based on `alpine:3.6`

### Docker Containers built from binary packages
#### Docker Container for running Traccar Server
- Forked from GitHub https://github.com/magna-z/docker-traccar  
- Image is based on `openjdk:jre-8-alpine` based on `alpine:3.6`

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
    docker build -t traccar .
    ```

4. **Get default traccar.xml from default installation package:**  

    ```bash
    docker run \
    --rm \
    --entrypoint cat \
    traccar \
    /opt/traccar/conf/traccar.xml > /var/docker/traccar/traccar.xml
    ```

5. **Edit traccar.xml config file according to your needs:**  

    Documentation for the config file: https://www.traccar.org/configuration-file/

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
    traccar
    ```
