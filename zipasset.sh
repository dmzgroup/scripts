#/bin/sh

if [ "$1" = "" ] ; then
  echo "Asset name required"
  exit -1
else
   zip -r -9 $1-assets-`date +%y%m%d`.zip ./assets/$1 -x \*.DS_Store
fi
