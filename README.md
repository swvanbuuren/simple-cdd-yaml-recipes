# Simple-cdd-yaml recipes

This repository contains example recipes for
[simple-cdd-yaml](https://github.com/swvanbuuren/simple-cdd-yaml) including
preseeds, overlays and scripts.

# Docker image build

To make sure that the host system configuration does not interfere with a
simple-CDD build, it might be useful to build the image inside a docker
container. The following lists instructions to setup such a docker image.

## Install and configure docker

First, install and configure docker. Please refer to the script [setup_docker.sh](scripts/setup_docker.sh) on how to do this.

## Dockerfile

First create a file called `Dockerfile` with the contents below. Replace
`<dist>` with the Debian version for which you'd like to build your image, e.g.
`buster`, `bullseye` or `bookworm`:

```docker
FROM debian:<dist>-slim

RUN apt-get update
RUN apt-get -y install --install-recommends simple-cdd xorriso gpg

RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user
```

## Build docker image

Build the docker image with the following command (again replace `<dist>`):
```bash
docker build -t <dist>-simple-cdd .
```

## Call simple-cdd inside docker

For repeated build attempts, it makes sense to wrap the dockerized simple-CDD
call into a bash script e.g. called `docker_simple_cdd` (don't forget to replace
`<dist>` and make the script executable using `chmod +x docker_simple_cdd`):
```bash
#!/bin/bash
ARGS="$@"
docker run -it --mount "type=bind,source=$(pwd),destination=/home/user" <dist>-simple-cdd /bin/sh -c "simple-cdd $ARGS"
```

Now you can build an image e.g. from the desktop profile by issuing:

```bash
./docker_simple_cdd --profiles desktop
```

# Testing on Qemu with UEFI support

The provided [desktop recipe](./recipes/desktop.yaml) creates a Simple-CDD
profile for an UEFI capable desktop system. While Simple-CDD [offers a qemu
option](https://salsa.debian.org/debian/simple-cdd/-/blob/master/README?plain=1#L49)
to test the installation of a CD or DVD created with Simple-CDD, it does not
support UEFI. The following shows how to boot a Qemu with UEFI support in order
to test the installation in EFI mode. 

## Prerequisites

The following setup is meant for Debian systems and was tested on Debian Bullseye.

## Preparations

In order to be able to build an ISO image, first install the required packages
for Simple-CDD:
```
sudo apt install simple-cdd xorriso
```
Then build an image from the desktop profile:
```
build-simple-cdd --profiles desktop
```
This should produce an ISO file in the folder `images`.

Please refer to the [Simple-CDD website](https://salsa.debian.org/debian/simple-cdd) and the
corresponding [Debian Wiki Simple-CDD Howto page](https://wiki.debian.org/Simple-CDD/Howto)
for more information.

## Setup Qemu

To test the installation image Qemu can be used. Install the required packages
using:
```
sudo apt install qemu-utils qemu-system-x86 ovmf
```
The package `ovmf` is required for UEFI support.

Now create some images for testing, e.g.
```
qemu-img create disk.img 10G
qemu-img create second_disk.img 10G
```
Create a bash script stored as `image_run` with the following contents (don't
forget to make it executable using `chmod +x image_run`)

```bash
#!/bin/bash
if [ $# -eq 0 ] ; then
    cdrom="-boot c"
else
    cdrom="-boot d -drive media=cdrom,readonly,file=${1}"
fi
qemu-system-x86_64 \
    -m 2048 \
    -enable-kvm \
    -cpu host \
    ${cdrom} \
    -drive if=pflash,format=raw,readonly,file=/usr/share/ovmf/OVMF.fd \
    -drive format=raw,file=disk.img \
    -drive format=raw,file=second_disk.img
```

## Testing using Qemu

Test the Simple-CDD installation by issuing (replace `<simple-cdd-iso>` with the
iso file as created by Simple-CDD):
```
./image_run images/<simple-cdd-iso>
```
After the installation has been completed succesfully, test out the installed
desktop system using 

```
./image_run
```

# License

An MIT style license applies for simple-cdd-yaml-recipes, see the
[LICENSE](LICENSE) file for more details.
