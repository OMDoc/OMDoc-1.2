<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=usesall.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#monoids"><loc theory="posets" omdoc="poset.omdoc#posets"/><loc theory="simpletypes" omdoc="../logics/simpletypes.omdoc#simpletypes"/><loc theory="pl0" omdoc="../logics/pl0.omdoc#pl0"/><loc theory="ind" omdoc="../logics/ind.omdoc#ind"/></catalogue><catalogue for="#group"><loc theory="monoids" omdoc="#monoids"/></catalogue><catalogue for="#ring"><loc theory="group" omdoc="#group"/><loc theory="monoids" omdoc="#monoids"/></catalogue><catalogue for="#nats"/><catalogue for="#Param"><loc theory="poset" omdoc="#poset"/></catalogue><catalogue for="#List"><loc theory="Param" omdoc="#Param"/></catalogue><catalogue for="#nat-list"><loc theory="nats" omdoc="#nats"/><loc theory="List" omdoc="#List"/></catalogue><catalogue for="#tpres"/></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="all-tmpl.xsl"/><xsl:include href="poset-tmpl.xsl"/><xsl:include href="../logics/simpletypes-tmpl.xsl"/><xsl:include href="../logics/pl0-tmpl.xsl"/><xsl:include href="../logics/ind-tmpl.xsl"/></xsl:stylesheet>
