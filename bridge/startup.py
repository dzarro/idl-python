
# PYTHON start-up file. Define PYTHONSTARTUP to point to this file

print("Running Python-IDL bridge startup...")
try:
    import bridge
    bridge.startup()
except:
    pass

from idlpy import * 
