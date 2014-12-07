<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: pf.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/pf.xsl $
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
  xmlns:func="http://exslt.org/functions"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns:set="http://exslt.org/sets"
  xmlns:saxon="http://icl.com/saxon" 
  extension-element-prefixes="func"
  exclude-result-prefixes="omdoc set func saxon"
  version="1.0">  

<xsl:template match="omdoc:proof[@class='Fitch-style']">
  <xsl:param name="prefix"/>
  <xsl:apply-templates select="." mode="Fitch-style">
    <xsl:with-param name="nodes" select="*"/>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:proof" mode="Fitch-style">
  <xsl:param name="prefix"/>
  <div class="Fitch-proof">
    <xsl:call-template name="collect-Fitch-levels">
      <xsl:with-param name="nodes" select="*"/>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:call-template>
  </div>
</xsl:template>

<xsl:template match="omdoc:derive|omdoc:conclude" mode="Fitch-style">
  <xsl:param name="prefix"/>
  <xsl:param name="numprefix"/>
  <xsl:param name="offset"/>
  <!-- proofstep -->
  <div id="{@xml:id}" class="derive">
    <span class="plineno">
      <xsl:value-of select="$numprefix"/>
      <xsl:value-of select="$offset + position()"/>
    </span>
    <xsl:text> </xsl:text>
    <xsl:apply-templates select="omdoc:CMP">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="@xml:id"/>
    </xsl:apply-templates>
    <xsl:apply-templates select="omdoc:FMP">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text> </xsl:text>
    <!-- justification -->
    <span class="justification">
      <xsl:if test="omdoc:method">
        <span class="justification-method">
          <xsl:value-of select="concat(omdoc:localize('proven-by'),' ')"/>
          <xsl:apply-templates select="omdoc:method"/>
          <xsl:text> </xsl:text>
        </span>
      </xsl:if>
      <xsl:if test="omdoc:premise">
        <span class="justification-premises">
          <xsl:value-of select="concat(omdoc:localize('from-premises'),' ')"/>
          <xsl:for-each select="omdoc:premise">
            <xsl:apply-templates select="." mode="Fitch-style"/>
            <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>        
          </xsl:for-each>
        </span>
      </xsl:if>
    </span>
    <xsl:if test="omdoc:proof">
      <xsl:apply-templates select="omdoc:proof" mode="Fitch-style">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="numprefix" select="concat($numprefix,'.',$offset)"/>
        <xsl:with-param name="offset" select="0"/>
      </xsl:apply-templates>
    </xsl:if>
  </div>
</xsl:template>

<!-- it would be good, if we could refer to the correct line number -->
<xsl:template match="omdoc:premise" mode="Fitch-style">
  <xsl:variable name="xref" select="@xref"/>
  <xsl:variable name="local" select="id($xref)"/>
  <xsl:call-template name="with-crossref">
    <xsl:with-param name="uri" select="concat('#',@xref)"/>
    <xsl:with-param name="content">
      <xsl:choose>
        <xsl:when test="$local"><xsl:value-of select="$local/@xml:id"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="generate-id()"/></xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template name="collect-Fitch-levels">
  <xsl:param name="nodes"/>
  <xsl:param name="prefix"/>
  <xsl:param name="numprefix"/>
  <xsl:param name="offset" select="0"/>
  <xsl:if test="$nodes">
    <!-- the first hypothesis node, the node it is discharged in -->
    <xsl:variable name="hyp" select="$nodes[local-name()='hypothesis'][1]"/>
    <xsl:variable name="dis" select="id($hyp/@discharged-in)"/>
    <!-- treat the stuff before the first hypothesis as we would have -->
    <xsl:variable name="before" select="set:leading($nodes,$hyp)"/>
    <xsl:apply-templates select="$before" mode="Fitch-style">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="numprefix" select="$numprefix"/>
      <xsl:with-param name="offset" select="$offset"/>
    </xsl:apply-templates>
    <xsl:if test="$hyp">
      <xsl:variable name="rest" select="set:trailing($nodes,$hyp)"/>
      <!-- the nodes before and after $dis -->
      <xsl:variable name="segment" select="set:leading($rest,$dis)|$dis"/>
      <xsl:variable name="after" select="set:trailing($rest,$dis)"/>
      <div class="Fitch-box">
        <div id="{$hyp/@xml:id}" class="Fitch-flag">
          <span class="plineno">
            <xsl:value-of select="$numprefix"/>
            <xsl:value-of select="$offset + count($before) + 1"/>
          </span>
          <xsl:apply-templates select="$hyp/*">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </div>
        <xsl:call-template name="collect-Fitch-levels">
          <xsl:with-param name="nodes" select="$segment"/>
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="numprefix" select="$numprefix"/>
          <xsl:with-param name="offset" select="$offset + count($before) + 1"/>
        </xsl:call-template>
      </div>
      <xsl:if test="$after">
        <xsl:call-template name="collect-Fitch-levels">
          <xsl:with-param name="nodes" select="$after"/>
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="numprefix" select="$numprefix"/>
          <xsl:with-param name="offset" select="$offset + count($before) + count($segment) + 1"/>
        </xsl:call-template>
      </xsl:if>
    </xsl:if>
  </xsl:if>
</xsl:template>


</xsl:stylesheet>
