<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: doc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/doc.xsl $
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
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  version="1.0">  

<xsl:template name="with-document">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <xsl:text>\documentclass{</xsl:text><xsl:value-of select="$docclass"/><xsl:text>}&#xA;</xsl:text>
  <xsl:text>\usepackage{</xsl:text><xsl:value-of select="$usepackage"/><xsl:text>}&#xA;</xsl:text>
  <xsl:text>\begin{document}&#xA;</xsl:text>
  <xsl:copy-of select="$content"/>
 <xsl:text>\end{document}&#xA;&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:omtext">
  <xsl:param name="prefix"/>
  <xsl:text>&#xA;&#xA;</xsl:text>
  <xsl:apply-templates select="omdoc:CMP">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:ref[@type='cite']">
 <xsl:text>(\ref{</xsl:text><xsl:value-of select="@xref"/><xsl:text>})</xsl:text>
</xsl:template>

<!-- we will take care of 'ednote' comments. -->
<xsl:template match="ignore[@type='ednote']">
 <xsl:text>\footnote{{\sc </xsl:text><xsl:apply-templates/><xsl:text>}}</xsl:text>
</xsl:template>

<!-- the omgroups only recurse, the templates for metadata do 
     the work of computing the sections -->
<xsl:template match="omdoc:omgroup|omdoc:tgroup">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:variable name="number" select="omdoc:new-number($level,$numprefix)"/>
  <xsl:variable name="type" select="@type"/>
  <xsl:apply-templates select="omdoc:metadata">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="level" select="$level"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
  <xsl:if test="$type">
    <xsl:text>\begin{omgroup-</xsl:text><xsl:value-of select="$type"/><xsl:text>}&#xA;</xsl:text>
  </xsl:if>
  <xsl:for-each select="*[not(self::omdoc:metadata)]">
    <xsl:if test="$type">
      <xsl:text>\item</xsl:text><xsl:value-of select="$type"/><xsl:text> </xsl:text>
    </xsl:if>
    <xsl:apply-templates select=".">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="level" select="$level + 1"/>
      <xsl:with-param name="numprefix" select="$number"/>
    </xsl:apply-templates>
    <xsl:text>&#xA;</xsl:text>
  </xsl:for-each>
  <xsl:if test="$type">
    <xsl:text>\end{omgroup-</xsl:text><xsl:value-of select="$type"/><xsl:text>}&#xA;</xsl:text>
  </xsl:if>
</xsl:template>

<!-- ******** kind of a hack, but works **** -->
<xsl:template match="omdoc:phrase[@class='codeline']">
  <xsl:param name="prefix"/>
  <xsl:variable name="content">
    <xsl:apply-templates>
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </xsl:variable>
  <xsl:variable name="delim">
    <xsl:choose>
      <xsl:when test="not(contains($content,'!'))"><xsl:text>!</xsl:text></xsl:when>
      <xsl:when test="not(contains($content,'+'))"><xsl:text>+</xsl:text></xsl:when>
      <xsl:when test="not(contains($content,'@'))"><xsl:text>@</xsl:text></xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="warning">
          <xsl:with-param name="string">
            <xsl:text>codeline contains !,+,@, giving up on \verb</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:text>\verb</xsl:text>
  <xsl:value-of select="$delim"/>
  <xsl:value-of select="normalize-space($content)"/>
  <xsl:value-of select="$delim"/>
</xsl:template>

</xsl:stylesheet>
