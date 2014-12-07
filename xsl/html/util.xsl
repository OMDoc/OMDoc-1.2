<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: util.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/util.xsl $
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
  xmlns:func="http://exslt.org/functions" 
  extension-element-prefixes="func"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="omdoc func"
  version="1.0">  

<func:function name="omdoc:unless-class">
  <xsl:param name="else"/>
  <xsl:choose>
    <xsl:when test="@class"><func:result select="@class"/></xsl:when>
    <xsl:otherwise><func:result select="$else"/></xsl:otherwise>
  </xsl:choose>
</func:function>

<xsl:template name="with-par">
  <xsl:param name="id"/>
  <xsl:param name="content"/>
  <xsl:text>&#xA;</xsl:text>
  <p xmlns="http://www.w3.org/1999/xhtml">
    <xsl:if test="$id!=''">
      <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
    </xsl:if>
    <xsl:copy-of select="$content"/>
  </p>
</xsl:template>

<xsl:template name="with-list">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <xsl:if test="count($content)&gt;0">
    <ol><xsl:copy-of select="$content"/></ol>
  </xsl:if>
</xsl:template>

<xsl:template name="with-unordered-list">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <xsl:if test="count($content)&gt;0">
    <ul><xsl:copy-of select="$content"/></ul>
  </xsl:if>
</xsl:template>

<xsl:template name="with-item">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <xsl:if test="$content!=''">
    <li><xsl:copy-of select="$content"/></li>
  </xsl:if>
</xsl:template>

<xsl:template name="with-bold">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <b><xsl:copy-of select="$content"/></b>
</xsl:template>


<xsl:template name="with-crossref">
  <xsl:param name="prefix"/>
  <xsl:param name="uri"/>
  <xsl:param name="content"/>
  <a href="{$uri}"><xsl:copy-of select="$content"/></a>
</xsl:template>

<xsl:template name="do-nl">
  <br/><xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template name="with-omdocenv">
  <xsl:param name="prefix"/>
  <xsl:param name="class" select="'default-omdocenv'"/>
  <xsl:param name="style" select="@style"/>
  <xsl:param name="id" select="@xml:id"/>
  <xsl:param name="title" select="omdoc:localize(local-name())"/>
  <xsl:param name="title-extra"/>
  <xsl:param name="content"/>
  <xsl:text>&#xA;</xsl:text>
  <div class="{$class}">
    <xsl:if test="$id!=''">
      <xsl:attribute name="id"><xsl:value-of select="concat($prefix,$id)"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="$style!=''">
      <xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
    </xsl:if>
    <xsl:choose>
      <xsl:when test="$title-extra!=''">
        <xsl:text>&#xA;</xsl:text>
        <div class="titlebox">
          <xsl:text>&#xA;</xsl:text>
          <span class="titleword"><xsl:copy-of select="$title"/></span>
          <xsl:copy-of select="$title-extra"/>
        </div>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>&#xA;</xsl:text>
        <span class="titleword"><xsl:copy-of select="$title"/></span>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:copy-of select="$content"/>
  </div>
  <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template name="localize-self">
  <xsl:param name="prefix"/>
  <xsl:text>&#xA;</xsl:text>
  <div class="{local-name()}">
    <xsl:if test="@xml:id">
      <xsl:attribute name="id"><xsl:value-of select="concat($prefix,@xml:id)"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="@style">
      <xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
    </xsl:if>
    <xsl:text>&#xA;</xsl:text>
    <span class="titleword"><xsl:value-of select="omdoc:localize(local-name())"/></span>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </div>
  <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template name="with-style">
  <xsl:param name="prefix"/>
  <xsl:param name="class"/>
  <xsl:param name="id"/>
  <xsl:param name="style"/>
  <xsl:param name="display" select="'inline'"/>
  <xsl:param name="content"/>
  <xsl:choose>
    <xsl:when test="$display='block'">
      <xsl:text>&#xA;</xsl:text>
      <div>
        <xsl:if test="$id!=''">
          <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
        </xsl:if>
        <xsl:if test="$class!=''">
          <xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute>
        </xsl:if>
        <xsl:if test="$style!=''">
          <xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
        </xsl:if>
        <xsl:copy-of select="$content"/></div>
      </xsl:when>
      <xsl:when test="$display='inline'">
        <xsl:text>&#xA;</xsl:text>
        <span xmlns="http://www.w3.org/1999/xhtml">
          <xsl:if test="$id!=''">
            <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
          </xsl:if>
          <xsl:if test="$class!=''">
            <xsl:attribute name="class"><xsl:value-of select="$class"/></xsl:attribute>
          </xsl:if>
          <xsl:if test="$style!=''">
            <xsl:attribute name="style"><xsl:value-of select="$style"/></xsl:attribute>
          </xsl:if>
          <xsl:copy-of select="$content"/>
        </span>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="error">
          <xsl:with-param name="string">
            <xsl:text>Unrecognized value '</xsl:text>
            <xsl:value-of select="$display"/>
            <xsl:text>' for argument 'display' in template with-style</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

</xsl:stylesheet>



