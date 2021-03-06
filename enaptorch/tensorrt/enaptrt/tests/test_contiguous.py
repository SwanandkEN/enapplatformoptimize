import torch
from enaptrt import enaptrt


def test_contiguous():
    net = torch.nn.Conv2d(3, 10, kernel_size=3)
    net.eval().cuda()

    test_tensor = torch.randn((1, 25, 25, 3)).cuda().permute((0, 3, 1, 2))

    with torch.no_grad():
        test_out = net(test_tensor)

    with torch.no_grad():
        trt_net = enaptrt(net, [test_tensor])
        test_trt_out = trt_net(test_tensor)

    delta = (test_out.contiguous() - test_trt_out.contiguous()).abs().sum()
    assert delta < 1e-3, f"Delta: {delta}"

