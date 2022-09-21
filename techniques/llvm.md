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

# StringRef
it's essentially just a pointer pointing to a string(although std::string's content is allocated on the heap).
If you string goes out of scope, the pointer itself will also be invalid.

# type duplicates:
this blogs says it all
https://lowlevelbits.org/type-equality-in-llvm/
The problem I have is that, I'm creating a new struct type within my pass(so it's not created by the source code), and even with this, the IR is generating duplicated types for each function.
I later found out it is because the pass I'm writing is a function pass, thus, the same type is created everytime a new function is analyzed. I solved this by only calling this struct creating function only once, instead of everytime a function is analyzed.

## instrument and cross-compilation:
it should be pretty common situation where you wanto to cross compile(e.g., to ARM) and do a pass(e.g., instrumentation).
I tried to use the one-liner initially e.g., through `clang -Xclang load -Xclang <my pass> <architecture specific flags`, for all clang 9, 10, 11, 12(because it's based on the legacy pass manager), it crashed inside my pass, due to some weird pointer pointing to invalid memory, and that pointer is dereferenced inside my code by llvm(not by my code). More specifically, I imported some function prototypes(those function are defined by runtime) through `M.getOrInsertFunction`, these functions's callee's UseList(which is a pointer is messed up if you use the one-liner).
So I was forced to try to seperate this one-liner into different stages:
1. generate the IR
2. instrument the IR
3. compile the IR into ARM object file
And I specify all the flags just to stage 1, for 2, 3 it's just a few flags(e.g., load the pass e.t.c, ask `llc` to generate obj file), and it worked.


### Observation:
As clang-12 works with the one-liner(compiled to X64, with the instrumentation pass), but when I added optimization flag(e.g., -Oz), the same problem occurs. Although this one is different from the previous "pointer being messed up" one, as this is due to , the module initialization is called twice, thus resulting in 2 different runtime structure being created, which subsequently results in the type for the SymID struct being created twice, and the send one's name, unsuprisingly becomes"SymID.0" which fails my assertation in the program which asserts it to be "SymID". I guess this is because me adding the "-Oz" flags makes the whole pipeline called twice? I don't see porting to a new pass manager can solve this problem
