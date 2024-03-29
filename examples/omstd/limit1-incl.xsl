<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=limit1-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#limit1"><loc theory="sts" omdoc="sts.omdoc#sts"/></catalogue><catalogue for="#limit1-nonconstitutive"><loc theory="limit1" omdoc="#limit1"/><loc theory="fns1" omdoc="fns1.omdoc#fns1"/><loc theory="transc1" omdoc="transc1.omdoc#transc1"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="limit1-tmpl.xsl"/><xsl:include href="sts-tmpl.xsl"/><xsl:include href="fns1-tmpl.xsl"/><xsl:include href="transc1-tmpl.xsl"/></xsl:stylesheet>
