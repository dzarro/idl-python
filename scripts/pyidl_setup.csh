#!/bin/csh -f 

# Run IDL-Python bridge setup
# Optimized for Anaconda/Python 2.7 and IDL 8.5.
# Make sure to define or hardwire $TOP and $IDL_DIR beforehand to your local setup.
# Run as "sudo csh pyidl_setup.csh"

# Zarro (ADNET) 10-13-17 

set CWD = `pwd` 
onintr catch

setenv TOP /Users/zarro
setenv IDL_DIR $TOP/idl85
setenv PATH $TOP/anaconda2/bin:${PATH}
setenv PYTHONHOME $TOP/anaconda2
setenv PYTHONPATH $IDL_DIR/bin/bin.darwin.x86_64:$IDL_DIR/lib/bridges 

cd $IDL_DIR/lib/bridges
python setup.py install   

catch:
if ($?CWD) then  
 cd $CWD 
endif
