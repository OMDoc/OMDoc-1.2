PREFIX          = ../..
NEEDSFROMDIRS 	= ../logics ../omstd
BUTFILES 	= catalogue.omdoc
TERMINATE	= terminate='no'
include $(PREFIX)/lib/Makefile.vars

all:		4 i html  mml #ps
2:		42 i2 mml2


include $(PREFIX)/lib/Makefile.in

undefined:	$(patsubst %.omdoc, .%.undefined, $(OMDOCFILES))

.%.undefined:	%.omdoc $(XSLDIR)/undefined-OMS.xsl
		$(XSLT) -o $@ $(firstword $<) $(XSLDIR)/undefined-OMS.xsl $(TERMINATE)

