<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2): Module RT Entities
     $Id: omdoc-RT-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-RT-classes.mod $
     PUBLIC: -//OMDoc//ENTITIES OMDoc RT V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!ENTITY % omdocrt.mtext.extra "">
<!ENTITY % omdocrt.mtext.mix "|%omdocrt.ul.qname;
                              |%omdocrt.ol.qname;		     
                              |%omdocrt.dl.qname;		     
                              |%omdocrt.p.qname;		     
                              |%omdocrt.note.qname;
                              |%omdocrt.link.qname;
                              |%omdocrt.idx.qname;
                              |%omdocrt.table.qname;
			      %omdocrt.mtext.extra;">
	
