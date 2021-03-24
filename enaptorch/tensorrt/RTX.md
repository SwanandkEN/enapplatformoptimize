| Name | Data Type | Input Shapes | enaptrt kwargs | Max Error | Throughput (PyTorch) | Throughput (TensorRT) | Latency (PyTorch) | Latency (TensorRT) |
|------|-----------|--------------|------------------|-----------|----------------------|-----------------------|-------------------|--------------------|
| enaptrt.tests.torchvision.classification.alexnet | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 4.58E-05 | 610 | 1.16e+03 | 1.58 | 0.762 |
| enaptrt.tests.torchvision.classification.squeezenet1_0 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 9.77E-04 | 352 | 1.89e+03 | 2.79 | 0.442 |
| enaptrt.tests.torchvision.classification.squeezenet1_1 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.95E-03 | 367 | 2.18e+03 | 2.74 | 0.408 |
| enaptrt.tests.torchvision.classification.resnet18 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 5.86E-03 | 278 | 1.42e+03 | 3.12 | 0.644 |
| enaptrt.tests.torchvision.classification.resnet34 | float16 | [(1, 3, 224, 224)] | {'fp16_mode': True} | 1.88E-01 | 173 | 833 | 5.89 | 1.42 |
