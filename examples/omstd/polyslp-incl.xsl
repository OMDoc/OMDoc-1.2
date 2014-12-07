<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=polyslp-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#polyslp"><loc theory="sts" omdoc="sts.omdoc#sts"/><loc theory="polysts" omdoc="polysts.omdoc#polysts"/><loc theory="setname1" omdoc="setname1.omdoc#setname1"/><loc theory="opnode" omdoc="opnode.omdoc#opnode"/><loc theory="relation1" omdoc="relation1.omdoc#relation1"/><loc theory="poly" omdoc="poly.omdoc#poly"/><loc theory="typesorts" omdoc="typesorts.omdoc#typesorts"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="polyslp-tmpl.xsl"/><xsl:include href="sts-tmpl.xsl"/><xsl:include href="polysts-tmpl.xsl"/><xsl:include href="setname1-tmpl.xsl"/><xsl:include href="opnode-tmpl.xsl"/><xsl:include href="relation1-tmpl.xsl"/><xsl:include href="poly-tmpl.xsl"/><xsl:include href="typesorts-tmpl.xsl"/></xsl:stylesheet>
