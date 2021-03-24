| Name | Data Type | Input Shapes | enaptrt kwargs | Max Error | Throughput (PyTorch) | Throughput (TensorRT) | Latency (PyTorch) | Latency (TensorRT) |
|------|-----------|--------------|------------------|-----------|----------------------|-----------------------|-------------------|--------------------|
| enaptrt.tests.torchvision.classification.alexnet | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 4.58E-05 | 610 | 1.16e+03 | 1.58 | 0.762 |
| enaptrt.tests.torchvision.classification.squeezenet1_0 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 9.77E-04 | 352 | 1.89e+03 | 2.79 | 0.442 |
| enaptrt.tests.torchvision.classification.squeezenet1_1 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 367 | 2.18e+03 | 2.74 | 0.408 |
| enaptrt.tests.torchvision.classification.resnet18 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 5.86E-03 | 278 | 1.42e+03 | 3.12 | 0.644 |
| enaptrt.tests.torchvision.classification.resnet34 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.88E-01 | 173 | 833 | 5.89 | 1.42 |
| enaptrt.tests.torchvision.classification.resnet50 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 7.03E-02 | 132 | 715 | 7.65 | 1.42 |
| enaptrt.tests.torchvision.classification.resnet101 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 0.00E+00 | 71.4 | 378 | 14 | 2.72 |
| enaptrt.tests.torchvision.classification.resnet152 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 0.00E+00 | 47.4 | 244 | 20.9 | 3.97 |
| enaptrt.tests.torchvision.classification.densenet121 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 54.1 | 358 | 18.4 | 2.76 |
| enaptrt.tests.torchvision.classification.densenet169 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 35.1 | 215 | 27.3 | 4.63 |
| enaptrt.tests.torchvision.classification.densenet201 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 29.7 | 150 | 34.2 | 6.67 |
| enaptrt.tests.torchvision.classification.densenet161 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 39 | 160 | 25.6 | 6.42 |
| enaptrt.tests.torchvision.classification.vgg11 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 2.38E-03 | 232 | 372 | 3.21 | 2.49 |
| enaptrt.tests.torchvision.classification.vgg13 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.46E-03 | 210 | 459 | 4.01 | 2.25 |
| enaptrt.tests.torchvision.classification.vgg16 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.56E-03 | 158 | 374 | 4.92 | 2.63 |
| enaptrt.tests.torchvision.classification.vgg19 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.89E-03 | 152 | 339 | 5.81 | 3.01 |
| enaptrt.tests.torchvision.classification.vgg11_bn | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 210 | 500 | 3.54 | 1.93 |
| enaptrt.tests.torchvision.classification.vgg13_bn | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.59E-03 | 179 | 459 | 4.34 | 2.25 |
| enaptrt.tests.torchvision.classification.vgg16_bn | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.65E-03 | 149 | 387 | 5.29 | 2.65 |
| enaptrt.tests.torchvision.classification.vgg19_bn | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 2.01E-03 | 141 | 265 | 6.4 | 3.79 |
| enaptrt.tests.torchvision.classification.mobilenet_v2 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 0.00E+00 | 148 | 739 | 6.78 | 1.07 |
