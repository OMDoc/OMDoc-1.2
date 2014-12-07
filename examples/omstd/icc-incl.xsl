<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=icc-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#icc"><loc theory="setname1" omdoc="setname1.omdoc#setname1"/><loc theory="lc" omdoc="lc.omdoc#lc"/><loc theory="indnat" omdoc="indnat.omdoc#indnat"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="icc-tmpl.xsl"/><xsl:include href="setname1-tmpl.xsl"/><xsl:include href="lc-tmpl.xsl"/><xsl:include href="indnat-tmpl.xsl"/></xsl:stylesheet>
