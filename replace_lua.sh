#!/bin/sh
find . -name '*.lua' | xargs grep -l $1 | xargs sed -i .sed-replace s/$1/$2/g
find . -name \*.sed-replace | xargs rm
