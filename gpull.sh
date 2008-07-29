#!/bin/sh
GITREPO="$HOME/cm/src"
DIRS="`/bin/ls -1 $GITREPO`"
for dir in $DIRS ; do
   if [ -d $GITREPO/$dir/.git ] ; then
      echo "$dir -> git pull"
      cd $GITREPO/$dir ; git pull
      echo
   fi
done
