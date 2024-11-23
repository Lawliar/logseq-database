## UART, I2C and SPI
https://www.seeedstudio.com/blog/2019/09/25/uart-vs-i2c-vs-spi-communication-protocols-and-uses/
https://www.youtube.com/watch?v=IyGwvGzrqp8
## JTAG and boundary scan
https://embeddedinventor.com/swd-vs-jtag-differences-explained/
ttps://www.xjtag.com/about-jtag/what-is-jtag/

## alternate function mapping
to use palSetPadMode(GPIOD, 6, PAL_MODE_ALTERNATE(7) and set the function for certain GPIO pin, you will have to look at "alternate function mapping" table for a given MCU

## unable to use USB-to-serial dongle
https://unix.stackexchange.com/questions/670636/unable-to-use-usb-dongle-based-on-usb-serial-converter-chip
https://askubuntu.com/questions/1403705/dev-ttyusb0-not-present-in-ubuntu-22-04
or just
`sudo apt remove brltty`, as told by alejandro. 

## newlib did not find the definition of _write and _read or etc
So, the problem itself is kinda an old friend,
the embedded application is linked against newlib, which reuiqres you to define those things (because in embedded application, io is highly customizable). 
but, when I link the embedded application, with all other subfolders compiled as archieve (.a), it asked me to provide these symbols again. 
But when I just compile these subfolders not as archieve but as individual object files, it stops complaining. 

I guess, archiving the object files to .a, is different from linking individual object files. 
and the latter preserves more symbols?

## using clang linker to link firmware
do not do this, this is hell, at least currently is.

## incooperate llvm into building your firmware.
There is a huge motivator to use clang to build your firmware. 
One major factor is, LLVM has many passes and instrumentations that are unmatched by gcc toolchain.
However, the downside of using clang as the embedded toolchain is that, it might not work.
Some evidences that I found along this line is:
1. normal C statement in a naked function: clang will just say, this is not supported and abort, gcc will just carry on just fine.
2. newlib compatibility and libgcc: many embedded projects still use functions (e.g., __libc_init_array) which is defined in arm-gcc toolchain, even if you use clang, the chance is, you have to link against the gcc-newlib when linking, and this has problem. And this is why I said, "don't use clang's linker" in the previous problem. 

So, overall, the rule of thumb is:
use clang only for the files that have to be compiled with clang, (e.g., user code that needs instrumentation), and leave everything else to gcc. And link the gcc-compiled code against the clang-compiled code. In this way, you don't have to deal with all the drivers, assembly, startup code, ISR 's pain triggered by compiling them with clang. And you enjoy the benefits of clang's instrumentation. 

To do that, simply 1. build your user code(compiled with clang) with one cmake project(via add_library), build the library, then, compile your project normally with clang(another cmake project, but add_executable), then link them together.


## NXP board myth:
- the NXP board is freedom kit, with MK66FN MCU (on-board segger debugger).
1. I tried to connect it to segger flasher, it keeps saying cannot connect to segger target, even if, the segger target is shown in "lsusb". Then, I keep power cycling, sometimes, the segger target would disappear, and you see some error messages from dmesg, but I just keep power cycling, after 3 or 4 times, it worked, and the board is flashed.
2. Then I proceed to run the firmware (with freeRTOS), and it did not work, connected to gdb, saw a hard fault, caused by initializing the  pxNewTCB->pxStack, which is pointed to 0x200(on the flash) for some reason. Not sure the cause, so I just keep power cycling. Then it worked. 


## 1. quit serial port terminal
`CTRL` + `]`


## pyserial
after install pyserial, use `python -m serial.tools.list_ports`
and serial.tools.miniterm

## want to debug a variable, but it got optimized away?
// Disable optimizations for this function so "frame" argument
// does not get optimized away
__attribute__((optimize("O0")))
void watchdog_fault_handler_c(sContextStateFrame *frame) {}

## gdb reset the board
mon reset

## write to RAM and read after reboot.
Even though RAM is not reset between reboot, so you can use spared RAM to store some information. 
However, since, you write to the RAM right before the reboot.
That write might be cached and never touched memory. 
Then the board reboots, when resets the cache, and the information is lost.


## how to dictate where the array or function goes to:
the array is defined like this:
const uint8_t DRIFT_LOOKUP_TABLE[1015] __attribute__((section(".ram"))) ={
...
}
then, make sure, this .ram section appears in the linker script
