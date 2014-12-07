<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: pf.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/pf.xsl $
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

<xsl:template match="omdoc:proof">
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'proof'"/>
    <xsl:with-param name="title-extra">
      <xsl:call-template name="titlebox-for">
        <xsl:with-param name="forid" select="@for"/>
        <xsl:with-param name="type" select="'proof'"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:apply-templates select="omdoc:CMP"/>
      <xsl:call-template name="with-list">
        <xsl:with-param name="content">
          <xsl:apply-templates select="omdoc:derive|omdoc:conclude|omdoc:metacomment|omdoc:hypothesis"/>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:proofobject">
  <xsl:call-template name="warning">
    <xsl:with-param name="string" select="'Not presenting proofobject'"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:metacomment">
  <xsl:call-template name="with-item">
    <xsl:with-param name="content"><xsl:apply-templates/></xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:derive|omdoc:conclude|omdoc:hypothesis">
  <xsl:param name="prefix"/>
  <!-- proofstep -->
  <xsl:call-template name="with-item">
    <xsl:with-param name="id" select="@xml:id"/>
    <xsl:with-param name="content">
      <xsl:apply-templates select="omdoc:CMP">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="@xml:id"/>
      </xsl:apply-templates>
      <xsl:apply-templates select="omdoc:FMP">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="@xml:id"/>
      </xsl:apply-templates>
      <xsl:text> </xsl:text>
      <!-- justification -->
      <xsl:if test="omdoc:method">
        <xsl:value-of select="concat(omdoc:localize('proven-by'),' ')"/>
        <xsl:apply-templates select="omdoc:method"/>
      </xsl:if>
      <xsl:if test="omdoc:premise">
        <xsl:value-of select="concat(omdoc:localize('from-premises'),' ')"/>
        <xsl:for-each select="omdoc:premise">
          <xsl:apply-templates select="."/>
          <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>        
        </xsl:for-each>
      </xsl:if>
      <xsl:if test="omdoc:proof"><xsl:apply-templates select="omdoc:proof"/></xsl:if>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>
     
<xsl:template match="omdoc:method">
  <!-- need to reference/present the symbol here <xsl:value-of select="@xref"/> -->
 <xsl:if test="*">
   <xsl:value-of select="concat('(',omdoc:localize('on-parameters'),' ')"/>
  <xsl:for-each  select="*">
   <xsl:apply-templates select="."/>
   <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
  </xsl:for-each>
  <xsl:text>)</xsl:text>
 </xsl:if>
</xsl:template>

<xsl:template match="omdoc:premise">
  <xsl:variable name="xref" select="@xref"/>
  <xsl:variable name="local" select="id($xref)"/>
  <xsl:call-template name="with-crossref">
    <xsl:with-param name="uri" select="concat('#',@xref)"/>
    <xsl:with-param name="content">
      <xsl:choose>
        <xsl:when test="$local/@xml:id!=''"><xsl:value-of select="$local/@xml:id"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="generate-id()"/></xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:proof/omdoc:symbol"/>

</xsl:stylesheet>


