#!/bin/bash
set -e

if [ $(flatpak list|grep org.inkscape.Inkscape|wc -l) -gt 0 ]; then
    EXE=$(echo flatpak run org.inkscape.Inkscape)
else
    EXE=$(echo inkscape)
fi

for i in `ls *.svg|sort`; do
    PNG=../png/$(basename $i svg)png
	$EXE $i -TCo $PNG 2>&1 >/dev/null
	optipng -quiet $PNG
done
