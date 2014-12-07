<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) set2-omdoc.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='size' and @cd='set2' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='set2']/@omdoc)"/><xsl:variable name="name" select="'size'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">|</xsl:with-param><xsl:with-param name="close">|</xsl:with-param><xsl:with-param name="content"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'size',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>



</xsl:stylesheet>
