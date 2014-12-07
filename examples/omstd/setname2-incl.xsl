<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=setname2-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#setname2"><loc theory="setname1" omdoc="setname1.omdoc#setname1"/><loc theory="sts" omdoc="sts.omdoc#sts"/></catalogue><catalogue for="#setname2-nonconstitutive"><loc theory="setname2" omdoc="#setname2"/><loc theory="alg1" omdoc="alg1.omdoc#alg1"/><loc theory="arith1" omdoc="arith1.omdoc#arith1"/><loc theory="quant1" omdoc="quant1.omdoc#quant1"/><loc theory="relation1" omdoc="relation1.omdoc#relation1"/><loc theory="set1" omdoc="set1.omdoc#set1"/><loc theory="logic1" omdoc="logic1.omdoc#logic1"/><loc theory="setname1" omdoc="setname1.omdoc#setname1"/><loc theory="sts" omdoc="sts.omdoc#sts"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="setname2-tmpl.xsl"/><xsl:include href="setname1-tmpl.xsl"/><xsl:include href="sts-tmpl.xsl"/><xsl:include href="alg1-tmpl.xsl"/><xsl:include href="arith1-tmpl.xsl"/><xsl:include href="quant1-tmpl.xsl"/><xsl:include href="relation1-tmpl.xsl"/><xsl:include href="set1-tmpl.xsl"/><xsl:include href="logic1-tmpl.xsl"/></xsl:stylesheet>
