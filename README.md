# Raspberry Pi Bare Metal Environment for Docker

This is a template dockerfile and makefile for bare metal programming in Raspberry Pi.It includes the arm-none-eabi-gcc 5.3(2016 q1) and CMake 3.5.2.

## How to use
### Install Docker
You can refer to https://docs.docker.com to install the docker. If you use windows, the MingW environments are required. And the MSYS and MingW bin directories must be added to the Windows' PATH. And the make in MSYS of the MingW is also required. 

### To build:
```
make
```
or
```
make build
```

### To run interactive shell:
```
make shell
```
It will set the working directory to "/projects/workspace" which is kept in this repo.

## Note
If you want to use Raspberry Pi C++ toolchains, delete '#' to uncomment the following two lines:
```
# RUN git clone https://github.com/raspberrypi/tools.git /usr/local/env/tools
# ENV PATH /usr/local/env/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf:$PATH
```

This will add arm-rpi-4.9.3-linux-gnueabihf compiler to environments. It is required for some Raspberry Pi bare metal projects such as the Circle (https://github.com/rsta2/circle).

