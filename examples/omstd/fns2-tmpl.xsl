<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) fns2-omdoc.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMS[@name='apply_to_list' and @cd='fns2' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='fns2']/@omdoc)"/><xsl:variable name="name" select="'apply_to_list'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">map</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'apply_to_list',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

</xsl:stylesheet>
