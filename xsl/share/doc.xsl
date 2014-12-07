<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: doc.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/share/doc.xsl $
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
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  extension-element-prefixes="func"
  exclude-result-prefixes="omdoc"
  version="1.0">  

<!-- The root: Get the title and apply the omdoc-template 
     we do the title work here, since otherwise the \begin/end{document}
     show up when working on ref[@type='include'] nodes.-->
<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="omdoc:omdoc">
  <xsl:param name="prefix"/>
  <xsl:param name="level" select="0"/>
  <xsl:param name="numprefix"/>
  <xsl:if test="@version!='1.2'">
    <xsl:call-template name="warning">
      <xsl:with-param name="string">
        <xsl:text>applying an OMDoc 1.2 style sheet to an OMDoc </xsl:text>
        <xsl:value-of select="omdoc:omdoc/@version"/>
        <xsl:text> document!&#xA;This need not be a problem, but can lead to unintened results.</xsl:text>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:if>
  <xsl:choose>
    <xsl:when test="$level=0">
      <xsl:call-template name="with-document">
	<xsl:with-param name="id" select="@xml:id"/>
        <xsl:with-param name="content">
          <xsl:apply-templates select="omdoc:metadata" mode="top">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
          <xsl:text>&#xA;&#xA;</xsl:text>
          <!-- we recurse skipping the level of omdoc, so we do not get the metadata
               information from this. -->
          <xsl:apply-templates select="*[local-name()!='metadata']">
            <xsl:with-param name="level" select="0"/>
            <xsl:with-param name="numprefix" select="''"/>
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
          <xsl:text>&#xA;&#xA;</xsl:text>
          <!-- if there are any end notes, then we do them here -->
          <xsl:call-template name="do-notes">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:call-template>
          <xsl:text>&#xA;</xsl:text>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates>
        <xsl:with-param name="level" select="$level"/>
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="numprefix" select="$numprefix"/>
      </xsl:apply-templates>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- the omgroups only recurse, the templates for metadata do 
     the work of computing the sections -->
<xsl:template match="omdoc:omgroup|omdoc:tgroup">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:variable name="number" select="omdoc:new-number($level,$numprefix)"/>
  <xsl:apply-templates select="omdoc:metadata">
    <xsl:with-param name="level" select="$level"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
  <xsl:apply-templates select="*[not(self::omdoc:metadata)]">
    <xsl:with-param name="level" select="$level + 1"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="numprefix" select="$number"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:ref[@type='include']">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:variable name="id">
    <xsl:choose>
      <xsl:when test="@xml:id"><xsl:value-of select="@xml:id"/></xsl:when>
      <xsl:otherwise><xsl:value-of select="generate-id()"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:message>Processing included Document <xsl:value-of select="$id"/> ...</xsl:message>
  <xsl:apply-templates select="omdoc:get-uriref(@xref)">
    <xsl:with-param name="level" select="$level + 1"/>
    <xsl:with-param name="prefix" select="concat($prefix,$id)"/>
    <xsl:with-param name="numprefix" select="omdoc:new-number($level,$numprefix)"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:ref[@type='cite']">
  <xsl:param name="prefix"/>
  <xsl:variable name="xref" select="@xref"/>
  <xsl:call-template name="with-crossref">
    <xsl:with-param name="uri" select="$xref"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="content">
      <xsl:choose>
        <xsl:when test="omdoc:local-uri($xref)"><xsl:value-of select="$xref"/></xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="document(omdoc:effective-uri($xref,$prefix),.)/omdoc:omdoc/@xml:id"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:ref">
  <xsl:call-template name="warning">
    <xsl:with-param name="string" select="concat('type ',@type,' not supported on element ref!')"/>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:phrase" mode="fallback">
  <xsl:param name="prefix"/>
  <xsl:apply-templates>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="omdoc:phrase">
  <xsl:param name="prefix"/>
  <xsl:call-template name="with-style">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="class" select="@class"/>
    <xsl:with-param name="style" select="@style"/>
    <xsl:with-param name="content">
      <xsl:apply-templates select="." mode="fallback">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:omgroup[@type='sequence']|omdoc:tgroup[@type='sequence']">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:apply-templates select="omdoc:metadata">
    <xsl:with-param name="level" select="$level"/>
    <xsl:with-param name="numprefix" select="omdoc:new-number($level,$numprefix)"/>
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:call-template name="with-list">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="content">
      <xsl:for-each select="child::node()[not(self::omdoc:metadata)]">
        <xsl:call-template name="with-list">
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="content">
            <xsl:apply-templates select=".">
              <xsl:with-param name="level" select="$level + 1"/>
              <xsl:with-param name="prefix" select="$prefix"/>
              <xsl:with-param name="numprefix" select="omdoc:new-number($level,$numprefix)"/>
            </xsl:apply-templates>
            <!--    <xsl:value-of select="."/> -->
          </xsl:with-param>
        </xsl:call-template>
      </xsl:for-each>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:omgroup[@type='itemize']|omdoc:tgroup[@type='itemize']">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:call-template name="with-unordered-list">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="content">
      <xsl:for-each select="child::node()[not(self::omdoc:metadata)]">
        <xsl:variable name="content">
          <xsl:apply-templates select=".">
            <xsl:with-param name="level" select="$level + 1"/>
            <xsl:with-param name="prefix" select="$prefix"/>
            <xsl:with-param name="numprefix" select="omdoc:new-number($level,$numprefix)"/>
          </xsl:apply-templates>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="not(self::omdoc:omgroup|self::omdoc:tgroup)">
            <xsl:call-template name="with-item">
              <xsl:with-param name="prefix" select="$prefix"/>
              <xsl:with-param name="content" select="$content"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <!-- If an omgroup is contained in an itemized group, 
                 then the heuristic approach is that the group is a
                 subgroup of the preceding item and has to be indented --> 
            <xsl:call-template name="with-unordered-list">      
              <xsl:with-param name="content" select="$content"/>
              <xsl:with-param name="prefix" select="$prefix"/>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:for-each>
    </xsl:with-param>
  </xsl:call-template>
</xsl:template>

<xsl:template match="omdoc:omgroup[@type='enumeration']|omdoc:tgroup[@type='enumeration']">
  <xsl:param name="prefix"/>
  <xsl:param name="level"/>
  <xsl:param name="numprefix"/>
  <xsl:apply-templates select="omdoc:metadata">
    <xsl:with-param name="level" select="$level + 1"/>
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="numprefix" select="omdoc:new-number($level,$numprefix)"/>
  </xsl:apply-templates>
  <xsl:call-template name="with-list">
    <xsl:with-param name="prefix" select="$prefix"/>
    <xsl:with-param name="content">
      <xsl:for-each select="child::node()[not(self::omdoc:metadata)]">
        <xsl:call-template name="with-item">
          <xsl:with-param name="prefix" select="$prefix"/>
          <xsl:with-param name="content">
            <xsl:apply-templates select=".">
              <xsl:with-param name="level" select="$level + 1"/>
              <xsl:with-param name="prefix" select="$prefix"/>
              <xsl:with-param name="numprefix" select="omdoc:new-number($level,$numprefix)"/>
            </xsl:apply-templates>
         </xsl:with-param>
       </xsl:call-template>
     </xsl:for-each>
   </xsl:with-param>
 </xsl:call-template>
</xsl:template>

<!-- we generally ingore 'ignore' and 'catalogue' elements -->
<xsl:template match="omdoc:ignore|omdoc:catalogue"/>

<!-- this function returns a string that is used as the last component of the 
     numbering scheme for OMDoc elements in documents. It can depend on the level -->
<func:function name="omdoc:local-number">
 <xsl:param name="level"/><!-- not used yet -->
 <func:result><xsl:number level="single" count="omdoc:omgroup|omdoc:tgroup|omdoc:ref|omdoc:theory"/></func:result>
</func:function>

<func:function name="omdoc:new-number">
 <xsl:param name="level"/>
 <xsl:param name="numprefix"/>
 <xsl:choose>
  <xsl:when test="$numprefix=''">
   <func:result select="omdoc:local-number()"/>
  </xsl:when>
  <xsl:otherwise>
   <func:result select="concat($numprefix,'.',omdoc:local-number())"/>
  </xsl:otherwise>
 </xsl:choose>
</func:function>

</xsl:stylesheet>


