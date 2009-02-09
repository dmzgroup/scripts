#!/bin/sh

if [ "$DMZ_BIN_MODE" = "" ] ; then
   DMZ_BIN_MODE="debug"
fi

if [ `uname` = "Darwin" ] ; then
   export DYLD_LIBRARY_PATH=../../bin/macos-$DMZ_BIN_MODE:../../depend/osg/lib:$DYLD_LIBRARY_PATH
   export BIN_HOME=../../bin/macos-$DMZ_BIN_MODE ;
   export DEBUG_EXE="gdb --args "
elif [ `uname` = "Linux" ] ; then
   export LD_LIBRARY_PATH=../../bin/linux-$DMZ_BIN_MODE:$LD_LIBRARY_PATH
   export BIN_HOME=../../bin/linux-$DMZ_BIN_MODE ;
   export DEBUG_EXE="gdb --args "
elif [ `uname -o` = "Cygwin" ] ; then
   export BIN_HOME=../../bin/win32-$DMZ_BIN_MODE ;
   export DEBUG_EXE="devenv /debugexe "
else
   echo "Unsupported platform: " `uname`
   exit -1 ;
fi

if [ "$DMZ_DEBUG" = "true" ] ; then
   export RUN_DEBUG="$DEBUG_EXE"
else
   export RUN_DEBUG=""
fi
