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

## inter-lib dependency
say a executable `exe` depends on lib `a` `b` `c` and lib `a` depends on lib `a1`
the right way to specify this dependency can be as simple as
`
add_lib(a)
target_link_libraries(a a1)
add_lib(b)
add_lib(c)
add_exe(exe)
target_link_libraries(exe a b c)
`
More specifically, although when 
`
target_link_libraries(a a1)
`
a1 will not be linked into a(thus, in liba, all symbolcs from a1 will be undefined)
however, cmake will add a1 later in the linking stage whenever liba is used.
How smart.

## gracefully pass in compiler flags and liner flags
https://stackoverflow.com/questions/44284275/passing-compiler-options-cmake

## XXConfig.cmake.in
this cannot be used for cmake to find the project, this built package needs to be installed, and it will turn into XXConfig.cmake.
## Use CMAKE_INSTALL_PREFIX to install it


## print all set variables:
`
get_cmake_property(_variableNames VARIABLES)
list (SORT _variableNames)
foreach (_variableName ${_variableNames})
    message(STATUS "${_variableName}=${${_variableName}}")
endforeach()
`
this can be so helpful!
https://stackoverflow.com/questions/9298278/cmake-print-out-all-accessible-variables-in-a-script

## add_compile_options and add_link_options

make sure these two commands are added before add_executable
as stated here: https://stackoverflow.com/questions/40516794/cmake-not-applying-compile-option-using-add-compile-options
otherwise they won't take effect
