# Raspberry Pi Bare Metal Environment for Docker

This is a template dockerfile and makefile for bare metal programming in Raspberry Pi.It includes the arm-none-eabi-gcc 5.3(2016 q1) and CMake 3.5.2.

The workspace directory will be your working directory in the container. You can create or pull new projects in this directory.

## How to use
### Install Docker
You can refer to https://docs.docker.com to install the docker. If you use Windows, the MingW environments are required. And the MSYS and MingW bin directories should be added to the Windows' PATH. And the make in MSYS of the MingW is also required. 

### To build:
```
make
```
or
```
make build
```

### To run interactive shell(Mac or Linux):
```
make shell
```
It will set the working directory to "/projects". And you can clone or create projects in the workspace directory which is kept in this repo.


### To run interactive shell(Windows):
First run the following:
```
make shwin
```

In Windows system the /projects directory will point to the C:\Users. You have to cd into your "User Name" sub-directory and create workspace fold or whatever. Otherwise will get a permission denied error.


## Note
If you want to use Raspberry Pi C++ toolchains, delete '#' to uncomment the following two lines:
```
# RUN git clone https://github.com/raspberrypi/tools.git /usr/local/env/tools
# ENV PATH /usr/local/env/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf:$PATH
```

This will add arm-rpi-4.9.3-linux-gnueabihf compiler to environments. It is required for some Raspberry Pi bare metal projects such as the Circle (https://github.com/rsta2/circle).

