<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2) Module MOBJ
     $Id: omdoc-MOBJ-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-MOBJ-classes.mod $
      PUBLIC -//OMDoc//DTD OMDoc MOBJ V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->
<!ENTITY % omdocmobj.extra "">
<!ENTITY % omdocmobj.class "%ss;|%omdocmobj.legacy.qname;
                                %omdocmobj.om.mix;
				%omdocmobj.mathml.mix;
				%omdocmobj.extra;">
