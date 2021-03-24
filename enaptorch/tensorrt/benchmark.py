import torchvision
import time
model = torchvision.models.resnet18(pretrained=True).cuda().half().eval()

import torch

data = torch.randn((1, 3, 224, 224)).cuda().half()
li_time_trt = []
li_time = []

from enaptrt import enaptrt

model_trt = enaptrt(model, [data], fp16_mode=True)
for i in range(30):
    strt_time = time.time()
    output_trt = model_trt(data)
    avg_time_trt = time.time()-strt_time
    #print(avg_time_trt)
    if i!=0:
        li_time_trt.append(avg_time_trt)
    strt_time1 = time.time()
    output = model(data)
    avg_time = time.time()-strt_time1
    if i!=0:
        li_time.append(avg_time)
print(output.flatten()[0:10])
print(output_trt.flatten()[0:10])
print('max error: %f' % float(torch.max(torch.abs(output - output_trt))))
print("AVERAGE TIME: ",sum(li_time) / len(li_time))
print("AVERAGE TIME_TRT: ",sum(li_time_trt) / len(li_time_trt))