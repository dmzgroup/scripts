#!/bin/sh
find . \( -name '*.cpp' -o -name '*.c' -o -name '*.h' -o -name '*.lmk' -o -name '*.xml' \) | xargs chmod ugo-x
