<?xml version="1.0" standalone="yes"?>
<!--
    an xsl style sheet for presenting openmath symbols used in the 
    OMDoc document with id=sts-omdoc.
  
    This xsl style file is automatically generated, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" version="1.0" exsl:dummy="to get the namespace right" extension-element-prefixes="exsl"><xsl:variable name="tree"><catalogue for="#sts"/><catalogue for="#sts-nonconstitutive"><loc theory="setname1" omdoc="setname1.omdoc#setname1"/><loc theory="sts" omdoc="#sts"/></catalogue></xsl:variable>

<xsl:variable name="href-cat" select="exsl:node-set($tree)"/>

<xsl:include href="sts-tmpl.xsl"/><xsl:include href="setname1-tmpl.xsl"/></xsl:stylesheet>
