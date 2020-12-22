## make the headers of llvm
https://github.com/compiler-explorer/compiler-explorer/issues/1687
make install-llvm-headers
## ../../lib/libLLVMSupport.a: error adding symbols: Archive has no index; run ranlib to add one
`
I have finally found out what really caused this error.
The cmake was using gnu golden linker, and the archieve libLLVMSupport.a was composed of LLVM IR code, no wonder it went wrong.
After I switched to using ld.lld-5.0, all errors were gone.
`
