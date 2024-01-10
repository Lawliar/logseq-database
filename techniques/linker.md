##explain linker script
https://github.com/iDalink/ld-linker-script
youtube.com/watch?v=B7oKdUvRhQQ
https://blog.thea.codes/the-most-thoroughly-commented-linker-script/

## -Wl,--no-warn-mismatch
can avoid the annoying "usbd_core.o uses 32-bit enums yet the output is to use variable-size enums; use of enum values across objects may fail"

## linker explained:
https://www.mssl.ucl.ac.uk/swift/om/sw/help/man/ld.html

## IMPORTANT: many times, the error message occurred during linking is very limited, many times it is just "collect2: error: ld returned 1 exit status"
under this time, you can add "-Wl,--verbose" to your linking command, it will print the process in greater detail, and you can spot why

## an important lesson:
I am cross compiling an embedded application, originally it was compiled with gcc, now I am compiling with clang. I kept getting "collect2: ld exit with status 1",and nothing more, the binary cannot be produced. 
I looked into the strace, the binary is pretty much finished, it is just the linker decides to delete it for some reason. I looked into the source code of the linker where it decides to delete the binary, with the source code, I know, -Wl,--noinhibit-exec can overwrite the delete, so I did. And the final elf was produced. 

## a more important lesson about the RTOS
every complete firmware project has their own startup code, HAL, linker script, and unique compiling and linking flags and process. 
Some RTOS (e.g., FREERTOS) just provide task scheduling and basic functionalities, do not provide HAL.
Some RTOS (e.g., ChibiOS) provides scheduling and basic functionalities, and also provide HAL, linker script.  
When using the former, you often times uses the vendor's (STM32) HAL.
When porting to the latter, be aware of their own startup code, linker script, and unique compilation and linking symbols and flags. 
It is often unwise to stick to the vendor's HAL, startup code, linker script, and so on and so forthIt is unwise to use the vendor's linker script and startup code, but use the RTOS's HAL.
I mean, at the end of the day, maybe you can, but it takes a lot of time and efforts to debug, this very low level stuff.
It's much more time efficient to just pick a combination of things that already work and add stuff on top of it (which is not architecture dependent)
Also, consider which toolchain it uses, this is also very important


