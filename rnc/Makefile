#TARGET.src = $(shell ls *-*.rnc) omdoc.rnc
RNC	   = $(shell ls *.rnc) 

RNG = $(RNC:%.rnc=%.rng)
XSD = $(RNC:%.rnc=%.xsd)

all:		$(RNG) $(XSD) #omdoc.xsd $(TARGET.dtd) 

clean:		
		rm -f *~ 
distclean:	clean
		rm -f *.dtd *.xsd *.rng

install:	$(SRC.rnc) $(SRC.rng) #$(SRC.xsd)
	cp $(RNC) $(RNG) $(HOME)/vc/svn/omdoc.org/www/rnc

$(RNG): %.rng: %.rnc
	trang -I rnc -O rng $< $@

$(XSD): %.xsd: %.rnc 
	trang -I rnc omdoc.rnc omdoc.xsd
