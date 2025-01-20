import json
from pathlib import Path
import os
import sys

from loguru import logger
from rich import pretty, traceback, print as rprint
from rich import inspect as ins

pretty.install()
traceback.install(show_locals=False)
logger.info(f"loading base startup @ {Path(__file__).resolve()}")

###
# EXTERNAL
###

def ri(obj):
    """inspect obj with Rich and show methods"""
    return ins(obj, methods=True)

def chuan(obj):
    """obj inheritance"""
    return obj.__class.__mro__

def dump(arg):
    """dump dictionary with indentation"""
    print(json.dumps(arg, indent=4, sort_keys=True))

###
# STARTUP ITSELF
###

def reload():
    ipy = get_ipython()
    if not ipy.find_magic('autoreload'):
        ipy.run_line_magic('load_ext', 'autoreload')
    ipy.run_line_magic('autoreload', '2')

def qiu():
    """view startup module help"""
    rprint(help(__name__))

def vars(*args):
    """view all variables, either in given module or startup module itself"""
    if args:
        rprint(dir(*args))
        for arg in args:
            attributes = {key: getattr(arg, key) for key in dir(arg) if not key.startswith("_")}
            for name, val in attributes.items():
                rprint(f"{name}: {val}")
    else:
        all_variables = {key: value for key, value in globals().items() if not key.startswith("_")}
        rprint(all_variables)

def jk():
    """view user imported modules"""
    all_modules = sys.modules.keys()
    top_level_modules = set(module.split('.')[0] for module in all_modules)
    stdlib_modules = set(sys.stdlib_module_names)
    user_defined_modules = sorted(
        module for module in top_level_modules
        if module not in stdlib_modules and not module.startswith('_')
    )
    rprint(user_defined_modules)

###
# REPO-SPECIFIC STARTUP
###

project_startup = Path('./repl/startup.py')
if project_startup.exists():
    logger.info(f"loading proj startup @ {Path.cwd()}/{project_startup}")
    base_startup = os.environ.get('PYTHONSTARTUP')
    os.environ['PYTHONSTARTUP'] = ''
    from runpy import run_path
    run_path(str(project_startup))
    if base_startup:
        os.environ['PYTHONSTARTUP'] = base_startup
