<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc 
     (Open Mathematical Documents) Module DOC. 
     $Id: doc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/pmml/doc.xsl $
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
  xmlns:pref="http://www.w3.org/2002/Math/preference"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  exclude-result-prefixes="dc omdoc pref xlink"
  version="1.0">  

<xsl:template name="with-document">
  <xsl:param name="id"/>
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <html>
    <xsl:if test="$id!=''">
      <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
    </xsl:if>
    <head>
      <xsl:choose>
        <xsl:when test="$css!=''">
          <link rel="stylesheet" type="text/css" href="{$css}"/>
        </xsl:when>
        <xsl:otherwise>
          <link rel="stylesheet" type="text/css" href="omdoc-default.css"/>
        </xsl:otherwise>
      </xsl:choose>
      <title>
        <xsl:if test="/omdoc:omdoc/omdoc:metadata/dc:title">
          <xsl:apply-templates select="/omdoc:omdoc/omdoc:metadata/dc:title">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </xsl:if>
      </title>
    </head>
    <body><xsl:copy-of select="$content"/></body>
  </html>
</xsl:template>

</xsl:stylesheet>



