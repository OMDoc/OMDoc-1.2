<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: omdoc2pmml.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/omdoc2pmml.xsl $
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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">  

<xsl:import href="ctop.xsl"/>
<xsl:include href="omdoc2share.xsl"/>
<xsl:include href="html/doc.xsl"/>
<xsl:include href="html/mtxt.xsl"/>
<xsl:include href="html/dc.xsl"/>
<xsl:include href="html/ext.xsl"/>
<xsl:include href="html/quiz.xsl"/>
<xsl:include href="html/util.xsl"/>
<xsl:include href="html/rt.xsl"/>
<xsl:include href="html/pf.xsl"/>
<xsl:include href="html/compatibility.xsl"/>
<xsl:include href="pmml/doc.xsl"/>
<xsl:include href="pmml/mobj.xsl"/>
<xsl:include href="pmml/util.xsl"/>

<xsl:variable name="format" select="'pmml'"/>

<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/> 

<!-- the format to cross-reference to -->
<xsl:param name="crossref-format" select="'xhtml'"/>
<!-- the namespace for the elements created in mathematical formulae -->
<xsl:param name="TargetNS" select="'http://www.w3.org/1998/Math/MathML'"/>
<!-- the DTD to be used in the doctype declaration -->
<xsl:param name="dtd-system" select="'http://www.mathweb.org/omdoc/dtd/xhtml-math11-om.dtd'"/>
<xsl:param name="dtd-public" select="'-//OMDoc//DTD XHTML 1.1 plus MathML 2.0 plus OMDoc OM//EN'"/>
<!-- 'css': determines the css-stylesheet to be connected with the html-output -->
<xsl:param name="css"/>

<xsl:param name="debug" select="false()"/> 

<xsl:strip-space elements="*"/>
<!-- we do not define any templates here, 
     they are all in the imported stylesheets -->
</xsl:stylesheet>




