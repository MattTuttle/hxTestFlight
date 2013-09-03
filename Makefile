LIBPATH=project/obj/lib
AR=ar
LIBTOOL=libtool
HAXELIB=haxelib
HXCPP=$(HAXELIB) run hxcpp
OPENFL=$(HAXELIB) run openfl

all: clean build examples

examples: install
	cd example; $(OPENFL) build android

build: iphonesim iphoneos-v7

iphonesim: i386
	cd project; $(HXCPP) Build.xml -Diphonesim
	ar -q ndll/iPhone/libtestflight.$@.a $(LIBPATH)/$</*.o
	ranlib ndll/iPhone/libtestflight.$@.a

iphoneos: armv6
	cd project; $(HXCPP) Build.xml -Diphoneos
	ar -q ndll/iPhone/libtestflight.$@.a $(LIBPATH)/$</*.o
	ranlib ndll/iPhone/libtestflight.$@.a

iphoneos-v7: armv7
	cd project; $(HXCPP) Build.xml -Diphoneos -DHXCPP_ARMV7
	ar -q ndll/iPhone/libtestflight.$@.a $(LIBPATH)/$</*.o
	ranlib ndll/iPhone/libtestflight.$@.a

clean:
	rm -rf project/obj
	rm -f ndll/iPhone/*.a testflight.zip

install: testflight.zip
	$(HAXELIB) local $<

testflight.zip:
	zip -r $@ com -x *.DS_Store
	zip -r $@ ndll -x *.DS_Store
	zip $@ lib/TestFlightLib.jar
	zip $@ haxelib.json include.xml CHANGELOG.md

# extracts object files for specific architectures
i386 armv6 armv7:
	mkdir -p $(LIBPATH)/$@
	$(LIBTOOL) -static lib/libTestFlight.a -ac -arch_only $@ -o $(LIBPATH)/$@/libtestflight.a
	cd $(LIBPATH)/$@; $(AR) -x libtestflight.a
