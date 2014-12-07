<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: values.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/values.xsl $
     send bug-reports, patches, suggestions to developers@omdoc.org

     Copyright (c) 2000 - 2006 Michael Kohlhase, 2006 Christoph Lange

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
  extension-element-prefixes="func"
 version="1.0">  

<!-- This function takes a sequence (usually an attribute value) and
     interprets it as an operator precedence value. If the sequence is
     empty (because the attribute was missing, for example), the
     default value 1000 is returned. -->
<func:function name="omdoc:precedence-value">
  <xsl:variable name="presprec" select="../@precedence"/>
  <xsl:variable name="prec" select="@precedence"/>
  <xsl:choose>
    <xsl:when test="$prec"><func:result select="$prec"/></xsl:when>
    <xsl:when test="$presprec"><func:result select="$presprec"/></xsl:when>
    <xsl:otherwise><func:result select="1000"/></xsl:otherwise>
  </xsl:choose>
</func:function>

</xsl:stylesheet>
