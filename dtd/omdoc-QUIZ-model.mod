<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2) Module QUIZ
     $Id: omdoc-QUIZ-model.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-QUIZ-model.mod $
     PUBLIC -//OMDoc//ELEMENTS OMDoc QUIZ V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!ELEMENT %omdocquiz.exercise.qname; 
          (%omdocmtxt.MCFS.content;,(%omdocquiz.hint.qname;)*,
            ((%omdocquiz.solution.qname;)*|(%omdocquiz.mc.qname;)*))>
<!ATTLIST %omdocquiz.exercise.qname; 
          %omdoc.common.attribs; 
          %omdoc.toplevel.attribs;
          for %omdocref; #IMPLIED>

<!ELEMENT %omdocquiz.hint.qname; (%omdocmtxt.MCFS.content;)>
<!ATTLIST %omdocquiz.hint.qname; 
          %omdoc.common.attribs; 
          %omdoc.toplevel.attribs;
          %fori.attrib;>

<!ELEMENT %omdocquiz.solution.qname; (%omdocdoc.meta.content;(%omdoc.class;)*)>
<!ATTLIST %omdocquiz.solution.qname; 
          %omdoc.common.attribs; 
          %omdoc.toplevel.attribs;
          for %omdocref; #IMPLIED>

<!ELEMENT %omdocquiz.mc.qname; ((%ss;|%omdocquiz.choice.qname;),
           (%omdocquiz.hint.qname;)?,%omdocquiz.answer.qname;)>
<!ATTLIST %omdocquiz.mc.qname; 
          %omdoc.common.attribs; 
          %omdoc.toplevel.attribs;
          for %omdocref; #IMPLIED>

<!ELEMENT %omdocquiz.choice.qname; (%omdocmtxt.MCFS.content;)>
<!ATTLIST %omdocquiz.choice.qname; 
          %omdoc.common.attribs; 
          %id.attrib;>

<!ELEMENT %omdocquiz.answer.qname; (%omdocmtxt.MCFS.content;)>
<!ATTLIST %omdocquiz.answer.qname; 
          %omdoc.common.attribs; 
          verdict (true|false) #REQUIRED
          %id.attrib;>

