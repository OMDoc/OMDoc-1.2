<!-- An XSL style sheet for creating xsl style sheets for presenting 
     OpenMath Symbols from OMDoc presentation elements.

      $Id: exincl.xsl 8010 2008-09-07 19:29:43Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/exincl.xsl $
     Initial version 20000824 by Michael Kohlhase, 
     send bug-reports, patches, suggestions to omdoc@omdoc.org

     Copyright (c) 2000-2002 Michael Kohlhase, 
     Adaptation to new theory referencing scheme by Christoph Lange 2006

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
  xmlns:set="http://exslt.org/sets" 
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  extension-element-prefixes="exsl set"
  exclude-result-prefixes="om omdoc exsl set xsl"
  version="1.0">

  <xsl:import href="util/uri.xsl"/>
  <!-- the filename of OMDoc document itself -->
  <xsl:param name="self"/> 
  <xsl:param name="debug" select="false()"/> 

<xsl:output method="xml" version="1.0" indent="yes" standalone="yes"/>
<xsl:strip-space elements="*"/>

<!-- we first collect all of the document (including the sub-documents
     referenced in the 'ref' nodes) into a variable. -->
<xsl:variable name="all">
 <xsl:apply-templates select="/" mode="all"/>
</xsl:variable>

<xsl:template match="*" mode="all">
  <xsl:copy><xsl:copy-of select="@*"/><xsl:apply-templates mode="all"/></xsl:copy>
</xsl:template>

<xsl:template match="omdoc:ref[@type='include']" mode="all">
 <xsl:variable name="uri" select="@xref"/>
 <xsl:apply-templates select="omdoc:get-uriref($uri)" mode="all"/>
</xsl:template>
<!-- do not look into OpenMath Error elements -->
<xsl:template match="om:OME" mode="all"/>

<xsl:variable name="tree">
  <xsl:for-each select="exsl:node-set($all)/descendant::omdoc:theory">
    <!-- We collect the set of distinct symbols in this theory, not regarding nested theories -->
    <xsl:variable name="cdus" select="set:distinct(descendant::om:OMS[ancestor::omdoc:theory[1]=current()]/@cd)"/>

    <xsl:if test="$debug">
      <xsl:message>uses symbols from CDs: <xsl:for-each select="exsl:node-set($cdus)"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    </xsl:if>

    <!-- we determine those symbols whose symbol definition is not in this document -->
    <xsl:variable name="todo" select="exsl:node-set($cdus)[not(.=exsl:node-set($all)/descendant::omdoc:theory/@xml:id)]"/>

    <!-- we search the import graph, starting with our theory. -->
    <catalogue for="{concat('#', @xml:id)}">
      <xsl:call-template name="make-catalogue">
	<xsl:with-param name="todo" select="$todo"/>
	<xsl:with-param name="theory" select="."/>
      </xsl:call-template>
    </catalogue>
  </xsl:for-each>
</xsl:variable>
<xsl:variable name="href-cat" select="exsl:node-set($tree)"/> 

<!-- the top-level template prints the header of the xsl style sheet. -->
<xsl:template match="/">
  <xsl:comment>
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=<xsl:value-of select="/omdoc:omdoc/@xml:id"/>.
  
    This xsl style file is automatically generated, do not edit!
  </xsl:comment>
  <xsl:element name="xsl:stylesheet">
    <xsl:attribute name="version"><xsl:text>1.0</xsl:text></xsl:attribute>
    <xsl:attribute name="exsl:dummy">
      <xsl:text>to get the namespace right</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="extension-element-prefixes">
      <xsl:text>exsl</xsl:text>
    </xsl:attribute>
    <xsl:element name="xsl:variable">
      <xsl:attribute name="name"><xsl:text>tree</xsl:text></xsl:attribute>
      <xsl:copy-of select="$href-cat"/>
    </xsl:element>
    <xsl:text>&#xA;&#xA;</xsl:text>
    <xsl:element name="xsl:variable">
      <xsl:attribute name="name"><xsl:text>href-cat</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>exsl:node-set($tree)</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:text>&#xA;&#xA;</xsl:text>
    <xsl:element name="xsl:include">
      <xsl:attribute name="href"><xsl:value-of select="$self"/></xsl:attribute>
    </xsl:element>
    <xsl:for-each select="set:distinct($href-cat/catalogue/loc/@omdoc[not(starts-with(.,'#'))])">
      <xsl:element name="xsl:include">
        <xsl:attribute name="href">
          <xsl:value-of select="substring-before(.,'.omdoc')"/>
          <xsl:text>-tmpl.xsl</xsl:text>
        </xsl:attribute>
      </xsl:element>
    </xsl:for-each>
  </xsl:element>
</xsl:template>

<xsl:template match="*"/>

<!-- this procedure recursively examines the locally importes theories
     and locates all theories that still need a catalogue entry
     Output: a set of loc elements
-->
<xsl:template name="make-catalogue">
  <xsl:param name="todo"/><!-- the theories that still need a catalogue entry-->
  <xsl:param name="theory"/><!-- the theory that is searched for them -->
  <xsl:param name="prefix-URI"/><!-- the URI prefix that needs to be considered -->
  <xsl:param name="top-level-call" select="true()"/><!-- whether all local imports should be included in the catalogue -->
  <xsl:param name="visited" select="/.."/><!-- initially the empty node set -->
  <xsl:param name="call-stack" select="/.."/><!-- initially the empty node set -->
  <xsl:param name="indent" select="''"/><!-- TODO remove after debugging -->

  <xsl:if test="$debug">
    <xsl:message><xsl:value-of select="$indent"/>make-catalogue(<xsl:value-of select="exsl:node-set($theory)/@xml:id"/>) call stack: <xsl:for-each select="exsl:node-set($call-stack)/stack"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>make-catalogue visited: <xsl:for-each select="$visited"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
  </xsl:if>

  <!-- We build the local catalogue and put it in  a variable -->
  <xsl:variable name="local-cat">
    <!-- search for imports in this theory and in its ancestor theories if it's nested -->
    <xsl:for-each select="$theory/ancestor-or-self::omdoc:theory/omdoc:imports">
      <xsl:element name="loc">
	<xsl:attribute name="theory"><xsl:value-of select="substring-after(@from,'#')"/></xsl:attribute>
	<xsl:choose>
	  <xsl:when test="not(substring-before(@from,'#')='')">
	    <xsl:attribute name="omdoc"><xsl:value-of select="omdoc:effective-uri(@from,$prefix-URI)"/></xsl:attribute>
	  </xsl:when>
	  <xsl:otherwise>
	    <xsl:attribute name="omdoc"><xsl:value-of select="@from"/></xsl:attribute>
	  </xsl:otherwise>
	</xsl:choose>
      </xsl:element>
    </xsl:for-each>
  </xsl:variable>

  <xsl:if test="$debug">
    <xsl:message><xsl:value-of select="$indent"/>make-catalogue local-cat: <xsl:for-each select="exsl:node-set($local-cat)/loc"><xsl:value-of select="@theory"/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>make-catalogue todo: <xsl:for-each select="$todo"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
  </xsl:if>

  <!-- those theories that are in the local catalogue of the theory specified by the parameter $theory -->
  <xsl:variable name="incat" select="$todo[.=exsl:node-set($local-cat)/loc/@theory]"/>
  <xsl:if test="$debug"> 
    <xsl:message><xsl:value-of select="$indent"/>make-catalogue incat: <xsl:for-each select="$incat"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
  </xsl:if>

  <!-- ... and those that aren't -->
  <xsl:variable name="rest" select="set:difference($todo,$incat)"/>    
  <xsl:if test="$debug">
    <xsl:message><xsl:value-of select="$indent"/>make-catalogue rest: <xsl:for-each select="$rest"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
  </xsl:if>

  <!-- output loc elements for those theories that are imported from other documents -->
  <xsl:copy-of select="exsl:node-set($local-cat)/loc[@omdoc and ($top-level-call or @theory=$incat)]"/>
  <!-- output all locally imported theories for a top-level call -->
  <!-- otherwise, output only those locally imported theories that were searched for -->

  <xsl:if test="$rest">
    <xsl:variable name="follow" select="exsl:node-set($local-cat)/loc[not(@omdoc=$visited)]/@omdoc"/>
    <!-- there is a catalogue of locally imported, still unvisited theories we can follow -->
    <xsl:if test="$follow">
      <xsl:if test="$debug">
	<xsl:message><xsl:value-of select="$indent"/>entering loop of <xsl:value-of select="count($follow)"/> recursive calls: <xsl:for-each select="$follow"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
      </xsl:if>

      <xsl:variable name="result">
	<xsl:call-template name="make-catalogue-iteration">
	  <xsl:with-param name="todo" select="$rest"/>
	  <xsl:with-param name="head" select="$follow[1]"/>
	  <xsl:with-param name="tail" select="$follow[position()&gt;1]"/>
	  <xsl:with-param name="theory" select="$theory"/><!-- TODO remove after debugging -->
	  <xsl:with-param name="prefix-URI" select="$prefix-URI"/>
	  <xsl:with-param name="top-level-call" select="$top-level-call"/>
	  <xsl:with-param name="visited" select="$visited"/>
	  <xsl:with-param name="call-stack" select="$call-stack"/>
	  <xsl:with-param name="indent" select="$indent"/>
	</xsl:call-template>
      </xsl:variable>

      <xsl:choose>
	<xsl:when test="$top-level-call">
	  <xsl:copy-of select="exsl:node-set($result)/loc"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:copy-of select="exsl:node-set($result)"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:if>
  </xsl:if>
</xsl:template>

<!-- one step of the "for-each" loop of recursive calls of make-catalogue,
     implemented as a tail-recursive function -->
<xsl:template name="make-catalogue-iteration">
  <xsl:param name="todo"/>
  <xsl:param name="head"/>
  <xsl:param name="tail"/>
  <xsl:param name="theory"/><!-- TODO remove after debugging -->
  <xsl:param name="prefix-URI"/>
  <xsl:param name="top-level-call"/>
  <xsl:param name="visited"/>
  <xsl:param name="call-stack"/>
  <xsl:param name="indent"/><!-- TODO remove after debugging -->
  <xsl:param name="position" select="1"/><!-- TODO remove after debugging -->

  <xsl:if test="$debug and $head=exsl:node-set($call-stack)/stack">
    <xsl:message terminate="yes"><xsl:value-of select="$indent"/>CYCLE DETECTED AT <xsl:value-of select="$theory/@xml:id"/> imports <xsl:value-of select="$head"/> (STACK: <xsl:for-each select="exsl:node-set($call-stack)/stack"><xsl:value-of select="."/>,</xsl:for-each>)</xsl:message>
  </xsl:if>
  <xsl:variable name="prefix-from-omdoc" select="substring-before($head,omdoc:strip-prefix($head))"/>
  <xsl:variable name="prefix" select="omdoc:effective-uri($prefix-from-omdoc,$prefix-URI)"/>
  <xsl:if test="$debug"> 
    <xsl:message><xsl:value-of select="$indent"/>head: <xsl:for-each select="$head"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>tail: <xsl:for-each select="$tail"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>calling make-catalogue for <xsl:value-of select="$position"/>: <xsl:value-of select="$head"/></xsl:message>
  </xsl:if>

  <xsl:variable name="recursive-call">
    <!-- this generates a set of loc's, followed by a list of visited's -->
    <xsl:call-template name="make-catalogue">
      <xsl:with-param name="todo" select="$todo"/>
      <xsl:with-param name="theory" select="document($head,.)"/>
      <xsl:with-param name="prefix-URI" select="$prefix"/>
      <xsl:with-param name="visited" select="$visited"/>
      <xsl:with-param name="top-level-call" select="false()"/>
      <xsl:with-param name="indent" select="concat($indent, '  ')"/>
      <xsl:with-param name="call-stack">
	<xsl:copy-of select="$call-stack"/>
	<stack><xsl:value-of select="$head"/></stack>
      </xsl:with-param>
    </xsl:call-template>
    <visited><xsl:value-of select="$head"/></visited>
  </xsl:variable>

  <!-- output the loc's generated by the recursive call -->
  <xsl:copy-of select="exsl:node-set($recursive-call)/loc"/>
  <xsl:for-each select="exsl:node-set($recursive-call)/visited">
    <visited><xsl:value-of select="."/></visited>
  </xsl:for-each>

  <!-- prepare next iteration: search still unvisited theories for imports still not found -->
  <xsl:variable name="new-tail" select="$tail[not(.=exsl:node-set($recursive-call)/visited)]"/>
  <xsl:variable name="new-todo" select="$todo[not(.=exsl:node-set($recursive-call)/loc/@theory)]"/>
  <xsl:if test="$debug and $recursive-call">
    <xsl:message><xsl:value-of select="$indent"/>done in this recursion: <xsl:for-each select="exsl:node-set($recursive-call)/loc/@theory"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>still left to be found: <xsl:for-each select="$new-todo"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>still left to be searched: <xsl:for-each select="$new-tail"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
    <xsl:message><xsl:value-of select="$indent"/>new "visited": <xsl:for-each select="$visited|exsl:node-set($recursive-call)/visited"><xsl:value-of select="."/>,</xsl:for-each></xsl:message>
  </xsl:if>

  <!-- if there are imports to be found ... -->
  <xsl:if test="$new-todo">
    <xsl:choose>
      <!-- ... and unvisited theories to search for them ... -->
      <xsl:when test="$new-tail">
	<!-- ... then go ahead to the next iteration -->
	<xsl:call-template name="make-catalogue-iteration">
	  <xsl:with-param name="todo" select="$new-todo"/>
	  <xsl:with-param name="head" select="$new-tail[1]"/>
	  <xsl:with-param name="tail" select="$new-tail[position()&gt;1]"/>
	  <xsl:with-param name="theory" select="$theory"/>
	  <xsl:with-param name="top-level-call" select="$top-level-call"/>
	  <xsl:with-param name="visited" select="$visited|exsl:node-set($recursive-call)/visited"/>
	  <xsl:with-param name="prefix-URI" select="$prefix-URI"/>
	  <xsl:with-param name="call-stack" select="$call-stack"/>
	  <xsl:with-param name="indent" select="$indent"/>
	  <xsl:with-param name="position" select="$position + 1"/>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:if test="$top-level-call">
	  <xsl:message terminate="yes">Cannot find locations for the theories 
	    <xsl:for-each select="$new-todo">
	      <xsl:value-of select="."/>
	      <xsl:if test="position()!=last()">,</xsl:if>
	  </xsl:for-each>!</xsl:message>
	</xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:if>
</xsl:template>
</xsl:stylesheet>
