<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: dc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/dc.xsl $
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


<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:func="http://exslt.org/functions" 
 extension-element-prefixes="func"
 xmlns:om="http://www.openmath.org/OpenMath"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:omdoc="http://www.mathweb.org/omdoc"
 version="1.0">  

<!-- this takes care of the section-like headings -->
<xsl:template match="omdoc:omdoc/omdoc:metadata|
                     omdoc:omgroup/omdoc:metadata|
                     omdoc:tgroup/omdoc:metadata|
                     omdoc:omtext/omdoc:metadata">
  <xsl:param name="level"/>
  <xsl:param name="prefix"/>
  <xsl:text>&#xA;&#xA;\</xsl:text>
  <xsl:value-of select="omdoc:compute-section($level)"/>
  <xsl:text>{</xsl:text>
  <xsl:choose>
    <xsl:when test="dc:title">
      <xsl:apply-templates select="dc:title">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="warning">
        <xsl:with-param name="string" select="concat('no title specified in omgroup',../@xml:id)"/>
      </xsl:call-template>
      <xsl:text>No Title Specified</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>}\label{</xsl:text><xsl:value-of select="../@xml:id"/><xsl:text>}&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>
