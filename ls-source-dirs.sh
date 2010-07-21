#!/bin/sh
   
while [ "`pwd`" != "/" -a "$GITREPO" = "" ] ; do

    if [ -d ./lmkproject ] ; then

       GITREPO=`pwd`/src
    fi

    cd ..
done

if [ "$GITREPO" = "" -a -d "$HOME/cm/src" ] ; then
   GITREPO="$HOME/cm/src"
fi

if [ "$GITREPO" != "" ] ; then

   DIRS="`/bin/ls -1 $GITREPO`"

   cd $GITREPO

   for dir in $DIRS ; do

      if [ -d $dir/.git ] ; then
         find $dir -type d -not \( -name '.git' -prune -o -name '*.xcodeproj' -prune \)
      fi

   done
else
   echo "Git repositories not found."
fi
