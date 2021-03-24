from .enaptrt import *
from .converters import *
import tensorrt as trt


def load_plugins():
    import enaptrt.plugins
    registry = trt.get_plugin_registry()
    enaptrt_creators = [c for c in registry.plugin_creator_list if c.plugin_namespace == 'enaptrt']
    for c in enaptrt_creators:
        registry.register_creator(c, 'enaptrt')

try:
    load_plugins()
except:
    pass
