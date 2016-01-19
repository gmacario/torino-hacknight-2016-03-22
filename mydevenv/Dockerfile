# File: mydevenv/Dockerfile
#
# Development environment for https://github.com/arduino/arduino-builder

FROM golang:1.4.3

# Add useful packages during software development
RUN apt-get update && apt-get -y dist-upgrade && apt-get -y install dos2unix file mc sudo tig vim

## Create a non-root user for building the software
#RUN useradd --shell /bin/bash devel
#USER devel

# Setup arduino-builder
RUN git clone https://github.com/arduino/arduino-builder

COPY startup.sh /go/
RUN dos2unix /go/startup.sh && chmod a+x /go/startup.sh

# EOF
