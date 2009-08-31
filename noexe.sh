#!/bin/sh
find . \( -name '*.cpp' -o -name '*.c' -o -name '*.h' -o -name '*.lmk' -o -name '*.xml' -o -name '*.lua' \) | xargs chmod ugo-x
