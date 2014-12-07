<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: rt.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/rt.xsl $
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
  exclude-result-prefixes="omdoc"
  version="1.0">  

<xsl:template name="do-notes">
  <xsl:param name="prefix"/>
  <xsl:if test="//omdoc:note[@type!='line-end-comment']"><xsl:call-template name="do-notesep"/></xsl:if>
  <xsl:for-each select="//omdoc:note[@type!='line-end-comment']">
    <xsl:call-template name="print-note">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="num" select="count(preceding::omdoc:note)"/>
      <xsl:with-param name="id" select="concat($prefix,@xml:id)"/>
      <xsl:with-param name="content">
        <xsl:apply-templates><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>


