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
or just
`sudo apt remove brltty`, as told by alejandro. 

## newlib did not find the definition of _write and _read or etc
So, the problem itself is kinda an old friend,
the embedded application is linked against newlib, which reuiqres you to define those things (because in embedded application, io is highly customizable). 
but, when I link the embedded application, with all other subfolders compiled as archieve (.a), it asked me to provide these symbols again. 
But when I just compile these subfolders not as archieve but as individual object files, it stops complaining. 

