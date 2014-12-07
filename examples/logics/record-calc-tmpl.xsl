<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) record-calc-omdoc.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='record' and @cd='record-calc' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='record-calc']/@omdoc)"/><xsl:variable name="name" select="'record'"/><xsl:choose><xsl:when test="$format='pvs'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.mathweb.org/omdoc" disable-output-escaping="no">(# </xsl:text><xsl:for-each xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.mathweb.org/omdoc" select="*"><xsl:if test="(position() mod 2) = 0"><xsl:variable name="next" select="position()+1"/><xsl:value-of select="." disable-output-escaping="no"/><xsl:text disable-output-escaping="no">:= </xsl:text><xsl:apply-templates select="../*[$next]"/><xsl:if test="position()!=last()-1"><xsl:text disable-output-escaping="no">, </xsl:text></xsl:if></xsl:if></xsl:for-each><xsl:text xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns" xmlns:m="http://www.w3.org/1998/Math/MathML" xmlns="http://www.mathweb.org/omdoc" disable-output-escaping="no"> #)</xsl:text></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='select' and @cd='record-calc' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='record-calc']/@omdoc)"/><xsl:variable name="name" select="'select'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">.</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'select',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='ellipsis' and @cd='record-calc' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='record-calc']/@omdoc)"/><xsl:variable name="name" select="'ellipsis'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">{\ldots}</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'ellipsis',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">...</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'ellipsis',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='tuple' and @cd='record-calc' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='record-calc']/@omdoc)"/><xsl:variable name="name" select="'tuple'"/><xsl:choose><xsl:when test="$format='pvs'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">( </xsl:with-param><xsl:with-param name="close"> )</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'tuple',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='proj' and @cd='record-calc' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='record-calc']/@omdoc)"/><xsl:variable name="name" select="'proj'"/><xsl:choose><xsl:when test="$format='pvs'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open"/><xsl:with-param name="close"/><xsl:with-param name="content"><!--for some reason a comment here helps, don't ask me why--><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">`</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'proj',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>
