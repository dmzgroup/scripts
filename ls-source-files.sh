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

   echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-"
   echo "Git repositories found in $GITREPO"
   echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-"

   DIRS="`/bin/ls -1 $GITREPO`"

   cd $GITREPO

   rm dmz.files
   touch dmz.files

   for dir in $DIRS ; do

      if [ -d $dir/.git ] ; then
         echo "$dir"
         find $dir \( -name '*.cpp' -o -name '*.h' -o -name '*.lmk' -o -name '*.xml' -o -name '*.lua' -o -name '*.js' -o -name '*.' \) >> dmz.files
      fi

   done
   echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-"
   echo "Done."
   echo "-=-=-=-=-=-=-=-=-=-=-=-=-=-"
else

   echo "Git repositories not found."

fi
