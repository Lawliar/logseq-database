## content for certain address does not match the firmware decompiled by Ghidra:
- If you are reading the content of memory (even flash i.e., code), the content can be different from what ghidra told you.
- This might be that, there are certain breakpoints that are not removed from the MCU, thus messing up all the content. 
- Reflashing the board to get rid of those breakpoint can solve this problem.

## Thumb not determined properly
- Firmware usually use thumb, but angr has a lot of code that determine if the code is in thumb simply by its address (if its least significant bit it 1, then it's thumb, otherwise it's not).
- However, there are many cases where the text is encoded in thumb, but the address's least significant bit is 0.
- In this case, you can pass "thumb=true" to step(), it seems solved the problem.