| Name | Data Type | Input Shapes | enaptrt kwargs | Max Error | Throughput (PyTorch) | Throughput (TensorRT) | Latency (PyTorch) | Latency (TensorRT) |
|------|-----------|--------------|------------------|-----------|----------------------|-----------------------|-------------------|--------------------|
| enaptrt.tests.torchvision.classification.alexnet | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 8.39E-05 | 30.8 | 64 | 33.6 | 17.7 |
| enaptrt.tests.torchvision.classification.squeezenet1_0 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 9.77E-04 | 22.4 | 132 | 50.2 | 8.1 |
| enaptrt.tests.torchvision.classification.squeezenet1_1 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 9.77E-04 | 25.1 | 237 | 38.9 | 4.6 |
| enaptrt.tests.torchvision.classification.resnet18 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 7.81E-03 | 15.4 | 91.5 | 65.1 | 11.9 |
| enaptrt.tests.torchvision.classification.resnet34 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 2.19E-01 | 6.43 | 51.4 | 158 | 21 |
| enaptrt.tests.torchvision.classification.resnet50 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.56E-01 | 7.4 | 34.3 | 136 | 30.7 |
| enaptrt.tests.torchvision.classification.resnet101 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 0.00E+00 | 3.08 | 19.9 | 331 | 53 |
| enaptrt.tests.torchvision.classification.resnet152 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 0.00E+00 | 1.97 | 12.7 | 498 | 74.7 |
| enaptrt.tests.torchvision.classification.densenet121 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 5.6 | 34.5 | 162 | 30.1 |
| enaptrt.tests.torchvision.classification.densenet169 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 2.93E-03 | 4.29 | 27.2 | 188 | 38 |
| enaptrt.tests.torchvision.classification.densenet201 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 5.37E-03 | 3.43 | 20.7 | 243 | 49.8 |
| enaptrt.tests.torchvision.classification.densenet161 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 2.93E-03 | 2.13 | 13.6 | 470 | 75.9 |
| enaptrt.tests.torchvision.classification.vgg11 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.40E-03 | 5.88 | 18.7 | 174 | 59.1 |
| enaptrt.tests.torchvision.classification.vgg13 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.37E-03 | 4.14 | 14.9 | 246 | 72.3 |
| enaptrt.tests.torchvision.classification.vgg16 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.46E-03 | 3.19 | 11.8 | 318 | 90.9 |
| enaptrt.tests.torchvision.classification.vgg19 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.34E-03 | 2.59 | 10.2 | 390 | 105 |
