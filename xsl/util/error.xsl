<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: error.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/error.xsl $
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
  xmlns:saxon="http://icl.com/saxon" 
  extension-element-prefixes="saxon"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  version="1.0">  

<xsl:param name="report-errors" select="'no'"/> 

<xsl:template name="error">
  <xsl:param name="string"/>
  <xsl:if test="$report-errors!='no'">
    <xsl:message terminate="yes">Error: <xsl:value-of select="$string"/></xsl:message>
  </xsl:if>
</xsl:template>

<xsl:template name="warning">
  <xsl:param name="string"/>
  <xsl:if test="$report-errors!='no'">
    <xsl:message>Warning: <xsl:value-of select="$string"/></xsl:message>
  </xsl:if>
</xsl:template>

<xsl:template match="*">
  <xsl:call-template name="error">
    <xsl:with-param name="string">
      <xsl:if test="function-available('saxon:line-number9')">
        <xsl:text>line </xsl:text>
        <xsl:value-of select="saxon:line-number()"/>
        <xsl:text>: </xsl:text>
      </xsl:if>
      <xsl:text>Cannot deal with element </xsl:text>
      <xsl:value-of select="local-name()"/>
      <xsl:text> yet!</xsl:text>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>


</xsl:stylesheet>



