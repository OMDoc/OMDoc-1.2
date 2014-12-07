<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=coercions-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#coercions"><loc theory="cc" omdoc="cc.omdoc#cc"/><loc theory="omtypes" omdoc="omtypes.omdoc#omtypes"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="coercions-tmpl.xsl"/><xsl:include href="cc-tmpl.xsl"/><xsl:include href="omtypes-tmpl.xsl"/></xsl:stylesheet>
