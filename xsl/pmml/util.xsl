<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: util.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/pmml/util.xsl $
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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:exsl="http://exslt.org/common" 
  xmlns:xlink="http://www.w3.org/1999/xlink"
  exclude-result-prefixes="exsl xlink"
  version="1.0">  

<!-- This template will print a symbol based on the specification given by
     the parameters 'print-form', 'cd', 'name', and 'crossref-symbol'.
     It facilitates printing symbols with crossreferences to their definitions.
     If 'crossref-symbol' has the value 't', then it will look up the URL of the 
     presentation of the defining OMDoc (as specified by the catalogue mechanism 
     for the theory 'cd'), and print the value of 'print-form' with a hyperlink 
     (if the format permits) to the determined URL. -->
<xsl:template name="print-symbol">
  <xsl:param name="prefix"/>
  <xsl:param name="id"/>
  <xsl:param name="print-form"/>
  <xsl:param name="crossref-symbol" select="'yes'"/>
  <xsl:param name="uri"/>
  <xsl:param name="mo" select="'yes'"/>
  <xsl:choose>
    <xsl:when test="$mo='yes'">
      <mo xmlns="http://www.w3.org/1998/Math/MathML">
        <xsl:if test="$uri!='' and ($crossref-symbol='yes' or $crossref-symbol='all')">
          <xsl:attribute name="xlink:href"><xsl:value-of select="$uri"/></xsl:attribute>
          <xsl:attribute name="xlink:type"><xsl:text>simple</xsl:text></xsl:attribute>
        </xsl:if>
        <xsl:if test="$id!=''">
          <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
        </xsl:if>
        <xsl:copy-of select="$print-form"/>
      </mo>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="$print-form"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="print-separator">
  <xsl:param name="print-form"/>
  <xsl:param name="crossref-symbol"/>
  <xsl:param name="uri"/>
  <xsl:if test="$print-form!=''">
    <mo xmlns="http://www.w3.org/1998/Math/MathML" separator="true">
      <xsl:if test="$uri!='' and ($crossref-symbol='separator' or $crossref-symbol='all')">
        <xsl:attribute name="xlink:href"><xsl:value-of select="$uri"/></xsl:attribute>
      </xsl:if>
      <xsl:copy-of select="$print-form"/>
    </mo>
  </xsl:if>
</xsl:template>

<!-- these templates take care of format-specific argument grouping 
     and fencing operator according to the precdences:
     argument $open and $close are the actual fencing operators, 
              $prec is the computed precedence, 
              $precedence is the specified precedence -->
<xsl:template name="with-arg-group">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <xsl:param name="open"/>
  <xsl:param name="close"/>
  <xsl:param name="prec"/>
  <xsl:param name="precedence"/>
  <xsl:if test="$debug">
      <xsl:message>!!!!!!!!!!!!!!!!!!!! <xsl:copy-of select="$content"/> prec: <xsl:value-of select="$prec"/> precedence: <xsl:value-of select="$precedence"/></xsl:message>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="not($prec&gt;$precedence)">
      <mfenced xmlns="http://www.w3.org/1998/Math/MathML" id="{concat($prefix,generate-id())}" 
	       open="{$open}" close="{$close}" separators="">
	<xsl:copy-of select="$content"/>
      </mfenced>
    </xsl:when>
    <xsl:otherwise>
      <mrow xmlns="http://www.w3.org/1998/Math/MathML" id="{concat($prefix,generate-id())}">
	<xsl:copy-of select="$content"/>
      </mrow>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template name="make-group">
  <xsl:param name="content"/>
  <xsl:param name="parent-element" select="''"/>
  <!-- the arity of some PMML elements with a fixed number of children is hard-coded here. -->
  <xsl:variable name="arity">
    <xsl:choose>
      <xsl:when test="$parent-element = 'mfrac'"><xsl:value-of select="2"/></xsl:when>
      <xsl:when test="$parent-element = 'mover'"><xsl:value-of select="2"/></xsl:when>
      <xsl:when test="$parent-element = 'mroot'"><xsl:value-of select="2"/></xsl:when>
      <xsl:when test="$parent-element = 'msub'"><xsl:value-of select="2"/></xsl:when>
      <xsl:when test="$parent-element = 'msup'"><xsl:value-of select="2"/></xsl:when>
      <xsl:when test="$parent-element = 'msubsup'"><xsl:value-of select="3"/></xsl:when>
      <xsl:when test="$parent-element = 'munder'"><xsl:value-of select="2"/></xsl:when>
      <xsl:when test="$parent-element = 'munderover'"><xsl:value-of select="3"/></xsl:when>
      <xsl:otherwise>-1</xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <!-- This should not happen. It signals that some user-defined markup is buggy. -->
    <!-- FIXME !!! remove this check when no faulty makeup is left in the OMDoc example documents. -->
    <xsl:when test="$arity &gt;= 0 and count(exsl:node-set($content)/*) &gt; $arity">
      <xsl:message>WARNING: The element <xsl:value-of select="$parent-element"/> has surplus child nodes.</xsl:message>
      <xsl:for-each select="exsl:node-set($content)/*[position() &lt; $arity]">
	<xsl:copy-of select="."/>
      </xsl:for-each>
      <!-- let the last argument hold all surplus arguments. This might not be desired in all cases! -->
      <mrow xmlns="http://www.w3.org/1998/Math/MathML">
	<xsl:for-each select="exsl:node-set($content)/*[position() &gt;= $arity]">
	  <xsl:copy-of select="."/>
	</xsl:for-each>
      </mrow>
    </xsl:when>
    <xsl:when test="$arity &lt; 0 and count(exsl:node-set($content)/*) &gt; 1">
      <mrow xmlns="http://www.w3.org/1998/Math/MathML">
	<xsl:copy-of select="$content"/>
      </mrow>
    </xsl:when>
    <xsl:otherwise>
      <xsl:copy-of select="$content"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- This template composes the treatment for an argument of a function. -->
<xsl:template name="do-arg">
  <xsl:param name="content"/>
  <xsl:copy-of select="$content"/>
</xsl:template>

<xsl:template name="do-print-variable">
  <xsl:param name="prefix"/>
  <mi xmlns="http://www.w3.org/1998/Math/MathML" id="{concat('MCR',$prefix,generate-id())}">
    <xsl:value-of select="@name"/>
  </mi>
</xsl:template>

</xsl:stylesheet>



