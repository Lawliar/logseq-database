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