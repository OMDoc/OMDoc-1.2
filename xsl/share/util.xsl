<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: util.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/util.xsl $
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
  xmlns:func="http://exslt.org/functions" 
  extension-element-prefixes="func"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  exclude-result-prefixes="omdoc func">


<!-- this template makes a title line for elements with a for attribute -->
<xsl:template name="titlebox-for">
  <xsl:param name="forid"/>
  <xsl:variable name="ffor">
    <xsl:if test="id($forid)"><xsl:value-of select="concat('#',$forid)"/></xsl:if>
  </xsl:variable>
  <xsl:if test="$ffor!=''">
    <xsl:value-of select="concat(' ',omdoc:localize('for'),' ')"/>
    <xsl:call-template name="with-crossref">
      <xsl:with-param name="uri" select="$ffor"/>
      <xsl:with-param name="content">
        <xsl:if test="$forid!=''"><xsl:value-of select="$forid"/></xsl:if>
      </xsl:with-param>
    </xsl:call-template>
    <xsl:text> </xsl:text>
  </xsl:if>
</xsl:template>

<!-- this predicate decides whether an element is treated as a block element in xhtml
     (and must therefore be put in parallel to the <p> elements  -->
<func:function name="omdoc:blocklike">
  <!-- <func:result select="true()"/> -->
   <xsl:choose>
    <xsl:when test="local-name()='omlet' or 
                    local-name()='p' or
                    local-name()='ul'or
                    local-name()='ol'or
                    local-name()='table'">
      <func:result select="true()"/>
    </xsl:when>
    <xsl:when test="@style and contains(@style,'display:block')"><func:result select="true()"/></xsl:when>
    <xsl:when test="@class and @class='displaymath'"><func:result select="true()"/></xsl:when>
    <xsl:when test="local-name()='p'"><func:result select="true()"/></xsl:when>
    <xsl:otherwise><func:result select="false()"/></xsl:otherwise>
  </xsl:choose>
</func:function>
</xsl:stylesheet>


