<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=pf2hol-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#pf2hol"><loc theory="sthol" omdoc="sthol.omdoc#sthol"/><loc theory="undefined" omdoc="undefined.omdoc#undefined"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="pf2hol-tmpl.xsl"/><xsl:include href="sthol-tmpl.xsl"/><xsl:include href="undefined-tmpl.xsl"/></xsl:stylesheet>
