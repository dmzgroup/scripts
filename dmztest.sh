#!/bin/sh

STARTDIR=`pwd`

for arg in $* ; do
   if [ "$arg" = "-m" ] ; then
      if [ "$DMZBINMODE" != "" ] ; then
         echo "Only one binary mode may be specified during a unit test run"
         exit -1
      fi
      MODEFOUND=true
   elif [ "$MODEFOUND" = "true" -a "$DMZBINMODE" = "" ] ; then
      DMZBINMODE=$arg
      MODEFOUND=false
   fi
done

if [ "$DMZBINMODE" = "" ] ; then
   DMZBINMODE="debug"
fi

if [ `uname` = "Darwin" ] ; then
   export DMZPLATFORM="macos"
elif [ `uname` = "Linux" ] ; then
   export DMZPLATFORM="linux"
   export LD_LIBRARY_PATH=../../bin/linux-$DMZBINMODE:$LD_LIBRARY_PATH
elif [ `uname -o` = "Cygwin" ] ; then
   export DMZPLATFORM="win32"
else
   echo "Unsupported platform: " `uname`
   exit -1 ;
fi

while [ "`pwd`" != "/" -a "$DMZBIN" = "" ] ; do
   if [ -d ./bin/$DMZPLATFORM-$DMZBINMODE ] ; then
      DEPPATH=`pwd`/depend
      pushd ./bin/$DMZPLATFORM-$DMZBINMODE > /dev/null
      DMZBINPATH=`pwd`
      popd > /dev/null
   fi
   cd ..
done

if [ "$DMZPLATFORM" = "macos" ] ; then
   export DYLD_LIBRARY_PATH=$DMZBINPATH:$DEPPATH/osg/lib:$DYLD_LIBRARY_PATH
elif [ "$DMZPLATFORM" = "linux" ] ; then
   export LD_LIBRARY_PATH=$DMZBINPATH:$LD_LIBRARY_PATH
elif [ "$DMZPLATFORM" = "win32" ] ; then
   echo "win32" 
else
   echo "Unknown platform type: $DMPLATFORM"
   exit -1 ;
fi

cd $STARTDIR

lmk -f test $*
