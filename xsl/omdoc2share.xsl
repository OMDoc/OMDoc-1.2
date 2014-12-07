<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: omdoc2share.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/omdoc2share.xsl $
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

<xsl:stylesheet 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:omdoc="http://www.mathweb.org/omdoc"
 exclude-result-prefixes="omdoc"
 version="1.0">  

<xsl:include href="util/error.xsl"/>
<xsl:include href="util/uri.xsl"/>
<xsl:include href="util/locale.xsl"/>
<xsl:include href="util/multiling.xsl"/>
<xsl:include href="share/mobj.xsl"/>
<xsl:include href="share/doc.xsl"/>
<xsl:include href="share/mtxt.xsl"/>
<xsl:include href="share/rt.xsl"/>
<xsl:include href="share/dc.xsl"/>
<xsl:include href="share/st.xsl"/>
<xsl:include href="share/pf.xsl"/>
<xsl:include href="share/ext.xsl"/>
<xsl:include href="share/quiz.xsl"/>
<xsl:include href="share/util.xsl"/>

<xsl:strip-space elements="*"/>

<!-- Module CTH -->
<xsl:template match="omdoc:morphism|omdoc:inclusion|
                     omdoc:axiom-inclusion|omdoc:theory-inclusion|
                     omdoc:path-just|omdoc:obligation|omdoc:decomposition"/>

<!-- Module ADT -->
<xsl:template match="omdoc:adt|omdoc:sortdef|
                     omdoc:constructor|omdoc:argument|
                     omdoc:insort|omdoc:selector"/>

<!-- Module PRES -->
<xsl:template match="omdoc:presentation|omdoc:omstyle"/>


</xsl:stylesheet>


