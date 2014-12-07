<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: omdoc2tex.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/omdoc2tex.xsl $
     Comments are welcome! (send mail to users@omdoc.org or developers@omdoc.org)
     See the documentation and examples at http://omdoc.org

     Copyright (c) 2000 - 2002 Michael Kohlhase, 

     This library is free software; you can redistribute it and/or
     modify it under the terms of the GNU Lesser General Public
     License as published by the Free Software Foundation; either
     version 2.1 of the License, or (at your option) any later version.

     This library is distributed in the hope that it will be useful,
     but WITHOUT ANY WARRANTY; without even the implied warranty of
     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
     Lesser General Public License for more details.

     You should have received a copy of the GNU Lesser General Public
     License along with this library; if not, write to the Free Software
     Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-->


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  

<xsl:import href="omdoc2share.xsl"/>
<xsl:include href="tex/mobj.xsl"/>
<xsl:include href="tex/doc.xsl"/>
<xsl:include href="tex/rt.xsl"/>
<xsl:include href="tex/dc.xsl"/>
<!-- nothing there <xsl:include href="tex/st.xsl"/>-->
<xsl:include href="tex/ext.xsl"/>
<xsl:include href="tex/quiz.xsl"/>
<xsl:include href="tex/util.xsl"/>
<xsl:include href="tex/compatibility.xsl"/>

<xsl:variable name="format" select="'TeX'"/>

<xsl:output method="text"/>
<xsl:strip-space elements = "*"/> 
<!-- =============================== -->
<!-- declaration of input parameters -->
<!-- =============================== -->

<!-- 'TargetLanguage': default is en for xml:lang-attribute in 
     omdoc-output. It consists of whitespace separated, ordered list 
     of languages (example-call: TargetLanguage="en de fr")
     It is also valid in the imported stylesheets! 
     -->
<xsl:param name="TargetNS" select="'ERROR'"/>
<xsl:param name="TargetLanguage" select="'en'"/>
<!-- the format for the cross-references on the symbols -->
<xsl:param name="crossref-format" select="'html'"/>
<!-- 'usepackage': determines the LaTeX style files to be called. 
     This is a  comma-separated list of style files without the extension '.sty' -->
<xsl:param name="usepackage" select="'omdoc'"/>
<!-- the LaTeX document class -->
<xsl:param name="docclass" select="'article'"/>
<!-- the class, we support 'book', and 'article' -->
<xsl:param name="sectioning-model" select="'article'"/>

</xsl:stylesheet>
