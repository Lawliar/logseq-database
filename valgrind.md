## mem leak
valgrind --tool=memcheck --leak-check=full
## mem error
valgrind --tool=memcheck
## vgdb
in one shell, run valgrind
```
valgrind --leak-check=full/--tool=massif --vgdb=yes --vgdb-error=0 ./prog <para>
```
in another shell(basically follow the instructions given by the first shell)
```
gdb prog
```
```
target remote | /usr/lib/valgrind/../../bin/vgdb --pid=30632
```
then you can use valgrind provided fancy options


then you can set breakpoints just like gdb,
then for example, at the point where you want to take a snapshot of your heap,
type ,`monitor detailed_snapshot [filename]`
after the massif file was dumped, use ms_print to make it more readable
