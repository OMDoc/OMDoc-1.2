<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc 
     (Open Mathematical Documents) Module DOC. 
     $Id: mtxt.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/mtxt.xsl $
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

<xsl:template match="omdoc:omtext[@type='quote']">
  <xsl:param name="prefix"/>
  <div class="quote">
    <xsl:text>"</xsl:text>
    <xsl:apply-templates select="omdoc:CMP">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="@xml:id"/>
    </xsl:apply-templates>
    <xsl:text>"</xsl:text>
    <div class="caption">
      <xsl:text>--</xsl:text>
      <xsl:apply-templates select="omdoc:metadata/dc:source">
        <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="@xml:id"/>
      </xsl:apply-templates>
    </div>
  </div>
</xsl:template>

<xsl:template match="omdoc:term">
  <a class="{@role}term" href="#{@name}"><xsl:apply-templates/></a>
</xsl:template>

<xsl:template match="omdoc:omtext">
  <xsl:param name="prefix"/>
  <!-- first be sure that there is some content, empty div elements lead to problems in Mozilla -->
  <xsl:variable name="cont">
    <xsl:apply-templates select="omdoc:CMP">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="@xml:id"/>
    </xsl:apply-templates>
  </xsl:variable>
  <xsl:variable name="titlecont"><xsl:apply-templates select="omdoc:metadata/dc:title"/></xsl:variable>
  <xsl:variable name="title">
    <xsl:if test="$titlecont!=''">
      <span class='omtext-title'><xsl:copy-of select="$titlecont"/></span>
    </xsl:if>
  </xsl:variable>
  <xsl:if test="string($cont)!=''">
    <xsl:text>&#xA;</xsl:text>
    <div class="omtext">
      <xsl:if test="@xml:id">
        <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
      </xsl:if>
      <xsl:choose>
        <!-- annotations have to be presented in a special size/color.
             Unfortunately, the enumeration isn't included, so ordered lists
             consisting of annotated omtexts, don't look so nice... -->
        <xsl:when test="@type='annote'">
          <div class="annotation">
	  <xsl:copy-of select="$title"/>
	  <xsl:copy-of select="$cont"/>
        </div>
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="$title"/>
          <xsl:copy-of select="$cont"/>
        </xsl:otherwise>
      </xsl:choose>
    </div>
    <xsl:text>&#xA;</xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template name="print-sequent">
  <xsl:param name="prefix"/>
  <xsl:for-each select="omdoc:assumption">
    <xsl:apply-templates  select="*[local-name()!='CMP']">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
  </xsl:for-each>
  <xsl:text>&#x022A2;</xsl:text>
  <xsl:for-each select="omdoc:conclusion">
    <xsl:apply-templates select="*[local-name()!='CMP']">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
  </xsl:for-each>
</xsl:template>


</xsl:stylesheet>



