## Change File Permissions from WSL
1. Edit or create /etc/wsl.conf
the file content:
```
[automount]
options = "metadata"
enabled = true
```

2. Reboot your wsl
```
wsl.exe -t Ubuntu-18.04 // (or other e.g. Debian)
```
or 
```
wslconfig.exe -t Ubuntu-18.04
```

## Run GUI on WSL
https://www.howtogeek.com/261575/how-to-run-graphical-linux-desktop-applications-from-windows-10s-bash-shell/

## Missing -lz when linking
```
sudo apt-get install libz-dev
```

## Must-install softwares
```
sudo apt-get install gdb
sudo apt-get install build-essential libx11-dev
```

## Ctrl+s
https://unix.stackexchange.com/questions/12107/how-to-unfreeze-after-accidentally-pressing-ctrl-s-in-a-terminal
Ctrl+s will freeze the terminal, use ctrl+q to unfreeze

## copy past in tmux 
- Copy from tmux clipboard
ctrl+b+[ join the visual copy mode, select, copy with enter, then in anther tmux pane, ctrl+b+] past.
- Copy from system clipboard
Copy by using anything(right-click mouse), then past with `Shift+ctrl+v`

## shutdown
(do not run powershell in admin mode)
wsl.exe --shutdown
### terminate
wsl.exe -t <DistroName>


## run GUI in WSL2
It seems running GUI in wsl2 is more complex than wsl,
however, WSL2 is said to be fully supporting GUI, but the release has not been there yet.

Anyway,https://github.com/microsoft/WSL/issues/4106
-  On windows side:
	1. download and install https://sourceforge.net/projects/vcxsrv/
	2. in powershell, go to the install dir, and run `vcxsrv.exe -ac`
	3. in firewall make sure vcxsrv is not blocked
- On WSL2 side:
	1. add
		```export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
		export LIBGL_ALWAYS_INDIRECT=1``` 
	to .bashrc
