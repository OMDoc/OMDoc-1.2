<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=s_dist1-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#s_dist1"><loc theory="sts" omdoc="sts.omdoc#sts"/><loc theory="relation1" omdoc="relation1.omdoc#relation1"/><loc theory="calculus1" omdoc="calculus1.omdoc#calculus1"/><loc theory="interval1" omdoc="interval1.omdoc#interval1"/><loc theory="arith1" omdoc="arith1.omdoc#arith1"/><loc theory="nums1" omdoc="nums1.omdoc#nums1"/><loc theory="fns1" omdoc="fns1.omdoc#fns1"/><loc theory="setname1" omdoc="setname1.omdoc#setname1"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="s_dist1-tmpl.xsl"/><xsl:include href="sts-tmpl.xsl"/><xsl:include href="relation1-tmpl.xsl"/><xsl:include href="calculus1-tmpl.xsl"/><xsl:include href="interval1-tmpl.xsl"/><xsl:include href="arith1-tmpl.xsl"/><xsl:include href="nums1-tmpl.xsl"/><xsl:include href="fns1-tmpl.xsl"/><xsl:include href="setname1-tmpl.xsl"/></xsl:stylesheet>
