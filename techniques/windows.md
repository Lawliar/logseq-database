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
### mounted smb drive cannot see its size
1. there seems to be two ways to mount a smb drive, one way is to add a short cut, another one will add a identifier (e.g., Z,Y,X), the latter will give you the size. 

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

## configure win11 as a server
1. install openssh client and server, and make server automatic start
	https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse?tabs=gui
2. firewall allow PING
3. assign static IP to the ethernet interface
4. in setting->system->remote desktop, enable remote access
Then you can access the computer with the user/password of the machine that is remotely accessed

## remote login win with microsoft account
https://cmdrkeene.com/remote-desktop-with-microsoft-account-sign-in/

## windows explorer keeps working on it for dozens of seconds
https://superuser.com/a/1083969/1279549

## wake-on-lan WOL
1. enable in WOL BIOS (I did not have such a setting in my BIOS, which turned out to be fine)
	1.1 also, according to some post, you should not enable hibernation in BIOS. But I did, and it worked. I can wake the computer from hibernation even. I guess, as long as the fast startup is not enabled, it will be fine. 
2. change the network interface setting for the specific NIC
	2.1 In advanced:
		2.1 Disable "shutdown wake-on-lan"
		2.2 Disable any "green" setting (I did not have any, but some posts said so)
		2.3 Enable "Wake on magic packet" 
	2.2 In power management:
		2.1 check "allow this device to wake the computer"
		2.2 check "only allow a magic packet to wake the computer"
3. Then you can wake, remember to configure the interface to static ip, and specify both the MAC and and the static ip from the "wakeonlan" 


## if some software cannot write to the disk, and it is in another language than Windows. 
Looks like the game cannot make a save file the default language of your OS is not Japanese. If you are using windows 10: Go to Control Panel -> Clock,Language and Region -> Region ->Administrative tab -> Click on Change system locale... under the Language for non-Unicode programs to change the language the Japanese. Restart your computer and enjoy!
