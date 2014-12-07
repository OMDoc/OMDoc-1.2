<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: ext.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/ext.xsl $
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
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  exclude-result-prefixes="omdoc">

<xsl:template match="omdoc:omlet">
  <xsl:call-template name="warning">
    <xsl:with-param name="string">
      <xsl:text>cannot deal with omlet of type </xsl:text>
      <xsl:value-of select="@type"/>
      <xsl:text> yet!</xsl:text>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- we do not want to see raw data, use omlet to show it -->
<xsl:template match="omdoc:private|omdoc:code"/>

<xsl:template match="omdoc:data">
  <xsl:value-of disable-output-escaping='yes' select="."/>
</xsl:template>

<xsl:template match="omdoc:input|omdoc:effect|omdoc:output">
  <xsl:param name="prefix"/>
  <xsl:apply-templates select="omdoc:CMP">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

</xsl:stylesheet>


