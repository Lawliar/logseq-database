## differences between routers and gateways
https://www.router-switch.com/faq/gateway-router-difference.html
basically, although both routers and gateways serves as the go-to devices when some node within their jurisdiction is trying to send/receive packages from outside the network.
routers, as the name suggests is mainly responsible for routing the traffic, while gateways is responsible for translating between different protocols. And they can serve on different OSI layers.
## differences between hub and switch

## get your public ip without a browser
curl ipinfo.io

## use this instead of ping
mtr

## connect to wifi through nmcli

## Create new connection
## Note: find wifi interface name from 'ip link'
# shell:
nmcli con add type wifi ifname <interface> con-name NUwave ssid NUwave
nmcli con edit id NUwave

## This will open nmcli shell to configure the connection
# nmcli:
set ipv4.method auto
set 802-1x.eap peap
set 802-1x.phase2-auth mschapv2
set 802-11-wireless-security.key-mgmt wpa-eap

## Authorization (Northeastern login)
set 802-1x.identity <username>
set 802-1x.password <password>

## Save and connect
save
activate
quit

## when you are statically, configuring the IPs two machines connecting to the same switch, don't specify the gateway. 

### Following up: 
if you do have a gateway, and you use a switch to connect the gateway to other devices, you probably cannot set IP statically anymore, as the gateway needs to assign IP, so it won't accept your own IP, even if you specify the same network address and mask. 
For this case, there are a few things you can do :
- 1. instead of statically setting IP on the device side, consider logging into the gateway and reserve IP so that it is static. 
- 2. you can also automatically discover the IP, there are two ways:
    - 1. pinging all possible addresses inside the network: besides angry IP scanner, there is `nmap -sP 192.168.1.0/24`
    2. use arp. 
        1. pinging the broadcast address (e.g., '169.254.255.255'), hoping the other device will response.
        2. listen to arp messages. "sudo tcpdump arp"
