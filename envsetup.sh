#!/bin/sh

if [ `uname` = "Darwin" ] ; then
   export DYLD_LIBRARY_PATH=../../depend/osg/lib:$DYLD_LIBRARY_PATH
   export BIN_HOME=../../bin/macos-debug ;
   export DEBUG_EXE="gdb --args "
elif [ `uname` = "Linux" ] ; then
   export BIN_HOME=../../bin/linux-debug ;
   export DEBUG_EXE="gdb --args "
elif [ `uname -o` = "Cygwin" ] ; then
   export BIN_HOME=../../bin/win32-debug ;
   export DEBUG_EXE="devenv /debugexe "
else
   echo "Unsupported platform: " `uname`
   exit -1 ;
fi

if [ "$DMZ_DEBUG" = "true" ] ; then
   export RUN_DEBUG=$DEBUG_EXE
else
   export RUN_DEBUG=""
fi
