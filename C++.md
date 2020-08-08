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