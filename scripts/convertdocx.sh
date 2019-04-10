#!/usr/bin/env bash

set -x


DOCNAME=${1%.docx}
echo $1
echo $DOCNAME

pandoc -f docx $1 -t rst -o $DOCNAME.rst
mkdir -p tmp media
cd tmp
unzip ../$1
cp -Rf ./word/media/* ../media
cd ..
rm -Rf tmp

