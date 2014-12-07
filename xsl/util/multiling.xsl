<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: multiling.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/multiling.xsl $
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

<!-- 'TargetLanguage': default is en for xml:lang-attribute in 
     omdoc-output. It consists of whitespace separated, ordered list 
     of languages (example-call: TargetLanguage="en de fr")
     It is also valid in the imported stylesheets! 
     -->
<xsl:param name="TargetLanguage" select="'en'"/>

<!-- this function computes the valid language from a set of given languages
     it is the first among those in $TargetLanguage that is also in 
     $given -->
<func:function name="omdoc:comp-valid-language">
  <xsl:param name="given"/>
  <xsl:param name="langs"/>
  <xsl:choose>
    <xsl:when test="$langs=''"><func:result select="''"/></xsl:when>
    <xsl:otherwise>
      <xsl:variable name="first">
        <xsl:choose>
          <xsl:when test="contains($langs,' ')">
            <xsl:value-of select="substring-before($langs,' ')"/>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="$langs"/></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="rest">
        <xsl:choose>
          <xsl:when test="contains($langs,' ')">
            <xsl:value-of select="substring-after($langs,' ')"/>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="contains($given,$first)"><func:result select="$first"/></xsl:when>
        <xsl:otherwise>
          <func:result select="omdoc:comp-valid-language($given,$rest)"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:otherwise>
  </xsl:choose>
</func:function>

<func:function name="omdoc:valid-language">
  <xsl:variable name="nodename"><xsl:value-of  select="local-name()"/></xsl:variable>
  <xsl:variable name="language"><xsl:value-of  select="@xml:lang"/></xsl:variable>
  <xsl:variable name="siblings-nodeset" 
    select="preceding-sibling::node()[local-name()=$nodename]
            |following-sibling::node()[local-name()=$nodename]"/>
  <!-- Test, whether this node is among the wanted ones (in terms of language). -->
  <xsl:choose>
    <xsl:when test="contains($TargetLanguage,$language)">
      <!-- Test, whether other nodes don't have higher priority language-values -->
      <xsl:choose>
        <xsl:when test="not($siblings-nodeset[contains(substring-before($TargetLanguage,$language),@xml:lang)])">
          <!-- Test, whether this node is the only valid one (in terms 
               of language). If not, it is nevertheless a valid one and will 
               be written to the result-tree-->
          <xsl:if test="$language=$siblings-nodeset/@xml:lang">
            <xsl:call-template name="localized-error">
              <xsl:with-param name="key" select="'two-cmp-error'"/>
              <xsl:with-param name="id" select="../@xml:id"/>
            </xsl:call-template>
          </xsl:if>
          <func:result select="true()"/>
        </xsl:when> 
        <xsl:otherwise><func:result select="false()"/></xsl:otherwise>
      </xsl:choose>
    </xsl:when>
    <xsl:otherwise><func:result select="false()"/></xsl:otherwise>
  </xsl:choose>
</func:function>

</xsl:stylesheet>



