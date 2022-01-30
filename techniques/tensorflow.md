## crash during using ipython in tensorflow model
crash with error msg `AttributeError: 'TypeError' object has no attribute 'tb_frame'`
fix:https://github.com/ipython/ipython/issues/12677
pip install jedi==0.17.2

## File "h5py/h5o.pyx", line 202, in h5py.h5o.link RuntimeError: Unable to create link (name already exists)
### it's because there is duplicate weights names
for i, w in enumerate(model.weights): 
    print(model.weights[i].name)
    model.weights[i]._handle_name = model.weights[i].name + "_" + str(i)
