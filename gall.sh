#!/bin/sh
if [ ! "$1" = "" ] ; then

   GITREPO="$HOME/cm/src"
   DIRS="`/bin/ls -1 $GITREPO`"
   for dir in $DIRS ; do
      if [ -d $GITREPO/$dir/.git ] ; then
         echo "$dir -> git $*"
         cd $GITREPO/$dir ; git $*
         echo
      fi
   done

fi
