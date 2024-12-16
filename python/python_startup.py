import json
import inspect
import sys

from rich import pretty, traceback, print as rprint
from rich import inspect as ins
import polars as pl


pretty.install()
traceback.install(show_locals=False)

def dump(arg):
    """dump dictionary with indentation"""
    print(json.dumps(arg, indent=4, sort_keys=True))

def ri(obj):
    """inspect obj with Rich and show methods"""
    return ins(obj, methods=True)

def chuan(obj):
    """obj inheritance"""
    return obj.__class.__mro__

def qiu():
    """view startup module help"""
    rprint(help(__name__))

def jk():
    """user imported modules"""
    all_modules = sys.modules.keys()
    top_level_modules = set(module.split('.')[0] for module in all_modules)
    stdlib_modules = set(sys.stdlib_module_names)
    user_defined_modules = sorted(
        module for module in top_level_modules
        if module not in stdlib_modules and not module.startswith('_')
    )
    rprint(user_defined_modules)
