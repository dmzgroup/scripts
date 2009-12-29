#/bin/sh

PLATFORM="unknown"

EXTRA_EXCLUDE=""

if [ `uname` = "Darwin" ] ; then
   PLATFORM="macos"
elif [ `uname` = "Linux" ] ; then
   PLATFORM="linux"
elif [ `uname -o` = "Cygwin" ] ; then
   PLATFORM="win32"
else
   echo "Unsupported platform: " `uname`
   exit -1
fi

zip -r -y -9 depend-$PLATFORM-`date +%y%m%d`.zip ./depend -x \*.DS_Store \*.svn\* $EXTRA_EXCLUDE
