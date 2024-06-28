import json
from pprint import pprint as pp

from rich import pretty
pretty.install()

def dump(arg):
    """dump dictionary with indentation"""
    print(json.dumps(arg, indent=4, sort_keys=True))
