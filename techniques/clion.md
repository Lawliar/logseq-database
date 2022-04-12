## External Library is a symbolic link
For example, if you install llvm through apt, its include path(defined by LLVMConfig.cmake)(sudo apt-file update) is actually a symbolic link pointing to /usr/include/llvm-10/, but this symbolic link cannot be resolved by clion, so even if you can compile the pass, but Clion's editor cannot find the llvm headers. So, I just install the llvm by myself.
