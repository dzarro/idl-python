#!/bin/csh -f 

# Load Python-IDL bridge on Mac OS 
# Optimized for Anaconda2/Python 2.7/IDL 8.5  
# Make sure to define or hardwire $TOP and $IDL_DIR beforehand to your local setup.

# Zarro (ADNET) 7-18-18

setenv TOP /Users/zarro/anaconda2
setenv IDL_DIR /Users/zarro/idl85
set PYTHONEXE = $TOP/bin/python

if !(-e $PYTHONEXE) then
 echo "Python executable not found."
 exit 1
endif

set OLD_PATH = $PATH
setenv PATH $TOP/bin:${PATH}
setenv PYTHONPATH $IDL_DIR/bin/bin.darwin.x86_64:$IDL_DIR/lib/bridges
setenv PYTHONHOME $TOP

# add optional SSW modules

if ($?SSW) then
 setenv PYTHONPATH ${PYTHONPATH}:$SSW/gen/python/bridge
 setenv PYTHONSTARTUP $SSW/gen/python/bridge/startup.py
endif

 
if ($#argv == 1) then
  $PYTHONEXE -B $argv[1]
else
  $PYTHONEXE -B
endif

setenv PATH $OLD_PATH
