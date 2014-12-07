<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2): Module DG Entities
     $Id: omdoc-DG-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-DG-classes.mod $
     PUBLIC: -//OMDoc//ENTITIES OMDoc DG V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2004 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!-- set the following two entities to the empty string, when not including
     module DG -->
<!ENTITY % omdocdg.class "|%omdocdg.decomposition.qname;">
<!ENTITY % omdocdg.theory-inclusion.content.mix "|(%omdocdg.decomposition.qname;)*">
<!ENTITY % omdocdg.axiom-inclusion.content.mix "|(%omdocdg.path-just.qname;)*">

