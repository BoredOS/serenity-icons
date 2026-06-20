.PHONY: all clean bup install

all:
	# Nothing to build

clean:
	rm -rf build

install:
	mkdir -p $(DESTDIR)/Library/images/icons/serenityicons/16x16
	mkdir -p $(DESTDIR)/Library/images/icons/serenityicons/32x32
	cp 16x16/*.png $(DESTDIR)/Library/images/icons/serenityicons/16x16/
	cp 32x32/*.png $(DESTDIR)/Library/images/icons/serenityicons/32x32/

bup:
	rm -rf build/package
	mkdir -p build/package/assets/16x16
	mkdir -p build/package/assets/32x32
	cp 16x16/*.png build/package/assets/16x16/ 2>/dev/null || true
	cp 32x32/*.png build/package/assets/32x32/ 2>/dev/null || true
	cp MANIFEST.toml build/package/
	mkdir -p build
	tar -cf build/serenityicons.tar -C build/package MANIFEST.toml assets
	lz4 -f build/serenityicons.tar build/serenityicons.bup
	rm -f build/serenityicons.tar
	rm -rf build/package
