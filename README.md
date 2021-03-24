# ENAP Optimize

## Install

1. install pytorch 1.2+

2. download TensorRT 5.1.2.2+, install tensorrt python package, add TensorRT libraries to LD_LIBRARY_PATH.

3. (optional) install tvm, you need install tvm with llvm support.

## TensorRT vs TVM vs PyTorch

Environment: 

* Intel(R) Core(TM) i7-10750H CPU @ 2.60GHz
* Jetson Nano and TX2
* Geforce RTX 2060
* TensorRT 6.0.1.5(RTX) and 7.1.3.0(Jetson)
* TVM 0.8dev 
* PyTorch 1.7.1+cu101(RTX) 1.6.0(Jetson)

Measured in ms, code for benchmark: [benchmark.py](benchmark.py).

| Model    | Nano (PyTorch) | Nano (TensorRT) | TX2 (PyTorch)    | TX2 (TensorRT)    |RTX (PyTorch)     | RTX (TensorRT)    |
|----------|:--------------:|:---------------:|:----------------:|:-----------------:|:----------------:|:-----------------:|
| Resnet18 | 

## How does it work?(Tensorrt)

This converter works by attaching conversion functions (like ``convert_ReLU``) to the original 
PyTorch functional calls (like ``torch.nn.ReLU.forward``).  The sample input data is passed
through the network, just as before, except now whenever a registered function (``torch.nn.ReLU.forward``)
is encountered, the corresponding converter (``convert_ReLU``) is also called afterwards.  The converter
is passed the arguments and return statement of the original PyTorch function, as well as the TensorRT
network that is being constructed.  The input tensors to the original PyTorch function are modified to
have an attribute ``_trt``, which is the TensorRT counterpart to the PyTorch tensor.  The conversion function
uses this ``_trt`` to add layers to the TensorRT network, and then sets the ``_trt`` attribute for
relevant output tensors.  Once the model is fully executed, the final tensors returns are marked as outputs
of the TensorRT network, and the optimized TensorRT engine is built.

## How to add (or override) a converter

Here we show how to add a converter for the ``ReLU`` module using the TensorRT
python API.

```python
import tensorrt as trt
from torch2trt import tensorrt_converter

@tensorrt_converter('torch.nn.ReLU.forward')
def convert_ReLU(ctx):
    input = ctx.method_args[1]
    output = ctx.method_return
    layer = ctx.network.add_activation(input=input._trt, type=trt.ActivationType.RELU)  
    output._trt = layer.get_output(0)
```

The converter takes one argument, a ``ConversionContext``, which will contain
the following

* ``ctx.network`` - The TensorRT network that is being constructed.

* ``ctx.method_args`` - Positional arguments that were passed to the specified PyTorch function.  The ``_trt`` attribute is set for relevant input tensors.
* ``ctx.method_kwargs`` - Keyword arguments that were passed to the specified PyTorch function.
* ``ctx.method_return`` - The value returned by the specified PyTorch function.  The converter must set the ``_trt`` attribute where relevant.

## Roadmap

- [x] Deep integration between tensorrt and pytorch
- [ ] Deep integration between tensorrt and tensorflow
- [ ] Deep integration between tensorrt and mxnet
- [ ] Add support for simple tensorrt plugin creation
- [ ] Deep integration between tvm and pytorch
  - [ ] Add TVM support

