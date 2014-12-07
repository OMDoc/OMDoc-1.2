<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: st.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/st.xsl $
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
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  exclude-result-prefixes="omdoc">

<xsl:template match="omdoc:assertion">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class">
      <xsl:choose>
	<xsl:when test="@type"><xsl:value-of select="@type"/></xsl:when>
	<xsl:otherwise><xsl:value-of select="'assertion'"/></xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
    <xsl:with-param name="id" select="concat($prefix,@xml:id)"/>
    <xsl:with-param name="title" select="omdoc:localize(@type)"/>
    <xsl:with-param name="content">
      <xsl:apply-templates select="*[local-name()!='symbol']">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:axiom">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'axiom'"/>
    <xsl:with-param name="id" select="concat($prefix,@xml:id)"/>
    <xsl:with-param name="content">
      <xsl:apply-templates select="*[local-name()!='symbol']">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:example">
  <xsl:param name="prefix"/>
  <xsl:variable name="class">
    <xsl:choose>
      <xsl:when test="@type='against'"><xsl:value-of select="'counterexample'"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="'example'"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="$class"/>
    <xsl:with-param name="id" select="concat($prefix,@xml:id)"/>
    <xsl:with-param name="title" select="omdoc:localize(local-name())"/>
    <xsl:with-param name="title-extra">
      <xsl:call-template name="titlebox-for">
        <xsl:with-param name="forid" select="@for"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="content"><xsl:apply-templates/></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<!-- theories are handled like implicit sectioning omgroups -->
<xsl:template match="omdoc:theory">
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:param name="prefix"/>
  <xsl:variable name="number" select="omdoc:new-number($level,$numprefix)"/>
  <xsl:apply-templates select="omdoc:metadata">
    <xsl:with-param name="level" select="$level"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
  <xsl:apply-templates select="*[not(self::omdoc:metadata)]">
    <xsl:with-param name="level" select="$level + 1"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:symbol">
  <xsl:param name="prefix"/>
  <xsl:variable name="id" select="@name"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'symbol'"/>
    <xsl:with-param name="id" select="concat($prefix,@name)"/>
    <xsl:with-param name="title">
      <xsl:if test="@scope='local'"><xsl:text>local</xsl:text></xsl:if>
      <xsl:value-of select="omdoc:localize('symbol')"/>
    </xsl:with-param>
    <xsl:with-param name="title-extra">
      <xsl:value-of select="$id"/>
      <xsl:for-each select="../omdoc:definition[@for=$id]|//omdoc:alternative[@for=$id]">
        <xsl:text>(</xsl:text>
        <xsl:call-template name="with-crossref">
          <xsl:with-param name="uri" select="concat('#',@name)"/>
          <xsl:with-param name="content" select="omdoc:localize('definition')"/>
        </xsl:call-template>
        <xsl:text>)</xsl:text>
      </xsl:for-each>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:apply-templates select="omdoc:metadata/dc:description"/>
      <xsl:apply-templates select="child::node()[not(self::omdoc:metadata)]"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:type">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'type'"/>
    <xsl:with-param name="id">
      <xsl:if test="@xml:id and @xml:id!=''"><xsl:value-of select="concat($prefix,@xml:id)"/></xsl:if>
    </xsl:with-param>
    <xsl:with-param name="title">
      <xsl:value-of select="omdoc:localize('type')"/>
    </xsl:with-param>
    <xsl:with-param name="title-extra">
      <xsl:value-of select="concat('(',@system,')')"/>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:apply-templates>
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:definition">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'definition'"/>
    <xsl:with-param name="id" select="concat($prefix,@xml:id)"/>
    <xsl:with-param name="title" select="omdoc:localize(local-name())"/>
    <xsl:with-param name="title-extra">
      <xsl:call-template name="titlebox-for">
        <xsl:with-param name="forid" select="@for"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:choose>
        <xsl:when test="@type='simple'">
          <xsl:apply-templates select="*[local-name()!='OMOBJ']">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </xsl:when>
        <xsl:otherwise>
          <xsl:apply-templates>
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:alternative">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'definition'"/>
    <xsl:with-param name="id" select="concat($prefix,@xml:id)"/>
    <xsl:with-param name="title-extra">
      <xsl:call-template name="titlebox-for">
        <xsl:with-param name="forid" select="@for"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:apply-templates>
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:requation">
  <xsl:param name="prefix"/>
  <xsl:call-template name="do-nl"/>
  <xsl:apply-templates select="omdoc:pattern">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>=</xsl:text>
  <xsl:apply-templates select="omdoc:value">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:pattern|omdoc:value">
  <xsl:param name="prefix"/>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

<!-- these elements we do not want to see as humans -->

<xsl:template match="omdoc:measure|omdoc:ordering|omdoc:imports"/>

</xsl:stylesheet>


