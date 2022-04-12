## crash during using ipython in tensorflow model
crash with error msg `AttributeError: 'TypeError' object has no attribute 'tb_frame'`
fix:https://github.com/ipython/ipython/issues/12677
pip install jedi==0.17.2

## File "h5py/h5o.pyx", line 202, in h5py.h5o.link RuntimeError: Unable to create link (name already exists)
### it's because there is duplicate weights names
for i, w in enumerate(model.weights): 
    print(model.weights[i].name)
    model.weights[i]._handle_name = model.weights[i].name + "_" + str(i)
## tf.array in lambda
`Lambda(lambda x: yolo_boxes(x, anchors[masks[1]], classes),
                     name='yolo_boxes_1')(output_1)`
here `anchors` and `masks` are both np.array

here is one line from a model construction
but when I save this model to h5 and load, it complains anchors is a list and cannot be sliced by another list(which is masks[1] in this case)

I found out, this is a type degration, (from np.array to list)
so I force the type to np.array, as in:
`
    boxes_1 = Lambda(lambda x: yolo_boxes(x, np.asarray(anchors)[np.asarray(masks)[1]], classes),
                     name='yolo_boxes_1')(output_1)
`
and it worked.
