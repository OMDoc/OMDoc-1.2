<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2): Module PF Entities
     $Id: omdoc-PF-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-PF-classes.mod $
     PUBLIC: -//OMDoc//ENTITIES OMDoc PF V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!ENTITY % omdocpf.opt.content ",(%omdocpf.proof.qname;
                                 |%omdocpf.proofobject.qname;)?">
<!ENTITY % omdocpf.class "|%omdocpf.proof.qname;
                          |%omdocpf.proofobject.qname;">

