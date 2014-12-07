<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: util.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/util.xsl $
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
  xmlns:str="http://exslt.org/strings"
  xmlns:func="http://exslt.org/functions" 
  xmlns:exsl="http://exslt.org/common"
  extension-element-prefixes="func exsl"
  exclude-result-prefixes="str func exsl"
  version="1.0">  

<xsl:import href="../exsl/str.replace.template.xsl"/>

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

<xsl:template name="with-par">
  <xsl:param name="id"/>
  <xsl:param name="content"/>
  <xsl:text>&#xA;&#xA;</xsl:text>
  <xsl:copy-of select="$content"/>
</xsl:template>

<xsl:template name="with-crossref">
  <xsl:param name="uri"/>
  <xsl:param name="content"/>
  <xsl:text>\href{</xsl:text>
  <xsl:value-of select='$uri'/>
  <xsl:text>}{</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>} </xsl:text>
</xsl:template>

<xsl:template name="print-symbol">
 <xsl:param name="print-form"/>
 <xsl:param name="crossref-symbol" select="'yes'"/>
 <xsl:param name="uri"/>
 <!-- we do not know how to crossreference, so we do'nt -->
 <xsl:copy-of select="$print-form"/>
 <xsl:text> </xsl:text>
</xsl:template>

<xsl:template name="do-print-variable">
  <xsl:text>{</xsl:text><xsl:value-of select="@name"/><xsl:text>}</xsl:text>
</xsl:template>

<xsl:template name="with-list">
  <xsl:param name="content"/>
  <xsl:text>&#xA;\begin{enumerate}&#xA;</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>&#xA;\end{enumerate}&#xA;</xsl:text>
</xsl:template>

<xsl:template name="with-unordered-list">
  <xsl:param name="content"/>
  <xsl:text>&#xA;\begin{itemize}&#xA;</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>&#xA;\end{itemize}&#xA;</xsl:text>
</xsl:template>

<xsl:template name="with-item">
  <xsl:param name="content"/>
  <xsl:text>&#xA;\item{}</xsl:text>
  <xsl:copy-of select="$content"/>
</xsl:template>

<xsl:template name="with-bold">
  <xsl:param name="content"/>
  <xsl:text>{\bf{</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>}}</xsl:text>
</xsl:template>

<xsl:template name="do-nl"><xsl:text>\par{}&#xA;</xsl:text></xsl:template>

<xsl:template name="with-style">
  <xsl:param name="class"/>
  <xsl:param name="style"/>
  <xsl:param name="display" select="'inline'"/>
  <xsl:param name="content"/>
  <xsl:text>\begin{style}{</xsl:text>
  <xsl:value-of select="$display"/>
  <xsl:text>}{</xsl:text>
  <xsl:value-of select="$class"/>
  <xsl:text>}{</xsl:text>
  <xsl:value-of select="$style"/>
  <xsl:text>}&#xA;</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>\end{style}&#xA;</xsl:text>
</xsl:template>

<xsl:template name="with-omdocenv"> 
  <xsl:param name="class" select="'Unknown'"/>
  <xsl:param name="id"/>
  <xsl:param name="title"/>
  <xsl:param name="title-extra"/>
  <xsl:param name="content"/>
  <xsl:text>&#xA;\begin{omdocenv}{</xsl:text>
  <xsl:value-of select="$class"/>
  <xsl:text>}{</xsl:text>
  <xsl:value-of disable-output-escaping="yes" select="omdoc:safe-but-accurate($title-extra)"/>
  <xsl:text>}{</xsl:text>
  <xsl:value-of disable-output-escaping="yes" select="omdoc:safe($id)"/>
  <xsl:text>}{</xsl:text>
  <xsl:copy-of select="$title"/>
  <xsl:text>}&#xA;</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>&#xA;\end{omdocenv}&#xA;</xsl:text>
</xsl:template>

<func:function name="omdoc:safe">
  <xsl:param name="string"/>
  <func:result select="normalize-space(translate($string,'^_#','--'))"/>
</func:function>

<func:function name="omdoc:safe-but-accurate">
  <xsl:param name="string"/>
  <xsl:variable name="search">
    <str>^</str><str>_</str><str>#</str><str>$</str>
  </xsl:variable>
  <xsl:variable name="replace">
    <str>\^</str><str>\_</str><str>\#</str><str>\$</str>
  </xsl:variable>
  <xsl:variable name="presult">
    <xsl:call-template name="str:replace">
      <xsl:with-param name="string" select="$string"/>
      <xsl:with-param name="search" select="exsl:node-set($search)/str"/>
      <xsl:with-param name="replace" select="exsl:node-set($replace)/str"/>
    </xsl:call-template>
  </xsl:variable>
  <func:result select="normalize-space($presult)"/>
</func:function>

<!-- This template composes the treatment for an argument of a function. -->
<xsl:template name="do-arg">
  <xsl:param name="content"/>
  <xsl:text>{</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>}</xsl:text>
</xsl:template>

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


<!-- this function computes the next level of headings down -->
<func:function name="omdoc:compute-section">
 <xsl:param name="level"/>
 <!-- first we normalize the level command to 'book', which has max sectioning commands -->
 <xsl:variable name="nlevel">
   <xsl:choose>
     <xsl:when test="$sectioning-model='book'"><xsl:value-of select="$level"/></xsl:when>
     <xsl:when test="$sectioning-model='article'"><xsl:value-of select="$level + 1"/></xsl:when>
     <xsl:otherwise>
       <xsl:call-template name="error">
         <xsl:with-param name="string">
           <xsl:value-of select="$sectioning-model"/>
           <xsl:text> is not a known sectioning model!</xsl:text>
         </xsl:with-param>
       </xsl:call-template>
     </xsl:otherwise>
   </xsl:choose>
 </xsl:variable>
 <xsl:choose>
  <xsl:when test="$nlevel='0'"><func:result select="'chapter'"/></xsl:when>
  <xsl:when test="$nlevel='1'"><func:result select="'section'"/></xsl:when>
  <xsl:when test="$nlevel='2'"><func:result select="'subsection'"/></xsl:when>
  <xsl:when test="$nlevel='3'"><func:result select="'subsubsection'"/></xsl:when>
  <xsl:when test="$nlevel='4'"><func:result select="'paragraph'"/></xsl:when>
  <xsl:when test="$nlevel='5'"><func:result select="'subparragraph'"/></xsl:when>
 </xsl:choose>
</func:function>

</xsl:stylesheet>
