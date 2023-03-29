## pdftk
https://www.joho.se/2020/10/01/pdftk-and-php-pdftk-on-ubuntu-18-04-without-using-snap/
## "authentication required" window won't disappear even if the passwd is entered
https://www.reddit.com/r/gnome/comments/fscvql/comment/g2o8vsq/?utm_source=share&utm_medium=web2x&context=3
`alt+f2` and then `r`

## add other package installation support for apt
it looks like, in, say a container, `dpkg --print-foreign-architectures` is turned off by default,
in order to install i386 package, you have to add it by `dpkg --add-architecture i386`, then `apt update`
then you can `apt install libz3-dev:i386`
https://www.linode.com/community/questions/19916/how-do-i-enable-32-bit-support-on-my-64-bit-os

## Never FUCKING Shutdown Ubuntu through physical button. You will regret.
more specifically, you won't be able to login the GUI. Likely you will enter recovery mode and do fsck, but it's too much pain, just shutdown through software

## login and black screen:
ctrl+alt+f5(or whatever f key) to login and then reboot

## search for executable among apt
https://askubuntu.com/questions/257905/how-can-i-tell-which-package-an-executable-came-from
`apt-file` rocks

## windows remote access exit right after I put in the credential
it turns out gnome seems fucked up
I switched to xfce4 through:
`sudo apt install xfce4
sudo update-alternatives --config x-session-manager`
although the UI looks uglier, but 
https://askubuntu.com/a/1390749/803553

After gnone is fucked up, I am fed up with the ugly xforce, so I switch back to gnome(which crashes instantly as I connected).
I installed gnome-shell ubuntu-gnome-desktop(which to my suprise, were not installed)
I reinstall gnome-session, and switch back to it via update-laternatives, it worked.

## prevent ubuntu from hibernation
https://askubuntu.com/questions/473037/how-to-permanently-disable-sleep-suspend

## xRDP infamous authenication is required to refresh system repositories
https://c-nergy.be/blog/?p=14051
