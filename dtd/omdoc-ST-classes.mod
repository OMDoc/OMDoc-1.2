<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2): Module ST Entities
     $Id: omdoc-ST-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-ST-classes.mod $
     PUBLIC: -//OMDoc//ENTITIES OMDoc ST V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!ENTITY % theory-unique "CDATA"> <!-- we cannot check more -->

<!ENTITY % omdocst.scope.attrib 'scope (global|local) "global"'>
<!ENTITY % omdocst.sym.attrib "name %theory-unique; #IMPLIED %id.attrib; %omdocst.scope.attrib;">

<!ENTITY % otherdefinitiontype "">
<!ENTITY % definitiontype "(simple|implicit|inductive|obj|pattern|informal
                           %otherdefinitiontype;)">

<!-- the non-constitutive statements need a theory attribute -->
<!ENTITY % omdocst.theory.attrib "theory %omdocref; #IMPLIED">

<!ENTITY % omdocst.constitutive.class
           "|%omdocst.symbol.qname;
            |%omdocst.axiom.qname;
            |%omdocst.definition.qname;
            |%omdocst.imports.qname;">


<!ENTITY % omdocst.nonconstitutive.class
           "|%omdocst.assertion.qname;
            |%omdocst.type.qname;
            |%omdocst.alternative.qname;
            |%omdocst.example.qname;
	    |%omdocst.theory.qname;">

<!ENTITY % omdocst.class "%omdocst.nonconstitutive.class;
                          %omdocst.constitutive.class;">
<!ENTITY % omdocst.group.mix "|%omdocst.tgroup.qname;">



