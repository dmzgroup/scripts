#!/bin/sh

# I would rather use pushd/popd but I can't tell if they are always available.
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
   DMZPLATFORM="macos"
elif [ `uname` = "Linux" ] ; then
   DMZPLATFORM="linux"
elif [ `uname -o` = "Cygwin" ] ; then
   DMZPLATFORM="win32"
else
   echo "Unsupported platform: " `uname`
   exit -1 ;
fi

while [ "`pwd`" != "/" -a "$DMZBINPATH" = "" ] ; do
   if [ -d ./lmkproject ] ; then
      if [ ! -d ./bin/$DMZPLATFORM-$DMZBINMODE ] ; then
         echo "Path: ./bin/$DMZPLATFORM-$DMZBINMODE does not exist, attempting to create."
         # this should create the bin directory if it doesn't exist.
         lmk -m $DMZBINMODE -b .
      fi
      DEPPATH=`pwd`/depend
      PREVDIR=`pwd`
      cd ./bin/$DMZPLATFORM-$DMZBINMODE
      DMZBINPATH=`pwd`
      cd $PREVDIR
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
   echo "Unknown platform type: $DMZPLATFORM"
   exit -1 ;
fi

cd $STARTDIR

lmk -v -f test $*
