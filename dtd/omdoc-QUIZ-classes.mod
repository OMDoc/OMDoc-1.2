<!--
   An XML DTD for Open Mathematical documents (OMDoc 1.2): Module QUIZ Entities
     $Id: omdoc-QUIZ-classes.mod 8014 2008-09-07 19:52:19Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/dtd/omdoc-QUIZ-classes.mod $
     PUBLIC: -//OMDoc//ENTITIES OMDoc QUIZ V1.2//EN
   See the documentation and examples at http://www.omdoc.org 
   Copyright (c) 1999-2006 Michael Kohlhase, released under the GNU Public License (GPL)
-->

<!-- set the following entity to the empty string, 
     if not importing module QUIZ -->
<!ENTITY % omdocquiz.class "|%omdocquiz.exercise.qname;
                            |%omdocquiz.hint.qname;
                            |%omdocquiz.mc.qname;
                            |%omdocquiz.solution.qname;">
