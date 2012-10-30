mkdir -p ./bin/overlays
mkdir -p ./bin/packages

cd ./src/packages
set $FILES = ls ./src/packages/
for f in *.tcz
do
	echo $f
	unsquashfs -f $f
	cd squashfs-root
	find | cpio -o -H newc | gzip -2 > ../../../bin/overlays/$f.gz
	cd ..
	rm -r squashfs-root
done
