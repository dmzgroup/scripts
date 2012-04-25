#!/bin/sh

# Options
# ./pull_clean_build_publish_mac.sh [-s] [-m]
# no arguments will just pull latest code
# -s will build and publish stance
# -m will build and publish mindmap

git pull http://www.github.com/dmzdev/scripts
cd ../dmz
git pull http://www.github.com/dmzdev/dmz
cd ../forge
git pull http://www.github.com/dmzdev/forge
cd ../js
git pull http://www.github.com/dmzdev/js
cd ../lmk
git pull http://www.github.com/dmzdev/lmk
cd ../mindmap
git pull http://www.github.com/dmzdev/mindmap
cd ../qmapcontrol
git pull http://www.github.com/dmzdev/qmapcontrol
cd ../stance
git pull http://www.github.com/dmzdev/stance

BUILDSTANCE=false
BUILDMINDMAP=false
CLEAN=false

echo "Pulling from github complete."

while getopts ":sm" opt; do
    case $opt in
	s)
	    echo "Building and publishing STANCE."
	    BUILDSTANCE=true
	    CLEAN=true
	    ;;
	m)
	    echo "Building and publishing MINDMAP."
	    BUILDMINDMAP=true
	    CLEAN=true
	    ;;
	\?)
	    echo "Not building or publishing anything."
	    ;;
    esac
done

if $CLEAN; then
    echo "Running distclean"
    lmk -f distclean
fi
if $BUILDSTANCE; then
    echo "Building STANCE"
    ../stance/installer/pull_build_publish_mac.sh
fi
if $BUILDMINDMAP; then
    echo "Building Mindmap"
    ../mindmap/installer/pull_build_publish_mac.sh
fi
echo "DONE!"


