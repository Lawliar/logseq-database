## generate compile command
```
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```
generates compile_commands.json for each compiling unit
and modify the command for generating certain file
## cmake building llvm when run-time shared library not found
build llvm pass shared library with 
```
-L<path to libz3.so> -lz3
```
and then 
```
ldd <compiled llvm pass shared libray>
```
most likely will get 
```
libz3.so cannot find, no such file or directory
```
this is because, libz3.so will be looked for in runtime
and the directories to look for in runtime is specified by -rpath
However, since llvm overwrites -rpath with
```
set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})

set_target_properties(${name} PROPERTIES
                        BUILD_WITH_INSTALL_RPATH On
                        INSTALL_RPATH "${_install_rpath}"
                        ${_install_name_dir})
```
defined in 
`/lib/cmake/llvm/ADDllvm.cmake`
I'm not able to modify that -rpath to include `<path to libz3.so>`

So either place this libz3.so under `$ORIGIN/../lib`
or compile a static library for z3, so that the link will not be at runtime.

BTW, to look for shared library dependency, use
```
readelf -d <compiled llvm pass shared library>
```
