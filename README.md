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

### To run interactive shell(Mac or Linux):
```
make shell
```
It will set the working directory to "/projects/workspace" which is kept in this repo.

### To run interactive shell(Windows):
First, thanks to this post http://stackoverflow.com/questions/30864466/whats-the-best-way-to-share-files-from-windows-to-boot2docker-vm.


- Use "C:/Program Files/Oracle/VirtualBox/VBoxManage sharedfolder \
add default -name workspace -hostpath c:/<your-project-absolute-root-path-in-windows>". 

- Or you can use GUI of the VirtualBox to add a share directory which should be named "workspace". Then restart the default VM or just restart computer. If you have problems when starting the Docker Quickstart Terminal, reinstall the vboxdrv.inf in the "C:/Program Files/Oracle/VirtualBox/drivers/vboxdrv" directory by right click it and choose install and restart your computer.

- Start Docker Quickstart Terminal.

- ssh into the Boot2Docker VM for the Docker Quickstart Terminal:
```
docker-machine ssh default
```

- Then perform the mount:

Make a folder inside the VM: sudo mkdir /workspace
Mount the Windows folder to it: sudo mount -t vboxsf workspace /workspace
After that, you can access c:/<your-project-absolute-root-path-in-windows> inside your Boot2Docker VM:
```
cd /workspace && ls
```

- exit the ssh and run:
```
make shwin
```
The interactive shell should be started.


## Note
If you want to use Raspberry Pi C++ toolchains, delete '#' to uncomment the following two lines:
```
# RUN git clone https://github.com/raspberrypi/tools.git /usr/local/env/tools
# ENV PATH /usr/local/env/tools/arm-bcm2708/arm-rpi-4.9.3-linux-gnueabihf:$PATH
```

This will add arm-rpi-4.9.3-linux-gnueabihf compiler to environments. It is required for some Raspberry Pi bare metal projects such as the Circle (https://github.com/rsta2/circle).

