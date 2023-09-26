## clipboard history
win + v
## snipshot
shift + win + s
## win key doesn't work
exit game mode
## win + tab
can create and switch between desktop, what alien technology is this??

## windows remote desktop connection + xrdp on ubuntu rocks
just remember, be sure to use a different account

## share folder between windows and linux with the windows being the host
https://www.maketecheasier.com/mount-windows-share-folder-linux/
### share folder through ethernet 
https://unix.stackexchange.com/questions/251057/can-i-connect-a-ubuntu-linux-laptop-to-a-windows-10-laptop-via-ethernet-cable
in short use ifconfig on windows to check its IP address
and use manual mode on ubuntu to make sure it's on the same segment as the IP on windows w.w.w.x

## windows wake from sleep on its own
### check the reason 
- run cmd on privledge mode
- `powercfg -lastwake`
https://www.pcmag.com/how-to/stop-your-computer-from-randomly-waking-up-from-sleep-mode
### typical fixes:
#### forbid network device from waking the PC by configuring its power management in device management
https://docs.microsoft.com/en-us/answers/questions/189406/windows-10-waking-up-from-sleep-on-its-own.html
#### disable timer waking
https://support.microsoft.com/en-us/topic/pc-automatically-wakes-from-sleep-mode-ii-5b98d03e-427b-b007-046a-3db8ebe2c2a2 


## PROCESS EXIT with code 1 or WSL2 distro failing to startup with code 4294967295
most likely in my setting it's because I'm exporting remote linux's filesystem to my WSL2,
and through either 1. /etc/fstab or 2. I automatically mount it in my .bashrc, anyone of these 2 failed.
This caused this problem.

What you should do is 
1. make sure everything is fine on the linux side(ethernet cable is not loose, it's pingable)
2. https://github.com/microsoft/WSL/issues/4899
run `netsh winsock reset` as admin, and then reboot.

## 网易云输出设备：
为什么一定要选“WaveOut: Microsoft Sound Mapper”?

## copy paste between local windows and remote machine did not work through remote desktop connection:
https://cloudzy.com/blog/copy-paste-not-working-in-rdp/

## wifi cannot show:
https://www.youtube.com/watch?v=PupMFBL39RI

## when installing windows, cannot format/create new partition
https://www.youtube.com/watch?v=tgQ-KP0Zh8U
also, if the problem persists, instead of deleting and newing a partition, 
there is likely to be a small partition, (the big one you try to create a new partition on/formatting is partition 1, and there is a small partition 0), you can try to format that one, and then extend, (it will eat the big one), then you can format later 
