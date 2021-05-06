## crash during using ipython in tensorflow model
crash with error msg `AttributeError: 'TypeError' object has no attribute 'tb_frame'`
fix:https://github.com/ipython/ipython/issues/12677
pip install jedi==0.17.2
