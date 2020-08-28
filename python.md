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
