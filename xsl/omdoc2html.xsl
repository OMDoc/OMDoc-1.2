<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: omdoc2html.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/omdoc2html.xsl $
     send bug-reports, patches, suggestions to developers@omdoc.org

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

<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:include href="omdoc2share.xsl"/>
<xsl:include href="html/html.xsl"/>
<xsl:include href="html/mobj.xsl"/>
<xsl:include href="html/doc.xsl"/>
<xsl:include href="html/mtxt.xsl"/>
<xsl:include href="html/dc.xsl"/>
<xsl:include href="html/ext.xsl"/>
<xsl:include href="html/quiz.xsl"/>
<xsl:include href="html/util.xsl"/>
<xsl:include href="html/rt.xsl"/>
<xsl:include href="html/pf.xsl"/>
<xsl:include href="html/compatibility.xsl"/>

<!-- the format for the cross-references on the symbols -->
<xsl:param name="crossref-format" select="'html'"/>
<!-- the namespace for the elements created in mathematical formulae -->
<xsl:param name="TargetNS" select="'http://www.w3.org/1999/xhtml'"/>
<!-- the DTD to be used in the doctype declaration -->
<xsl:param name="dtd-system" select="'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'"/>
<xsl:param name="dtd-public" select="'-//W3C//DTD XHTML 1.0 Strict//EN'"/>
<!-- 'css': determines the css-stylesheet to be connected with the html-output -->
<xsl:param name="css"/>

<!-- global variables -->
<xsl:variable name="format" select="'html'"/>

<xsl:output method="xml" indent="yes"/> 

<xsl:strip-space elements="*"/>
</xsl:stylesheet>



