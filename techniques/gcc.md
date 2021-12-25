## -Wxxxx

https://gcc.gnu.org/onlinedocs/gcc/Option-Summary.html

This means raise a warning if `xxx` is met
for example `-Wreturn-type` will raise a warning if a function with non-void return value has not a return statement or sth, in response, use `-Wno-xxxx` to supress it, for `-Wreturn-type` it will be `-Wno-return-type` to suppress this kind of warning.

## instrumentation with gcc
https://gcc.gnu.org/onlinedocs/gcc/Instrumentation-Options.html

## -fsanitize-coverage is ignored
it looks like it does not work well with -flto, just remove -flto and it managed to instrument
