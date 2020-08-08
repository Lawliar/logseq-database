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

