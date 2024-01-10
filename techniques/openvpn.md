## auto start openvpn after reboot
https://askubuntu.com/a/1012360/803553

## check if vpn client is connectecd to the server
ip route show

## set up openvpn server
https://www.cyberciti.biz/faq/howto-setup-openvpn-server-on-ubuntu-linux-14-04-or-16-04-lts/

## open vpn unstable over wifi:
I installed open media vault (serving through the wifi interface of my home network).
I installed openvpn over it, but, openvpn connection is not stable (more specifically, it stopped workig (e.g., not pingable) after 3-4 hours even minutes), but it worked when restarted.
I thought about 3 options:
1. open media vault overwrites something that interrupts the connection
2. openvpn reconnects from time to time (refresh session key or something like) and somehow failed (due to that I didn't configure any firewall rules)
3. and finally, openvpn did not work too well with wifi (I actually don't know where this comes from)，maybe wifi goes to "stand-by" mode whick interrupts the openvpn session

The fact that, it worked for sometime and stopped working after arbitrary amount of time, makes me think that wifi is the culprit, so I connect a ethernet cable to my omv nuc, and reconfigure it to use the ethernet interface, instead of wifi, it seems start working. 

### restart vpn connection from client
sudo systemctl restart openvpn@<your config name>.service
or just type openvpn@ and auto complete

### stop openvpn connection:
sudo killall openvpn
### start openvpn connection:
openvpn --config /etc/openvpn/<>.conf

### restart vpn service on the server
https://forums.openvpn.net/viewtopic.php?t=8285
systemctl list-units --type service
systemctl status openvpn-server@server.service
systemctl restart openvpn-server@server.service


### tunnel split
add 
'
route-nopull
route 10.8.0.0 255.255.0.0
'

the first line specify not to pull any route information from the server
the second line specify which IPs need to route to the VPN server.

to the client config file

you can see this works by noting that `ip route` will not default to tun0
you can also verify this by wiresharking your internet access
also verify through access www.whatismyip.com
