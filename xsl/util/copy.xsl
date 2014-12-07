<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: copy.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/copy.xsl $
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
  extension-element-prefixes="func"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
 version="1.0">  

<!-- this two templates provide verbatim copying with our without escaping, 
     even in html and text output modes -->
<xsl:template match="text()" mode="verbatimcopy">
 <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="*" mode="verbatimcopy">
 <xsl:param name="indent" select="''"/>
 <xsl:text>&#xA;</xsl:text><xsl:value-of select="$indent"/>
 <xsl:text disable-output-escaping="yes">&lt;</xsl:text>
 <xsl:value-of select="local-name()"/>
 <xsl:text> </xsl:text>
 <xsl:for-each select="@*">
  <xsl:value-of select="name()"/>
  <xsl:text>="</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>
  <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
 </xsl:for-each>
 <xsl:text disable-output-escaping="yes">&gt;</xsl:text>
 <xsl:apply-templates select="*|text()" mode="verbatimcopy">
  <xsl:with-param name="indent" select="concat($indent,' ')"/>
 </xsl:apply-templates>
 <xsl:value-of select="$indent"/>
 <xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
 <xsl:value-of select="local-name()"/>
 <xsl:text disable-output-escaping="yes">&gt;&#xA;</xsl:text>
</xsl:template>


<xsl:template match="text()" mode="verbatimcopy-escaped">
 <xsl:value-of select="."/>
</xsl:template>

<xsl:template match="omdoc:data" mode="verbatimcopy-escaped"><xsl:apply-templates/></xsl:template>

<xsl:template match="*" mode="verbatimcopy-escaped">
 <xsl:param name="indent" select="''"/>
 <xsl:text>&#xA;</xsl:text><xsl:value-of select="$indent"/>
 <xsl:text disable-output-escaping="no">&lt;</xsl:text>
 <xsl:value-of select="local-name()"/>
 <xsl:text> </xsl:text>
 <xsl:for-each select="@*">
  <xsl:value-of select="name()"/>
  <xsl:text>="</xsl:text><xsl:value-of select="."/><xsl:text>"</xsl:text>
  <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
 </xsl:for-each>
 <xsl:text disable-output-escaping="no">&gt;</xsl:text>
 <xsl:apply-templates select="*|text()" mode="verbatimcopy-escaped">
  <xsl:with-param name="indent" select="concat($indent,' ')"/>
  <xsl:with-param name="escaping" select="no"/>
 </xsl:apply-templates>
 <xsl:value-of select="$indent"/>
 <xsl:text disable-output-escaping="no">&lt;/</xsl:text>
 <xsl:value-of select="local-name()"/>
 <xsl:text disable-output-escaping="no">&gt;&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>



