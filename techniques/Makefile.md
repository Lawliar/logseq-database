## built-in variables(as they can be confusing)
https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html

## cheatsheet
https://gist.github.com/rueycheng/42e355d1480fd7a33ee81c866c7fdf78

## tricks to do version comparison (not just eq or not equal)
because make does not have "greater than" built-in, so some people use "sort"
https://stackoverflow.com/questions/3437160/greater-than-string-comparison-in-a-makefile

## -Wall enabled
sometimes, auto-generated makefile, will enable -Wall, which can fail the building process, 
what you need to do is to 
` make -n ` to output all compilation commands, locate that specific command, remove the -Wall, 
since makefile will compare the source code and the object file, now to continue to type make, the error for that fail will disappear

## addprefix
TESTINC := $(addprefix -I,$(TESTINC))
this automatically add `-I` to every front of every comma-sperated string

## -Wl
directly pass the parameters to the linker, e.g., "-Wl,--defsym=__main__stack_size__=0x400"
then this symbol will be defined in the linker script


## shared library not found
even when you `-L<libpath> -l<libname>`, when you run the binary, or ldd the binary, it still cannot find the specified lib
so, you should use `-Wl,-rpath` to append the libpath to the executable.

## when you use pattern rules to specify the build target
you have to use '%' symbol both at the target and the requisite. 
And the '%' match the same string (which they called stem).
So, if you expect % to match 'src/1.o' when you use '%.o' in the target, then the '%' will be 'src/1' and nothing else, and the requisite you provide need to match this as well, if you use '%' in the requisite, for more refer here https://www.gnu.org/software/make/manual/make.html#Pattern-Rules
