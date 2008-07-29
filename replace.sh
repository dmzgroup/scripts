#!/bin/sh
find . \( -name '*.cpp' -o -name '*.h' -o -name '*.lmk' \) | xargs sed -i .sed-replace s/$1/$2/g
find . -name \*.sed-replace | xargs rm
