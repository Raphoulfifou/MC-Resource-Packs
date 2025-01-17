#!/bin/sh

if [ $# != 1 ]; then
	echo "Version not specified; Aborting"
	exit 1
fi

if [ -f "pack.mcmeta" ]; then
	rm "pack.mcmeta"
fi

rm CTM\ Create*.zip

# Obtains the MC version for each file
VERSIONS=$(ls *.mcmeta | cut -c 6-11)

for ver in $VERSIONS; do
	cp "pack_$ver.mcmeta" pack.mcmeta
	zip -r "CTM Create $1+$ver.zip" assets/ LICENSE.txt CREDITS.txt pack.png pack.mcmeta
done

rm "pack.mcmeta"
