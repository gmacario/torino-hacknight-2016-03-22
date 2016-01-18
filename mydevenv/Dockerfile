# File: mydevenv/Dockerfile
#
# Development environment for https://github.com/arduino/arduino-builder

FROM golang:1.4.3

# TODO: Add recommended packages for software development
# RUN apt-get update && apt-get -y install file mc sudo tig vim

# Create a non-root user for building the software
RUN useradd --shell /bin/bash devel
USER devel

# Setup arduino-builder
RUN git clone https://github.com/arduino/arduino-builder

# EOF
