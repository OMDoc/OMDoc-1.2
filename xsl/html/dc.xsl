<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: dc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/dc.xsl $
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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="dc omdoc"
  version="1.0">  

<!-- this takes care of the section-like headings -->
<xsl:template match="omdoc:omdoc/omdoc:metadata|
                     omdoc:omgroup/omdoc:metadata|
                     omdoc:tgroup/omdoc:metadata|
                     omdoc:theory/omdoc:metadata|
                     omdoc:omtext/omdoc:metadata">
  <xsl:param name="level"/>
  <xsl:param name="prefix"/>
  <xsl:param name="numprefix"/>
  <xsl:text>&#xA;</xsl:text>
  <xsl:element name="h{$level+1}">
    <xsl:if test="../@xml:id">
      <xsl:attribute name="id"><xsl:value-of select="concat($prefix,../@xml:id)"/></xsl:attribute>
    </xsl:if>
    <xsl:value-of select="$numprefix"/>
    <xsl:if test="$numprefix"><xsl:text>.</xsl:text></xsl:if><xsl:text> </xsl:text>
    <xsl:choose>
      <xsl:when test="dc:title"><xsl:apply-templates select="dc:title"/></xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="warning">
          <xsl:with-param name="string" 
            select="concat('no title specified in ',local-name(..),' ',../@xml:id)"/>
        </xsl:call-template>
        <xsl:text>No Title Specified</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>



