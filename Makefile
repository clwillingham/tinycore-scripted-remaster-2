
all: clean unpack buildextra include buildiso


unpack: 
	mkdir /mnt/tmp
	sudo mount Core-current.iso /mnt/tmp -o loop,ro
	mkdir bin/
	mkdir bin/newiso
	mkdir bin/overlay
	cp -a /mnt/tmp/* bin/newiso/
	umount /mnt/tmp
	rm /mnt/tmp -r

clean:
	rm -rf bin
	rm -f tinyRemaster.iso

addextensions:
	mkdir -p bin/newiso/cde/optional
	cp -rf src/packages/* bin/newiso/cde/optional/
	ls -1 bin/newiso/cde/optional > bin/newiso/cde/onboot.lst
	cp bin/newiso/cde/onboot.lst bin/newiso/cde/copy2fs.lst
	cp bin/newiso/cde/onboot.lst bin/newiso/cde/xbase.lst

include:
	cp -rf src/include/* bin/newiso
	

buildextra:
	mkdir -p bin/extra
	cp -r src/extra/* -r bin/extra
	cd bin/extra/; find | cpio -o -H newc | gzip -2 > ../newiso/boot/extra.gz

buildiso:
	cp -f src/isolinux.cfg bin/newiso/boot/isolinux/isolinux.cfg
	mkisofs -l -J -R -V TC-custom -no-emul-boot -boot-load-size 4 -boot-info-table -b boot/isolinux/isolinux.bin -c boot/isolinux/boot.cat -o tinyRemaster.iso bin/newiso

run:
	kvm --cdrom tinyRemaster.iso

unsquash:
	./unsquash.sh

overlay:
	mv ./bin/newiso/boot/core.gz ./bin/overlays
	find ./bin/overlays -type f | xargs cat > ./bin/newiso/boot/core2.gz
