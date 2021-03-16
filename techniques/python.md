# Installation
## Failed to install package on python3.6 on Ubuntu
1. Problem
```
"/usr/bin/python3.6 -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-_0xq2q7o/psutil/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-k4askr37-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-_0xq2q7o/psutil/
```
2. Solution

You guys need Python header files. On Ubuntu: 
```
sudo apt-get install python-dev
```
On RedHat like distros it should be 
```
sudo yum install python-devel
```
the same solution applies to the similar problem when install pygraphviz
and the dev package is
```
python -m pip install pygraphviz
```
# Use
## filter a list
```
x = [1,2,3,4,5]
y = [a for a in x if a % 2 == 0]
z = [a for i,v in enumerate(x) if x[i] %2 == 0]
alpha = [x[i] for i in y] filter a list according to the index
```
## filter a dict
```
{k: v for k, v in points.items() if v[0] < 5 and v[1] < 5}
```
## Conditional Calculation
```
ctuNumInHeight = picHeight // CTUheight + 1 if (picHeight % CTUheight > 0) else picHeight // CTUheight
```
## Remove while iterating
if you want to \
############################ \
for eachElement in someList: \
    if somejudge(eachElement): \
        someList.remove(eachElement) \
    else: \
        doSomethingUseful. \
############################ \
or just process one element and then drop it in case it appear again \
Above will not give what you want \
you can either do \
########################## \
for eachElement in someList[:]: \
    if somejudge(eachElement): \
        someList.remove(eachElement) \
    else: \
        doSomethingUseful. \
######################### \
or just do the remove later or before the iteration \
## Switch
```
{
    'a': 1,
    'b': 2
}.get(x, 9)
```
equals to 
```
switch(x):
{
case 'a': 1;break;
case 'b': 2;break;
default: 9;
}
```
# Debug but pdb is too slow.
Use IPython.embed()

## Cannot exit ipython interactive console?
`ctrl+d`, `exit()` and `quit()` cannot work
use `import os; os._exit(1)` instead

## built-in hash() function is randomized by default from python3.2 onward
Although in the same run, hash of the same value is the same,
across different run, hash of the same value will be different.
add set PYTHONHASHSEED=0 to disable it
https://stackoverflow.com/questions/27522626/hash-function-in-python-3-3-returns-different-results-between-sessions

## TypeError: __init__() got an unexpected keyword argument 'column'
## AttributeError: 'TypeError' object has no attribute 'tb_frame'
ipython being incompitable with jedi
reinstall jedi
https://github.com/ipython/ipython/issues/12740
pip install jedi==0.17.2

## pprint is very useful when priting complex built-in strcutures

such as list in a dict in a list in a struct e.t.c,

## pip freeze and pip install -r
when in a virtualenv, just use `pip freeze > requirements.txt` to output the packages installed
then in a new virtualenv use `pip install -r requirements.txt`

## `Python.h` not found
probably because you install python via apt, and apart from python3.7, you'll need to install python3.7-dev as well
