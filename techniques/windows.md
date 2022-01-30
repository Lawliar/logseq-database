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
