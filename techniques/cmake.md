## generate compile command
```
-DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```
generates compile_commands.json for each compiling unit
and modify the command for generating certain file

## cmake building llvm when run-time shared library not found
build llvm pass shared library with 
```
-L<path to directory of libz3.so> -lz3
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
and the directories to look for in runtime is specified by `-rpath`
However, since llvm overwrites `-rpath` with
```
set(_install_rpath "\$ORIGIN/../lib${LLVM_LIBDIR_SUFFIX}" ${extra_libdir})

set_target_properties(${name} PROPERTIES
                        BUILD_WITH_INSTALL_RPATH On
                        INSTALL_RPATH "${_install_rpath}"
                        ${_install_name_dir})
```
defined in 
`/lib/cmake/llvm/ADDllvm.cmake`
I'm not able to modify that `-rpath` to include `<path to libz3.so>`

So either place this libz3.so under `$ORIGIN/../lib`(with `$ORIGIN` being the <llvm compiled shared library>)
or compile a static library for z3, so that the link will not be at runtime.

BTW, to see how `-rpath` is defined, use
```
readelf -d <compiled llvm pass shared library>
```

Also note that, `-lz3 -L<path to the directory libz3.so>` only tells the linker that libz3.so is here.
If this shared library is linked in run-time, `-rpath` must be modified accordingly.

Also note `-lz3 -L<path to the directory of libz3.so>` is when you do 
```
link_directories("${DEPS_Z3_DIR}/bins/lib")
link_library(z3)
```
However, with 
```
find_library(Z3_LIBRARY z3 HINTS "${DEPS_Z3_DIR}/bins/lib/")
target_link_libraries(KSym ${Z3_LIBRARY})
```
will add the full path to libz3.so to the end of the linker commandline,
which has the same effect here with `-lz3 -L<path to directory of libz3.so>`
which is, cannot find `libz3.so` at run time since `-rpath` is not modified.
and `find_library+target_link_libraries` is preferred compared to `link_directory+link_library`
as `link_directory`might confuse the linker, and since`target_link_libraries` requires full path to the library thus don't have the problem

the link.txt can be found at `CMakeFiles/KSym.dir/link.txt`

## statically link a library
1. this library needs to be position independent code
2. when you link_directories, and there are dynamic lib as well as static lib, e.g. libz3.a  libz3.so, it seems, when you say 'link_libraries'/'target_link_libraries' later , cmake will assume you mean the dynamic one, so it will not statically link the static library even if it's there.

## -DCMAKE_PREFIX_PATH
```
Specifies a path which will be used by the FIND_XXX() commands
```

```

## generate IR when compiling
CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DCMAKE_C_FLAGS=-flto -DCMAKE_CXX_FLAGS=-flto

## generate build command
CMAKE_EXPORT_COMPILE_COMMANDS=True

## output build/link command
`make VERBOSE=1`

## find_library
`
find_library(
    lib_name_var
    NAMES LIB_FORMAL_NAME
    HINTS "${PROJECT_SOURCE_DIR}/deps/findfirst/build"
)
`
if LIB_FORMAL_NAME not found, the var ${lib_name_var} will be set to "lib_name_var-NOTFOUND"
