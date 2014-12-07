<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2): Module MTXT Entities
     $Id: omdoc-MTXT-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-MTXT-classes.mod $
     PUBLIC: -//OMDoc//ENTITIES OMDoc MTXT V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!-- Module MTXT -->
<!ENTITY % omdocmtxt.class "|%omdocmtxt.omtext.qname;">
<!ENTITY % omdocmtxt.MC.content 
	 "%omdocdoc.meta.content;(%omdocmtxt.CMP.qname;)*">
<!ENTITY % omdocmtxt.MCF.content 
	 "%omdocmtxt.MC.content;,(%omdocmtxt.FMP.qname;)*">

<!ENTITY % omdocmtxt.MCS.content 
	 "%omdocdoc.meta.content;(%ss;|%omdocmtxt.CMP.qname;)*">
<!ENTITY % omdocmtxt.MCFS.content 
	 "%omdocmtxt.MCS.content;,(%omdocmtxt.FMP.qname;)*">

<!-- what can go into a mathematical text -->
<!ENTITY % omdoc.mtext.content "#PCDATA
                               |%omdocmtxt.phrase.qname;
                               |%omdocmtxt.term.qname;
                               |%omdocmobj.class;
                                %omdocrt.mtext.mix;
                                %omdocext.mtext.mix;">

<!-- the linguistically motivated text types (RST=Rhethorical Structure Theory) -->
<!ENTITY % omtexttype.rst "abstract|introduction|conclusion|thesis|comment|
                           antithesis|elaboration|motivation|evidence|transition|
                           note|annote">

<!-- the text types for statements (for migration to the ST module) -->
<!ENTITY % otherassertiontype "">
<!ENTITY % assertiontype "theorem|lemma|corollary|conjecture|
                          false-conjecture|obligation|postulate|
                          formula|assumption|proposition|rule%otherassertiontype;">
<!ENTITY % omtexttype.st "axiom|definition|example|%assertiontype;">

<!-- the text types for proofs and proof fragments -->
<!ENTITY % omtexttype.pf "proof|derive|hpyothesis">

<!-- putting them all together -->
<!ENTITY % otheromtexttype "">
<!ENTITY % omtexttype "%omtexttype.rst;|%omtexttype.st;|%omtexttype.pf;%otheromtexttype;">


