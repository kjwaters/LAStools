ifndef PREFIX
PREFIX=/san1/tcm-i/$(ARCH)
endif

all:
	cd LASlib && make
	cd LASzip && make
	cd src && make
#	cd src_full && make

clean:
	cd LASlib && make clean
	cd LASzip && make clean
	cd src && make clean
#	cd src_full && make clean

clobber:
	cd LASlib && make clobber
	cd LASzip && make clobber
	cd src && make clobber
#	cd src_full && make clobber
	cd bin && rm -rf lasinfo laszip lasprecision las2txt txt2las las2las lasdiff lasmerge lasthin las2shp shp2las las2iso las2tin lasboundary lasview las2dem

install:
	cd bin && cp  lasinfo laszip lasprecision las2txt txt2las las2las lasdiff lasmerge lasindex $(PREFIX)/bin
	mkdir -p $(PREFIX)/bin/serf/geo
	cp bin/serf/geo/* $(PREFIX)/bin/serf/geo
	cp LASlib/src/liblas.a $(PREFIX)/lib
	cp LASlib/inc/*.hpp $(PREFIX)/include/laslib
	cp LASzip/src/*.hpp $(PREFIX)/include/laslib
