<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: mobj.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/mobj.xsl $
     Comments are welcome! (send mail to users@omdoc.org or developers@omdoc.org)
     See the documentation and examples at http://omdoc.org

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
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  xmlns:func="http://exslt.org/functions" 
  extension-element-prefixes="func"
  exclude-result-prefixes="om omdoc m func"
  version="1.0">  

<!-- need this, since there would otherwise be no blanks before or after math -->
<xsl:template match="text()">
  <!-- this leads to memory exhaustion in saxon
       <xsl:variable name="rawtext" select="normalize-space(omdoc:safe-but-accurate(.))"/> -->

 <xsl:variable name="rawtext" select="normalize-space(omdoc:safe(.))"/>
  <xsl:if test="not(omdoc:starts-with-punct($rawtext))">
    <xsl:text> </xsl:text>
  </xsl:if>
  <xsl:value-of select="$rawtext"/>
  <xsl:text> </xsl:text>
</xsl:template>

<func:function name="omdoc:starts-with-punct">
  <xsl:param name="str"/>
  <xsl:choose>
    <xsl:when test="starts-with($str,',')"><func:result select="true()"/></xsl:when>
    <xsl:when test="starts-with($str,'.')"><func:result select="true()"/></xsl:when>
    <xsl:when test="starts-with($str,';')"><func:result select="true()"/></xsl:when>
    <xsl:when test="starts-with($str,':')"><func:result select="true()"/></xsl:when>
    <xsl:when test="starts-with($str,'!')"><func:result select="true()"/></xsl:when>
    <xsl:when test="starts-with($str,'?')"><func:result select="true()"/></xsl:when>
    <xsl:when test="starts-with($str,',')"><func:result select="true()"/></xsl:when>
    <xsl:otherwise><func:result select="false()"/></xsl:otherwise>
  </xsl:choose>
</func:function>

<xsl:template match="omdoc:CMP">
  <xsl:param name="prefix"/>
  <xsl:if test="omdoc:valid-language()">
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </xsl:if>
</xsl:template>

<xsl:template match="omdoc:FMP">
  <xsl:param name="prefix"/>
  <xsl:value-of select="concat(omdoc:localize('FMP'),': ')"/>
  <xsl:choose>
    <xsl:when test="omdoc:assumption or omdoc:conclusion">
      <xsl:call-template name="print-sequent">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="*">
      <xsl:apply-templates>
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="warning">
        <xsl:with-param name="string" select="'empty FMP!'"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- we do not want to see the formal parts, if there are CMPs around -->
<xsl:template match="omdoc:FMP[preceding-sibling::omdoc:CMP]"/>

<!-- if there is a representation in some legacy format, 
     the best is just to print it verbatim -->
<xsl:template match="omdoc:legacy">
  <xsl:param name="prefix"/>
  <xsl:text> \verb#</xsl:text><xsl:apply-templates mode="verbatimcopy"/><xsl:text>#</xsl:text>
</xsl:template>
<!-- except of course if it is TeX/LaTeX itself -->
<xsl:template match="omdoc:legacy[@format='TeX' or 
                                  @format='LaTeX' or 
                                  @format='latex' or 
                                  @format='tex']">
  <xsl:param name="prefix"/>
  <xsl:value-of select="."/>
</xsl:template>

<!-- All of these templates overdefine the ones in omdoc2share -->
<xsl:template match="om:OMOBJ[not(@xref)]|m:math">
  <xsl:param name="prefix"/>
  <xsl:param name="id"/>
  <xsl:choose>
    <xsl:when test="$id!=''">
      <xsl:call-template name="with-crossref">
        <xsl:with-param name="content">
          <xsl:text>$</xsl:text><xsl:apply-templates/><xsl:text>$ </xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text> $</xsl:text><xsl:apply-templates/><xsl:text>$</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="om:OMSTR[not(@xref)]|m:mtext">
  <xsl:text>{\tt{</xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
</xsl:template>

<xsl:template name="print-sequent">
  <xsl:param name="prefix"/>
  <xsl:for-each select="omdoc:assumption">
    <xsl:apply-templates  select="*[local-name()!='CMP']">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
  </xsl:for-each>
  <xsl:text> ${\vdash}$ </xsl:text>
  <xsl:for-each select="omdoc:conclusion">
    <xsl:apply-templates select="*[local-name()!='CMP']">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
