#!/bin/sh
GITREPO="$HOME/cm/src"
DIRS="`/bin/ls -1 $GITREPO`"
for dir in $DIRS ; do
   if [ -d $GITREPO/$dir/.git ] ; then
      echo "$dir -> git status"
      cd $GITREPO/$dir ; git status
      echo
   fi
done
