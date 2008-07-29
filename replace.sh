#!/bin/sh
find . \( -name '*.cpp' -o -name '*.h' \) | xargs sed -i -e s/$1/$2/g
find . -name \*-e | xargs rm
