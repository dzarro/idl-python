#!/bin/csh -f 

# Load Python-IDL bridge on Mac OS 
# Optimized for Anaconda2/Python 2.7/IDL 8.5  
# Make sure to define or hardwire $TOP and $IDL_DIR beforehand to your local setup.

# Zarro (ADNET) 7-18-18

setenv TOP /Users/zarro
setenv IDL_DIR $TOP/idl85

setenv PYTHONTOP $TOP/anaconda2
set PYTHONEXE = $PYTHONTOP/bin/python

if !(-e $PYTHONEXE) then
 echo "Python executable not found."
 exit 1
endif


set OLD_PATH = $PATH
setenv PATH $PYTHONTOP/bin:${PATH}
setenv PYTHONPATH $IDL_DIR/lib/bridges

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
