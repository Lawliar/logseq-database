## call graph

- cflow: https://www.gnu.org/software/cflow/manual/cflow.html
- pycflow2dot: https://github.com/johnyf/pycflow2dot

## macro's parameter being quite dumb: even if you are passing {1,2} as one parameter, c preprocessor will just recognize the comma, and think it is 2 parameters

https://stackoverflow.com/questions/47247657/c-macro-for-passing-multiple-variable-arguments

## stringification of a macro expansion. 
https://gcc.gnu.org/onlinedocs/gcc-4.8.5/cpp/Stringification.html
So, the take away is:
1. if you use your macro in quotation marks, it won't get expanded, it just don't, the preprocessor will simply do nothing.
2. So, what you wanna do, if you expand a macro and put them between quotation marks? 
3. C preprocessor provides a stringification operator # that applies only to a macro ARGUMENT. That is, it will put the quotation marks, for you, only if that is a macro argument.  
4. What if that argument is also a macro? You need to expand it first. 
