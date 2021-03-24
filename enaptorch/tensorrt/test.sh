#!/bin/bash

OUTPUT_FILE=$1

touch $OUTPUT_FILE

echo "| Name | Data Type | Input Shapes | enaptrt kwargs | Max Error | Throughput (PyTorch) | Throughput (TensorRT) | Latency (PyTorch) | Latency (TensorRT) |" >> $OUTPUT_FILE
echo "|------|-----------|--------------|------------------|-----------|----------------------|-----------------------|-------------------|--------------------|" >> $OUTPUT_FILE

python3 -m enaptrt.test -o $OUTPUT_FILE --name alexnet --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name squeezenet1_0 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name squeezenet1_1 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name resnet18 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name resnet34 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name resnet50 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name resnet101 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name resnet152 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name densenet121 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name densenet169 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name densenet201 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name densenet161 --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg11$ --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg13$ --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg16$ --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg19$ --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg11_bn --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg13_bn --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg16_bn --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name vgg19_bn --include=enaptrt.tests.torchvision.classification
python3 -m enaptrt.test -o $OUTPUT_FILE --name mobilenet_v2 --include=enaptrt.tests.torchvision.classification
