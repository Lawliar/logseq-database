## Print an integer in binary
```
#include <bitset>
#include <iostream>
int a = 4;
cout << bitset<8>(a)<<endl;
```
## Execution function before main
declare a function with
```
__attribute__((constructor(CONST_PRIO)))
```
## Valgrind
Massif heap profiler
## call c function from c++
remember to wrap the c header(although with the same suffix ".h") with 
```
extern "C"{
  xxx
}
```
otherwise, although the C function will be compiled into the same binary with the C++ functions,
the symbol will not be correctly resolved. As a consequence, you will have runtime undefined symbolc error.
## two AND conditions e.g. if (a && b)
always `a` get evaluated first, if a is false, then b will not be evaluated. 
## default value for function parameter
should only set the default value in the function declaration, should not be defined again in the function's implmenetation.
## if you want to see a function that failed
if you want to know how it failed, but you only know it failed after it failed, you can just replay the failure again after it failed.
## stupiest bug error
trace_it = eachInter->second.erase(trace_it);
delete(*trace_it);
