<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=typesorts-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#typesorts"><loc theory="cc" omdoc="cc.omdoc#cc"/><loc theory="logic1" omdoc="logic1.omdoc#logic1"/><loc theory="ecc" omdoc="ecc.omdoc#ecc"/><loc theory="icc" omdoc="icc.omdoc#icc"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="typesorts-tmpl.xsl"/><xsl:include href="cc-tmpl.xsl"/><xsl:include href="logic1-tmpl.xsl"/><xsl:include href="ecc-tmpl.xsl"/><xsl:include href="icc-tmpl.xsl"/></xsl:stylesheet>
