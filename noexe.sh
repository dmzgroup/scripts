#!/bin/sh
find . \( -name '*.cpp' -o -name '*.c' -o -name '*.h' -o -name '*.lmk' -o -name '*.xml' -o -name '*.lua' -o -name '*.png' -o -name '*.html' -o -name '*.gif' -o -name '*.js' \) | xargs chmod ugo-x
