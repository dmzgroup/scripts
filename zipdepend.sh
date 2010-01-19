#/bin/sh

EXTRA_EXCLUDE=""

if [ -f "./depend/TARGET" ] ; then
   PLATFORM=`cat ./depend/TARGET`
fi

if [ "$PLATFORM" = "" ] ; then

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

fi

FILENAME="depend-$PLATFORM-`date +%y%m%d`.zip"

echo $FILENAME

zip -r -y -9 $FILENAME ./depend -x \*.DS_Store \*.svn\* \*.swp $EXTRA_EXCLUDE
