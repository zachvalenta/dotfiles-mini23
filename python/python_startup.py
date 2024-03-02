import json
from pprint import pprint as pp

def dump(arg):
    print(json.dumps(arg, indent=4, sort_keys=True))
