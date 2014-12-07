<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc 
     (Open Mathematical Documents) Module DOC. 
     $Id: html.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/html.xsl $
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
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="dc omdoc"
  version="1.0">  

<xsl:template name="with-document">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <html>
    <head>
      <link rel="stylesheet" type="text/css" href="omdoc-default.css"/>
      <xsl:if test="$css!=''"><link rel="stylesheet" type="text/css" href="{$css}"/></xsl:if>
      <title>
        <xsl:if test="/omdoc:omdoc/omdoc:metadata/dc:title">
          <xsl:apply-templates select="/omdoc:omdoc/omdoc:metadata/dc:title">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </xsl:if>
      </title>
    </head>
    <body><xsl:copy-of select="$content"/></body>
  </html>
</xsl:template>

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
 <xsl:choose>
  <xsl:when test="$uri!='' and ($crossref-symbol='yes' or $crossref-symbol='all')">
    <a href="{$uri}">
      <xsl:if test="$id!=''">
        <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
      </xsl:if>
      <xsl:copy-of select="$print-form"/>
    </a>
  </xsl:when>
  <xsl:otherwise>
    <span xmlns="http://www.w3.org/1999/xhtml">
      <xsl:if test="$id!=''">
        <xsl:attribute name="id"><xsl:value-of select="$id"/></xsl:attribute>
      </xsl:if>
      <xsl:copy-of select="$print-form"/>
    </span>
  </xsl:otherwise>
 </xsl:choose>
</xsl:template>

<xsl:template name="do-print-variable">
  <xsl:param name="prefix"/>
  <a id="{concat($prefix,'MCR',generate-id())}"><xsl:value-of select="@name"/></a>
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
  <xsl:if test="not($prec&gt;$precedence)"><xsl:value-of select="$open"/></xsl:if>
  <xsl:copy-of select="$content"/>
  <xsl:if test="not($prec&gt;$precedence)"><xsl:value-of select="$close"/></xsl:if>
</xsl:template>

<!-- This template composes the treatment for an argument of a function. -->
<xsl:template name="do-arg">
  <xsl:param name="content"/>
  <xsl:copy-of select="$content"/>
</xsl:template>

<!-- Argument groups don't need a special markup in HTML -->
<xsl:template name="make-group">
  <xsl:param name="content"/>
  <xsl:param name="parent-element"/>
  <xsl:copy-of select="$content"/>
</xsl:template>
  
<xsl:template name="print-separator">
 <xsl:param name="print-form"/>
 <xsl:param name="uri"/>
 <!-- we do not know how to crossreference, so we do'nt -->
 <xsl:value-of select="$print-form"/>
</xsl:template>

</xsl:stylesheet>



