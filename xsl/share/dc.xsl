<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: dc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/dc.xsl $
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
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:omdoc="http://www.mathweb.org/omdoc"
 xmlns:date="http://exslt.org/dates-and-times"
 exclude-result-prefixes="dc omdoc date"
 version="1.0">  

<xsl:template match="omdoc:metadata" mode="top">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-style">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="class" select="'titleblock'"/>
    <xsl:with-param name="display" select="'block'"/>
    <xsl:with-param name="content">
      <xsl:call-template name="with-style">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="class" select="'title'"/>
        <xsl:with-param name="display" select="'block'"/>
        <xsl:with-param name="content">
          <xsl:choose>
            <xsl:when test="dc:title">
              <xsl:apply-templates select="dc:title">
                <xsl:with-param name="prefix" select="$prefix"/>
              </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise><xsl:text>No Title Specified</xsl:text></xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="with-style">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="class" select="'authors'"/>
        <xsl:with-param name="display" select="'block'"/>
        <xsl:with-param name="content">
          <xsl:choose>
            <xsl:when test="count(dc:creator)&gt;0">
              <xsl:for-each select="dc:creator">
                <xsl:apply-templates/>
                <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
              </xsl:for-each>	
            </xsl:when>
            <xsl:otherwise><xsl:text>No Author Specified</xsl:text></xsl:otherwise>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
      <xsl:if test="dc:date">
        <xsl:call-template name="with-style">
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="class" select="'date'"/>
          <xsl:with-param name="display" select="'block'"/>
          <xsl:with-param name="content">
            <xsl:apply-templates select="dc:date"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="dc:subject">
        <xsl:call-template name="with-style">
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="class" select="'subject'"/>
          <xsl:with-param name="display" select="'block'"/>
          <xsl:with-param name="content">
            <xsl:apply-templates select="dc:subject"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
      <xsl:if test="dc:description">
        <xsl:call-template name="with-style">
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="class" select="'description'"/>
          <xsl:with-param name="display" select="'block'"/>
          <xsl:with-param name="content">
            <xsl:apply-templates select="dc:description"/>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:metadata"> 
  <xsl:param name="prefix"/>
  <xsl:variable name="simple-metadata">
    <xsl:choose>
      <xsl:when test="dc:title">
        <xsl:apply-templates select="dc:title">
          <xsl:with-param name="prefix" select="$prefix"/>
        </xsl:apply-templates>
      </xsl:when>
      <xsl:when test="dc:subject">
        <xsl:apply-templates select="dc:subject">
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="simple" select="'yes'"/>
        </xsl:apply-templates>
      </xsl:when>
      <xsl:otherwise><xsl:value-of select="@xml:id"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:if test="$simple-metadata!=''">
    <xsl:text> (</xsl:text>
    <xsl:value-of select="$simple-metadata"/>
    <xsl:text>) </xsl:text>
  </xsl:if> 
  <xsl:if test="dc:creator">
    <xsl:text> [</xsl:text>
    <xsl:apply-templates select="dc:creator">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>] </xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="dc:creator|dc:contributor">
  <xsl:param name="prefix"/>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="dc:date">
  <xsl:variable name="d" select="."/>
  <!-- <xsl:message><xsl:value-of select="$d"/></xsl:message> -->
  <xsl:value-of select="date:date($d)"/>
</xsl:template>


<xsl:template match="dc:title|dc:subject|dc:description|dc:source">
  <xsl:param name="prefix"/>
  <xsl:if test="omdoc:valid-language()">
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>


</xsl:stylesheet>


