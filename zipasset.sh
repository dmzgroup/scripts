#/bin/sh

if [ "$1" = "" ] ; then
  echo "Asset name required"
  exit -1
else
   zip -r -9 $1-assets.zip ./assets/$1
fi
