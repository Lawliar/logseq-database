## install on ubuntu:
### install library
add the repo
apt install nvidia-driver-535
apt install nvidia-cuda-toolkit
### disable secure boot
1. disable in bios
2. disable in mok: sudo mokutil --disable-validation
3. reboot
### finally verify with running nvidia-smi
