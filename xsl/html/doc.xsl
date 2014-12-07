<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc 
     (Open Mathematical Documents) Module DOC. 
     $Id: doc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/doc.xsl $
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

<!-- the omgroups only recurse, the templates for metadata do 
     the work of computing the sections -->
<xsl:template match="omdoc:omgroup[@type='slide']|omdoc:tgroup[@type='slide']">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <div class="slide">
    <div class="slidetitle"><xsl:apply-templates select="omdoc:metadata/dc:title"/></div>
    <div class="slidecontent">
      <xsl:variable name="id" select="@xml:id"/>
      <xsl:if test="//omdoc:private[@for=$id and @pto='migration']/omdoc:data/@href!=''">
	<div class="migration">
	Migration: Click 
	<a href="{//omdoc:private[@for=$id]/omdoc:data/@href}">here</a> 
	to see original slide</div>
      </xsl:if>
      <xsl:apply-templates select="*[not(self::omdoc:metadata)]"/>
    </div>
  </div>
</xsl:template>
    
<xsl:template match="omdoc:omgroup|omdoc:omgroup">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:variable name="number" select="omdoc:new-number($level,$numprefix)"/>
  <xsl:apply-templates select="omdoc:metadata">
    <xsl:with-param name="level" select="$level"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
  <xsl:variable name="id" select="@xml:id"/>
  <xsl:if test="@type='slide'
                and //omdoc:private[@for=$id and @pto='migration']/omdoc:data/@href!=''">
    <div class="migration">
      Migration: Click <a href="{//omdoc:private[@for=$id]/omdoc:data/@href}">here</a> to see original slide</div>
  </xsl:if>
  <xsl:apply-templates select="*[not(self::omdoc:metadata)]">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="level" select="$level + 1"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
</xsl:template>

<!-- we will take care of 'ednote' comments. -->
<xsl:template match="omdoc:ignore[@type='ednote']">
  <xsl:param name="prefix"/>
  <div class="ednote">
    <xsl:if test="@xml:id">
      <xsl:attribute name="id"><xsl:value-of select="concat($prefix,@xml:id)"/></xsl:attribute>
    </xsl:if>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </div>
</xsl:template>
</xsl:stylesheet>



