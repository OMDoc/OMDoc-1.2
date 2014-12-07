<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=veccalc1-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#veccalc1"><loc theory="sts" omdoc="sts.omdoc#sts"/><loc theory="relation1" omdoc="relation1.omdoc#relation1"/><loc theory="arith1" omdoc="arith1.omdoc#arith1"/><loc theory="linalg1" omdoc="linalg1.omdoc#linalg1"/><loc theory="linalg2" omdoc="linalg2.omdoc#linalg2"/><loc theory="calculus1" omdoc="calculus1.omdoc#calculus1"/><loc theory="list1" omdoc="list1.omdoc#list1"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="veccalc1-tmpl.xsl"/><xsl:include href="sts-tmpl.xsl"/><xsl:include href="relation1-tmpl.xsl"/><xsl:include href="arith1-tmpl.xsl"/><xsl:include href="linalg1-tmpl.xsl"/><xsl:include href="linalg2-tmpl.xsl"/><xsl:include href="calculus1-tmpl.xsl"/><xsl:include href="list1-tmpl.xsl"/></xsl:stylesheet>
