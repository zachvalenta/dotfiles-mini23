import json
import inspect

from rich import pretty, traceback
from rich import inspect as ins
pretty.install()
traceback.install(show_locals=False)

def dump(arg):
    """dump dictionary with indentation"""
    print(json.dumps(arg, indent=4, sort_keys=True))

def ri(obj):
    """inspect obj with Rich and show methods"""
    return ins(obj, methods=True)

def inheritance(obj):
    return obj.__class.__mro__
