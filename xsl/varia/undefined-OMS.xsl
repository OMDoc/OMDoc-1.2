<?xml version="1.0" encoding="utf-8"?>

<!-- An XSL style sheet for warning about OMS which are not defined, i.e. 
     either the theory/CD cannot be found, or it is missing a symbol 
     declaration of this name.

     Copyright (c) 2002 Michael Kohlhase, 
     This style sheet is released under the Gnu Public License
     Initial version 2001-5-15 by Michael Kohlhase, 
     send bug-reports, patches, suggestions to developers@omdoc.org
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:omdoc="http://www.mathweb.org/omdoc" 
  xmlns:exsl="http://exslt.org/common" 
  xmlns:set="http://exslt.org/sets" 
  xmlns:om="http://www.openmath.org/OpenMath"
  exclude-result-prefixes="om omdoc exsl set"
  extension-element-prefixes="exsl set"
  version="1.0">

  <xsl:include href="../exincl.xsl"/>

 <xsl:param name="terminate" select="'yes'"/>
 <xsl:output method="text"/>


<xsl:template match="/" priority="1">
  <xsl:text>Testing for undefined Symbols&#xA;</xsl:text>
  <xsl:for-each select="$cdus/@cd">
    <xsl:variable name="cd" select="."/>
    <!-- the URI given for the omdoc in the catalogue -->
    <xsl:variable name="omdocURI" select="$href-cat/catalogue/loc[@theory=$cd]/@omdoc"/>
    <!-- and find the respective theoy either there or locally -->
    <xsl:variable name="theory">
      <xsl:choose>
        <xsl:when test="not($omdocURI)">
          <xsl:choose>
            <xsl:when test="exsl:node-set($all)/descendant::omdoc:theory[@xml:id=$cd]">
              <xsl:copy-of select="exsl:node-set($all)/descendant::omdoc:theory[@xml:id=$cd]"/>
            </xsl:when>
            <xsl:otherwise>
              <xsl:choose>
                <xsl:when test="$terminate='yes'">
                  <xsl:message terminate="yes">Could not find theory <xsl:value-of select="$cd"/>!</xsl:message>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:text>theory</xsl:text>
                  <xsl:value-of select="$cd"/>
                  <xsl:text>could not be found!&#xA;</xsl:text>
                </xsl:otherwise>
              </xsl:choose>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
          <xsl:copy-of select="document($omdocURI,.)//omdoc:theory[@xml:id=$cd]"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>
    <!-- now, we determine the symbol names we want to find there -->
    <xsl:variable name="names" 
      select="set:distinct(exsl:node-set($all)/descendant::om:OMS[@cd=$cd]/@name)"/>
    <!-- and actually operate on them -->
    <xsl:for-each select="$names">
      <xsl:variable name="name" select="."/>
      <xsl:if test="not(exsl:node-set($theory)/descendant::omdoc:symbol[@xml:id=$name])">
        <xsl:variable name="msg">
          <xsl:text>Symbol &lt;OMS cd="</xsl:text>
          <xsl:value-of select="$cd"/>
          <xsl:text>" name="</xsl:text>
          <xsl:value-of select="$name"/>
          <xsl:text>"&gt; undefined!</xsl:text>
        </xsl:variable>
        <xsl:choose>
          <xsl:when test="$terminate='yes'">
            <xsl:message terminate="yes"><xsl:value-of select="$msg"/></xsl:message>
          </xsl:when>
          <xsl:otherwise>
            <xsl:message><xsl:value-of select="$msg"/></xsl:message>
            <xsl:value-of select="$msg"/>
            <xsl:text>&#xA;</xsl:text>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:for-each>
  </xsl:for-each>
  <xsl:text>&#xA;&#xA;End Test&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>
