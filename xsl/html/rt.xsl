<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: rt.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/rt.xsl $
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
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="omdoc"
  version="1.0">  

<xsl:template match="omdoc:ul">
  <xsl:param name="prefix"/>
  <xsl:param name="indexprefix"/>
  <ul>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </ul>
</xsl:template>

<xsl:template match="omdoc:ol">
  <xsl:param name="prefix"/>
  <xsl:param name="indexprefix"/>
  <ol>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </ol>
</xsl:template>

<xsl:template match="omdoc:li">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <li>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </li>
</xsl:template>

<xsl:template match="omdoc:highlight">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <span class="highlight">
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </span>
</xsl:template>

<xsl:template match="omdoc:table">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <table>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </table>
</xsl:template>

<xsl:template match="omdoc:tr">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <tr>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </tr>
</xsl:template>

<xsl:template match="omdoc:td">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <td>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </td>
</xsl:template>

<xsl:template match="omdoc:th">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <th>
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </th>
</xsl:template>

<xsl:template match="omdoc:link">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <a href="{@href}">
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </a>
</xsl:template>


<!-- line end comments are placed right there --> 
<xsl:template match="omdoc:note[@type='line-end-comment']">
  <span class="line-end-comment"><xsl:apply-templates/></span>
</xsl:template>

<!-- other notes are treated as footnotes -->
<xsl:template match="omdoc:note">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <xsl:variable name="num" select="count(preceding::omdoc:note)"/>
  <xsl:message>bare note</xsl:message>
  <span class="noteref">
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <a href="#{concat($prefix,@xml:id)}"><xsl:value-of select="$num"/></a>
  </span>
</xsl:template>

<!-- *************** need to do something here ********** -->
<xsl:template match="omdoc:omdocref">
  <xsl:param name="indexprefix"/>
  <xsl:param name="prefix"/>
  <a href="{@href}">
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="indexprefix" select="$indexprefix"/>
    </xsl:apply-templates>
  </a>
</xsl:template>

<xsl:template name="do-notesep"><hr/></xsl:template>

<xsl:template name="print-note">
  <xsl:param name="prefix"/>
  <xsl:param name="indexprefix"/>
  <xsl:param name="num"/>
  <xsl:param name="id"/>
  <xsl:param name="content"/>
  <div class="note">
    <xsl:choose>
      <xsl:when test="$id"><xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute></xsl:when>
      <xsl:when test="@xml:id"><xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute></xsl:when>
      <xsl:when test="@index and $indexprefix!=''">
        <xsl:attribute name="id">
          <xsl:value-of select="concat($indexprefix,@index)"/>
        </xsl:attribute>
      </xsl:when>
    </xsl:choose>
    <span class="notenumber"><xsl:value-of select="$num"/></span>
    <xsl:copy-of select="$content"/>
  </div>
</xsl:template>
</xsl:stylesheet>


