#!/bin/csh -f
# Load Python with IDL bridge (customized for Hesperia)
# Zarro (ADNET) 5-29-17

# check for required environment variables

if !($?SSW) then
  echo "SSW environment variable not defined."
  exit 1
endif

if !($?IDL_DIR) then
  echo "IDL_DIR environment variable not defined."
  exit 1
endif

set TOP = /home/dzarro
set PYTHONTOP = $TOP/anaconda2
set PYTHONEXE = $PYTHONTOP/bin/python
if !(-e $PYTHONEXE) then
 echo "Python executable not found."
  exit 1
endif

#  set paths for Python and IDL to find each other

setenv PYTHONPATH $IDL_DIR/lib/bridges:$SSW/gen/python/bridge 

#setenv PYTHONSTARTUP $SSW/gen/python/startup.py

setenv LD_LIBRARY_PATH $PYTHONTOP/lib:$IDL_DIR/bin/idl

if ($#argv == 1) then
  $PYTHONEXE -B $argv[1]
else
  $PYTHONEXE -B
endif

exit 0

