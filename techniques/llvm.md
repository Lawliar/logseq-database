# llvm use error

## make the headers of llvm
https://github.com/compiler-explorer/compiler-explorer/issues/1687
make install-llvm-headers
## ../../lib/libLLVMSupport.a: error adding symbols: Archive has no index; run ranlib to add one
`
I have finally found out what really caused this error.
The cmake was using gnu golden linker, and the archieve libLLVMSupport.a was composed of LLVM IR code, no wonder it went wrong.
After I switched to using ld.lld-5.0, all errors were gone.
`
## if compile with -g, generated bitcode will have debug symbols

## header missing might be reported as  "/mnt/c/Users/lcm/Documents/llvm/llvm-project-main/llvm/include/llvm/IR/Function.h:542:63: error: no member named 'WriteOnly' in 'llvm::Attribute'", what the heck?

## If you expand -std-link-opts, you get:

Pass Arguments: -targetlibinfo -datalayout -notti -jstti -no-aa -tbaa -scoped-noalias -assumption-tracker -basicaa -verify -verify-di -ipsccp -globalopt -constmerge -deadargelim -domtree -instcombine -basiccg -inline-cost -inline -prune-eh -globalopt -globaldce -basiccg -argpromotion -domtree -instcombine -lazy-value-info -jump-threading -domtree -sroa -basiccg -functionattrs -globalsmodref-aa -domtree -loops -loop-simplify -lcssa -licm -memdep -mldst-motion -domtree -memdep -gvn -memdep -memcpyopt -dse -loops -scalar-evolution -loop-simplify -lcssa -indvars -loop-deletion -branch-prob -block-freq -loop-vectorize -scalar-evolution -alignment-from-assumptions -instcombine -lazy-value-info -jump-threading -simplifycfg -globaldce -verify -verify-di -print-module

## opt -dot-cfg built-in.ll
will write cfgs for all functions into seperated files, super useful!

# llvm programming tricks
## ValueID
`value` is a foundamental class, which is a super class of all the important class like `Instruction` and `Function`
It distinguishes different actual instantiated subclassed by `enum llvm::Value::ValueTy`.
So when you look at a value, its SubclassID field(unsigned char) should tell you what really the subclass is.
And an interesting fact based on this is, the value representing `Instruction` is always the biggest number in this enumeration.
Saying so isn't very accurate, since `Instruction` itself also uses the exact same field to distinguish different Instructions like AddInstruction, GEP.
All these different instructions are enumerated from the enumerator of `Instruction` on-ward. This is also why `Instruction` should be the biggest value in the previous enumeration.
