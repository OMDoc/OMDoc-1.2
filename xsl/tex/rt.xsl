<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: rt.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/rt.xsl $
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
  xmlns:math="http://exslt.org/math"
  xmlns:str="http://exslt.org/strings"
  xmlns:func="http://exslt.org/functions"
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="math str func exsl"
  exclude-result-prefixes="omdoc exsl"
  version="1.0">  

<xsl:template match="omdoc:ul">
  <xsl:param name="prefix"/>
  <xsl:text>\begin{itemize}&#xA;</xsl:text>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>\end{itemize}&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:p">
  <xsl:param name="prefix"/>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>&#xA;&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:ol">
  <xsl:param name="prefix"/>
  <xsl:text>\begin{enumerate}&#xA;</xsl:text>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>\end{enumerate}&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:li">
  <xsl:param name="prefix"/>
  <xsl:text>\item </xsl:text>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:highlight">
  <xsl:param name="prefix"/>
  <xsl:text>{\em{</xsl:text>
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  <xsl:text>}}</xsl:text>
</xsl:template>

<xsl:template match="omdoc:table">
  <xsl:param name="prefix"/>
  <xsl:variable name="lengths">
    <xsl:for-each select="omdoc:tr">
      <num><xsl:value-of select="count(omdoc:td)"/></num>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="length" select="math:max(exsl:node-set($lengths)/*)"/>
  <xsl:text>\begin{tabular}{</xsl:text>
  <xsl:value-of select="str:padding($length,'l')"/>
  <xsl:text>}&#xA;</xsl:text>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>\end{tabular}&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:tr">
  <xsl:param name="prefix"/>
  <xsl:for-each select="omdoc:td">
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()">
      <xsl:text disable-output-escaping="yes"> &amp; </xsl:text>
    </xsl:if>
  </xsl:for-each>
  <xsl:text>\\&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:td">
  <xsl:param name="prefix"/>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>


<xsl:template match="omdoc:link">
  <xsl:param name="prefix"/>
  <xsl:text>\href{</xsl:text>
  <xsl:value-of select="@href"/>
  <xsl:text>}{</xsl:text>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- *************** need to do something here ********** -->
<xsl:template match="omdoc:omdocref">
  <xsl:param name="prefix"/>
  <xsl:text>\href{</xsl:text>
  <xsl:value-of select="@href"/>
  <xsl:text>}{</xsl:text>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>}</xsl:text>
</xsl:template>


<xsl:template match="omdoc:note">
  <xsl:param name="prefix"/>
  <xsl:text>\footnote{</xsl:text>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text>}</xsl:text>
</xsl:template>

<!-- TeX handles the placement of footnotes itself -->
<xsl:template name="do-notes"/>

<!-- by Jeni Tenison (obtained from exslt.org) -->
<func:function name="str:padding">
	<xsl:param name="length" select="0" />
   <xsl:param name="chars" select="' '" />
   <xsl:choose>
      <xsl:when test="not($length) or not($chars)" />
      <xsl:otherwise>
         <xsl:variable name="string" 
                       select="concat($chars, $chars, $chars, $chars, $chars, 
                                      $chars, $chars, $chars, $chars, $chars)" />
         <xsl:choose>
            <xsl:when test="string-length($string) >= $length">
               <func:result select="substring($string, 1, $length)" />
            </xsl:when>
            <xsl:otherwise>
               <func:result select="str:padding($length, $string)" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:otherwise>
   </xsl:choose>
</func:function>

</xsl:stylesheet>


