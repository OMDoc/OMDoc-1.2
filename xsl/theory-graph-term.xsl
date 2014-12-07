<?xml version="1.0" encoding="utf-8"?>
<!-- An XSL style sheet for creating human-oriented output from 
     OMDoc (Open Mathematical Documents). It forms the basis for 
     the style sheets transforming OMDoc into html, mathml, TeX, 
     and Mathematica notebooks.
     $Id: theory-graph-term.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/theory-graph-term.xsl $
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
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:func="http://exslt.org/functions" 
  xmlns:set="http://exslt.org/strings" 
  xmlns:exsl="http://exslt.org/common" 
  extension-element-prefixes="func exsl"
  exclude-result-prefixes="omdoc set om func exsl"
  version="1.0">

  <xsl:import href="util/uri.xsl"/>
<xsl:strip-space elements="*"/>

 <xsl:output method="text"/> 
 <!-- <xsl:output method="xml" indent="yes"/>-->

<!-- we first collect all of the document (including the sub-documents
     reference in the 'ref' nodes) into a variable. -->
<xsl:variable name="theories">
  <xsl:apply-templates select="/" mode="theories"/>
</xsl:variable>

<xsl:template match="omdoc:*" mode="theories"><xsl:apply-templates mode="theories"/></xsl:template>

<xsl:template match="omdoc:imports" mode="theories">
  <xsl:copy><xsl:copy-of select="@*"/></xsl:copy>
</xsl:template>

<xsl:template match="omdoc:ref[@type='include']" mode="theories">
  <xsl:variable name="uri" select="@xref"/>
  <xsl:apply-templates select="omdoc:get-uriref($uri)" mode="theories"/>
</xsl:template>

<xsl:template match="omdoc:metadata|omdoc:omtext" mode="theories"/>

<!-- for theory elements, only copy the imports stuff (for the moment) -->
<xsl:template match="omdoc:theory" mode="theories">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:copy-of select="omdoc:imports"/>
  </xsl:copy>
</xsl:template>

<xsl:template match="/">
  <xsl:variable name="referenced" select="exsl:node-set($theories)/omdoc:theory/omdoc:imports/@from"/>
  <xsl:variable name="roots" select="exsl:node-set($theories)/omdoc:theory[not (@xml:id = $referenced)]"/>
  <xsl:variable name="result" select="omdoc:graph($roots,nothing,nothing)"/>
  <xsl:apply-templates select="exsl:node-set($result)/*"/>
  <!-- <xsl:copy-of select="exsl:node-set($result)/*"/> -->
</xsl:template>

<!-- this function computes a forest of terms corresponding to a theory graph -->
<func:function name="omdoc:graph">
  <xsl:param name="obs"/>
  <xsl:param name="terms"/>
  <xsl:param name="ids"/>
  <xsl:choose>
    <xsl:when test="$obs">
      <xsl:variable name="obj" select="$obs[1]"/>
      <xsl:variable name="id" select="$obj/@xml:id"/>
      <xsl:variable name="head-term">
        <xsl:choose>
          <!-- if one of the nodes in one of the terms corresponds to this obj -->
          <xsl:when test="$id = $terms//node/@name"><ref name="{$id}"/></xsl:when>
          <xsl:when test="$obj/omdoc:imports">
            <!-- we recursively compute set $thterms of terms for the imported theories, 
                 they will become the children of the current node -->
            <xsl:variable name="froms" select="$obj/omdoc:imports/@from"/>
            <xsl:variable name="ths" select="exsl:node-set($theories)/omdoc:theory[@xml:id = $froms]"/>
            <!-- we compute the term for the first theory -->
            <xsl:variable name="thterm1" select="exsl:node-set(omdoc:graph($ths[1],$terms,$id))/*/*"/>
            <!-- this term must be taken into account for the computation of the rest -->
            <xsl:variable name="done" select="$thterm1|$terms"/>
            <xsl:variable name="thsrest" select="$ths[position() &gt; 1]"/>
            <xsl:variable name="thtermsrest" select="exsl:node-set(omdoc:graph($thsrest,$done,$id))/*/*"/>
            <node type="theory" name="{$id}">
              <xsl:for-each select="$thterm1|$thtermsrest">
                <edge type="edge" name="{$id} -&gt; {@name}">
                  <xsl:copy-of select="."/>
                </edge>
              </xsl:for-each>
            </node>
          </xsl:when>
          <xsl:otherwise><node type="theory" name="{$id}"/></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <xsl:variable name="done" select="exsl:node-set($head-term)|$terms"/>
      <xsl:variable name="rest-terms" select="exsl:node-set(omdoc:graph($obs[position() &gt; 1],$done,nothing))/*/*"/>
      <func:result>
        <nodes><xsl:copy-of select="exsl:node-set($head-term)|$rest-terms"/></nodes>
      </func:result>
    </xsl:when>
    <xsl:otherwise><func:result select="nothing"/></xsl:otherwise>
  </xsl:choose>
</func:function>

<xsl:template match="nodes">
  <xsl:text>&#xA;[&#xA;</xsl:text>
  <xsl:for-each select="node">
    <xsl:apply-templates select=".">
      <xsl:with-param name="indent" select="'  '"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()"><xsl:text>,&#xA;</xsl:text></xsl:if>
  </xsl:for-each>
  <xsl:text>&#xA;]&#xA;</xsl:text>
</xsl:template>

<xsl:template match="node">
  <xsl:param name="indent"/>
  <xsl:text>l("</xsl:text>
  <xsl:value-of select="@name"/>
  <xsl:text>",n("</xsl:text>
  <xsl:value-of select="@type"/>
  <xsl:text>",&#xA;</xsl:text>
  <xsl:value-of select="$indent"/>
  <xsl:text>[a("OBJECT","</xsl:text>
  <xsl:value-of select="@name"/>
  <xsl:text>")</xsl:text>
  <xsl:for-each select="attribute">
    <xsl:value-of select="$indent"/>
    <xsl:text>,&#xA;</xsl:text>
    <xsl:apply-templates select=".">
      <xsl:with-param name="indent" select="concat('   ',$indent)"/>
    </xsl:apply-templates>
  </xsl:for-each>
  <xsl:text>],&#xA;</xsl:text>
  <xsl:value-of select="$indent"/>
  <xsl:text>[</xsl:text>
  <xsl:for-each select="edge">
    <xsl:apply-templates select=".">
      <xsl:with-param name="indent" select="concat('   ',$indent)"/>
    </xsl:apply-templates>
    <xsl:if test="position()!=last()">
      <xsl:text>,&#xA;</xsl:text>
      <xsl:value-of select="$indent"/>
    </xsl:if>
  </xsl:for-each>
  <xsl:text>&#xA;</xsl:text>
  <xsl:value-of select="$indent"/>
  <xsl:text>]))</xsl:text>
</xsl:template>

<xsl:template match="edge">
  <xsl:param name="indent"/>
  <xsl:text>l("</xsl:text>
  <xsl:value-of select="@name"/>
  <xsl:text>",e("</xsl:text>
  <xsl:value-of select="@type"/>
  <xsl:text>",&#xA;</xsl:text>
  <xsl:value-of select="$indent"/>
  <!--   <xsl:text>[a("OBJECT","</xsl:text><xsl:value-of select="@name"/><xsl:text>")</xsl:text> -->
  <xsl:text>[</xsl:text>
  <xsl:for-each select="attribute">
    <xsl:value-of select="$indent"/>
    <xsl:text>,&#xA;</xsl:text>
    <xsl:apply-templates select=".">
      <xsl:with-param name="indent" select="concat('   ',$indent)"/>
    </xsl:apply-templates>
  </xsl:for-each>
  <xsl:text>],&#xA;</xsl:text>
  <xsl:value-of select="$indent"/>
  <xsl:apply-templates select="node|ref">
    <xsl:with-param name="indent" select="concat('  ',$indent)"/>
  </xsl:apply-templates>
  <xsl:text>&#xA;</xsl:text>
  <xsl:value-of select="$indent"/>
  <xsl:text>))</xsl:text>
</xsl:template>

<xsl:template match="ref">
  <xsl:param name="indent"/>
  <xsl:text>r("</xsl:text>
  <xsl:value-of select="@name"/>
  <xsl:text>")</xsl:text>
</xsl:template>

</xsl:stylesheet>
