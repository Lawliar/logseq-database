## tmux-resurrect
$ git clone https://github.com/tmux-plugins/tmux-resurrect ~/clone/path
Add this line to the bottom of .tmux.conf:

run-shell ~/clone/path/resurrect.tmux
Reload TMUX environment with: $ tmux source-file ~/.tmux.conf

`prefix+ctrl+s` save all session and their layout
`prefix+ctrl+r` restore all session

## kill server
`prefix+:` + kill-server

## pane
rename window:`prefix+ctrl+,`

## session
tmux a(ttach) -dt session name
tmux ls
tmux kill-session 

## swap positions of panes
https://superuser.com/questions/879190/how-does-one-swap-two-panes-in-tmux

### looks like this swap pane does not directly swap the pane specified by the number shown by crtl+q, it has sth todo with the visit history??
## copy tmux to clipboard
https://unix.stackexchange.com/questions/131011/use-system-clipboard-in-vi-copy-mode-in-tmux
## paste inside tmux
shift + right click


## ps1 prompt not colorized 
https://unix.stackexchange.com/questions/360545/tmux-not-colorizing-ps1-prompt

## reload conf without shuting down session
tmux source-file ~/.tmux.conf
https://superuser.com/questions/580992/how-do-i-reload-tmux-configuration
