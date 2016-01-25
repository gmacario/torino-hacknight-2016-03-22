#!/bin/bash

set -e

if [[ "${VM}" = "" ]]; then
    # If VM is not defined, try setting it to active docker-machine
    # otherwise just pick a default name
    VM=$(docker-machine active) || VM=torino-hacknight
fi
[[ "${VM_NUM_CPUS}" = "" ]] && VM_NUM_CPUS=1
[[ "${VM_MEM_SIZEMB}" = "" ]] && VM_MEM_SIZEMB=1024
[[ "${VM_DISK_SIZEMB}" = "" ]] && VM_DISK_SIZEMB=10000

# docker-machine ls

if docker-machine ls | grep ${VM} >/dev/null; then
    echo "WARNING: Docker machine ${VM} exists, skipping docker-machine create"
else
    echo "INFO: Creating VirtualBox VM ${VM} (cpu:${VM_NUM_CPUS}, memory:${VM_MEM_SIZEMB} MB, disk:${VM_DISK_SIZEMB} MB)"
    docker-machine create --driver virtualbox \
      --virtualbox-cpu-count "${VM_NUM_CPUS}" \
      --virtualbox-memory "${VM_MEM_SIZEMB}" \
      --virtualbox-disk-size "${VM_DISK_SIZEMB}" \
      ${VM}
fi
if docker-machine status ${VM} | grep -v Running >/dev/null; then
    docker-machine start ${VM}
fi

eval $(docker-machine env ${VM})

docker-compose build

echo "INFO: Inside the docker machine type the following command:"
echo "INFO: docker run -ti torinohacknight_mydevenv"

# See also:
# - https://github.com/arduino/arduino-builder#building-from-source

echo "INFO: Logged as root@container type the following commands:"
cat <<__EOB__
source startup.sh
__EOB__

docker-machine ssh ${VM}

# EOF
