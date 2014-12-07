include Makefile.vars

RDFCAT_CLASSPATH	= $(JENA_LIB)/jena.jar:$(JENA_LIB)/antlr.jar:$(JENA_LIB)/commons-logging-api-1.1.jar:$(JENA_LIB)/xercesImpl.jar:$(JENA_LIB)/iri.jar:$(JENA_LIB)/icu4j.jar
RDFCAT	= java -cp $(RDFCAT_CLASSPATH) jena.rdfcat

%.owl: %.n3
	$(RDFCAT) -out RDF/XML $< > $@ 
