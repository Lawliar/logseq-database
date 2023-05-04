## exit src/asm layout
Ctrl-x +a

## count how many times a function is called:
https://stackoverflow.com/questions/7830954/gdb-is-there-a-command-that-allows-you-to-see-how-many-times-a-function-has-bee

`
b <file:line_number or function name>
ignore <breakpoint identifier> 100000
`
after execution
`info breakpoints`

## choose to follow child or parent when fork is called
https://visualgdb.com/gdbreference/commands/set_follow-fork-mode

## connect to gdb server through TCP port
https://linuxlink.timesys.com/docs/wiki/engineering/HOWTO_Use_GDBServer
