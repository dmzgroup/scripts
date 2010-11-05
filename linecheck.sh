#!/bin/sh
find . \( -name '*.cpp' -o -name '*.h' -o -name '*.lmk' -o -name '*.js' -o -name '*lua'  \) | grep -v 3rdparty | grep -v HID_ | grep -v tinyxml | grep -v osmscene | xargs awk '{ if (length > 90) print FILENAME ":" FNR " length=" length }'
