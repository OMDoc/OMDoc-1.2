<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: mtxt.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/mtxt.xsl $
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

<!-- this gets rid of the a dumb special case that leads to faulty behavior in Mozilla -->
<xsl:template match="omdoc:omtext">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="@type"/>
    <xsl:with-param name="content">
      <xsl:apply-templates><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:CMP|omdoc:p">
  <xsl:param name="prefix"/>
  <xsl:param name="indexprefix"/>
  <xsl:if test="omdoc:valid-language()">
    <xsl:call-template name="collect-textlike">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
      <xsl:with-param name="nodes" select="child::node()|child::text()"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>

<!-- this template collects the text nodes into paragraphs, separated by the 
     results of the omlet elements -->
<xsl:template name="collect-textlike">
  <xsl:param name="nodes"/>
  <xsl:param name="prefix"/>
  <xsl:param name="indexprefix"/>
  <xsl:if test="$nodes">
    <xsl:variable name="blocklike" select="$nodes[omdoc:blocklike()]"/>
    <xsl:variable name="textlike" select="set:leading($nodes,$blocklike)"/>
    <xsl:if test="$textlike">
      <xsl:call-template name="with-par">
        <xsl:with-param name="content">
          <xsl:apply-templates select="$textlike">
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="indexprefix" select="$indexprefix"/>
          </xsl:apply-templates>
        </xsl:with-param>
        <xsl:with-param name="id">
          <xsl:choose>
            <xsl:when test="@xml:id"><xsl:value-of select="@xml:id"/></xsl:when>
            <xsl:when test="@index and $indexprefix!=''">
              <xsl:value-of select="concat($indexprefix,@index)"/>
            </xsl:when>
          </xsl:choose>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:if>
    <xsl:text>&#xA;</xsl:text>
    <xsl:apply-templates select="$blocklike[1]">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
    <xsl:if test="$blocklike">
      <xsl:variable name="rest" select="set:trailing($nodes,$blocklike)"/>
      <xsl:call-template name="collect-textlike">
        <xsl:with-param name="nodes" select="$rest"/>
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="$indexprefix"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:if>
</xsl:template>

<xsl:template match="omdoc:FMP">
  <xsl:param name="prefix"/>
  <xsl:param name="indexprefix"/>
  <xsl:variable name="display">
    <xsl:choose>
      <xsl:when test="omdoc:blocklike()"><xsl:text>block</xsl:text></xsl:when>
      <xsl:otherwise><xsl:text>inline</xsl:text></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:call-template name="with-style">
    <xsl:with-param name="class" select="'FMP'"/>
    <xsl:with-param name="display" select="$display"/>
    <xsl:with-param name="content">
      <xsl:apply-templates>
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="$indexprefix"/>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:assumption|omdoc:conclusion">
  <xsl:call-template name="localize-self"/>
</xsl:template>

<func:function name="omdoc:leading">
  <xsl:param name="nodes"/>
  <xsl:param name="node"/>
  <xsl:choose>
    <xsl:when test="function-available('set:leading')">
      <func:result select="set:leading($nodes,$node)"/>
    </xsl:when>
    <xsl:when test="function-available('saxon:leading')">
      <func:result select="saxon:leading($nodes,$node)"/>
    </xsl:when>
    <xsl:otherwise><xsl:message terminate="yes">no leading function available</xsl:message></xsl:otherwise>
  </xsl:choose>
</func:function>


<func:function name="omdoc:trailing">
  <xsl:param name="nodes"/>
  <xsl:param name="node"/>
  <xsl:choose>
    <xsl:when test="function-available('set:trailing')">
      <func:result select="set:trailing($nodes,$node)"/>
    </xsl:when>
    <xsl:otherwise><xsl:message terminate="yes">no leading function available</xsl:message></xsl:otherwise>
  </xsl:choose>
</func:function>

</xsl:stylesheet>


