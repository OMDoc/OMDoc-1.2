<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=s_data1-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#s_data1"><loc theory="sts" omdoc="sts.omdoc#sts"/><loc theory="relation1" omdoc="relation1.omdoc#relation1"/><loc theory="fns2" omdoc="fns2.omdoc#fns2"/><loc theory="arith1" omdoc="arith1.omdoc#arith1"/><loc theory="set1" omdoc="set1.omdoc#set1"/><loc theory="list1" omdoc="list1.omdoc#list1"/><loc theory="fns1" omdoc="fns1.omdoc#fns1"/><loc theory="alg1" omdoc="alg1.omdoc#alg1"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="s_data1-tmpl.xsl"/><xsl:include href="sts-tmpl.xsl"/><xsl:include href="relation1-tmpl.xsl"/><xsl:include href="fns2-tmpl.xsl"/><xsl:include href="arith1-tmpl.xsl"/><xsl:include href="set1-tmpl.xsl"/><xsl:include href="list1-tmpl.xsl"/><xsl:include href="fns1-tmpl.xsl"/><xsl:include href="alg1-tmpl.xsl"/></xsl:stylesheet>
