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

## copy past in tmux 
- Copy from tmux clipboard
ctrl+b+[ join the visual copy mode, select, copy with enter, then in anther tmux pane, ctrl+b+] past.
- Copy from system clipboard
Copy by using anything(right-click mouse), then past with `Shift+ctrl+v`
