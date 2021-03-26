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
| alexnet | 30.8 | 64 | 59.2 | 152 | 610 | 1160 |
| squeezenet1_0 | 22.4 | 49 | 274 | 890 | 352 | 1890 |  
| squeezenet1_1 | 25.1 | 237 | 54.9 | 451 | 367 | 2180 |
| resnet18 | 15.4 | 91.5 | 34.1 | 205 | 278 | 1420 |
| resnet34 | 6.43 | 51.4 | 14.2 | 117 | 173 | 833 |
| resnet50 | 7.4 | 34.3 | 15.5 | 78.7 | 132 | 715 |
| resnet101 | 3.08 | 19.9 | 6.89 | 46.3 | 71.4 | 378 |
| resnet152 | 1.97 | 12.7 | 4.56 | 31.2 | 47.4 | 44 |
| densenet121 | 5.6 | 34.5 | 13.2 | 70.6 | 54.1 | 358 |
| densenet169 | 4.29 | 27.2 | 9.69 | 54.2 | 35.1 | 215 |
| densenet201 | 3.43 | 20.7 | 8.1 | 40.5 | 29.7 | 150 |
| densenet161 | 2.13 | 13.6 | 4.5 | 30.7 | 39 | 160 |
| vgg11 | 8.9 | 5.88 | 12.8 | 41.7 | 232 | 372 |
| vgg13 | 6.53 | 14.9 | 9.4 | 33.8 | 210 | 459 |
| vgg16 | 3.19 | 11.8 | 7.05 | 27.5 | 158 | 374 |
| vgg19 | 2.59 | 10.2 | 5.83 | 23.2 | 152 | 339 |
| vgg11_bn | 5.76 | 18.7 | 9.19 | 41.7 | 210 | 500 |
| vgg13_bn | 4.05 | 14.5 | 5.83 | 23.2 | 179 | 459 |
| vgg16_bn | 3.13 | 11.8 | 6.72 | 27.3 | 149 | 387 |
| vgg19_bn | 2.55 | 10.2 | 5.31 | 23.2 | 141 | 265 |
| MobilenetV2 | 29.5 | 74 |  |  |  |  |
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

