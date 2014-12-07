<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: quiz.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/quiz.xsl $
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

<xsl:template match="omdoc:exercise">
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="'exercise'"/>
    <xsl:with-param name="title-extra">
      <xsl:call-template name="titlebox-for">
        <xsl:with-param name="type" select="'exercise'"/>
        <xsl:with-param name="forid" select="@for"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:apply-templates select="omdoc:CMP|omdoc:hint|omdoc:solution"/>
      <xsl:if test="omdoc:mc">
        <xsl:call-template name="with-mcgroup">
          <xsl:with-param name="content"><xsl:apply-templates select="omdoc:mc"/></xsl:with-param>
        </xsl:call-template>
      </xsl:if>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:hint|omdoc:solution">
  <xsl:call-template name="with-omdocenv">
    <xsl:with-param name="class" select="local-name()"/>
    <xsl:with-param name="title-extra">
      <xsl:call-template name="titlebox-for">
        <xsl:with-param name="type" select="local-name()"/>
        <xsl:with-param name="forid" select="@for"/>
      </xsl:call-template>
    </xsl:with-param>
    <xsl:with-param name="content">
      <xsl:apply-templates select="*[local-name()!='symbol' and local-name()!='FMP']"/>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:choice|omdoc:answer"><xsl:apply-templates/></xsl:template>

</xsl:stylesheet>


