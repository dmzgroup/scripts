#!/bin/sh
find . \( -name '*.cpp' -o -name '*.h' -o -name '*.lmk' \) | xargs grep -n $1
