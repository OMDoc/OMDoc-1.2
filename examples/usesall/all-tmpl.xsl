<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) usesall.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='unary-minus-nat' and @cd='nats' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='nats']/@omdoc)"/><xsl:variable name="name" select="'unary-minus-nat'"/><xsl:choose><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">-</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'unary-minus-nat',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="5"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="5"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'unary-minus-nat',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='plus' and @cd='nats' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='nats']/@omdoc)"/><xsl:variable name="name" select="'plus'"/><xsl:choose><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="20"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="20"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:choose><xsl:when test="position()=1"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">+</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'plus',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(../*[1]))"/></xsl:call-template></xsl:when><xsl:otherwise><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">+</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'plus',$crossref-format)"/></xsl:call-template></xsl:otherwise></xsl:choose></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='times' and @cd='nats' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='nats']/@omdoc)"/><xsl:variable name="name" select="'times'"/><xsl:choose><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="10"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="10"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:choose><xsl:when test="position()=1"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">*</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'times',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(../*[1]))"/></xsl:call-template></xsl:when><xsl:otherwise><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">*</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'times',$crossref-format)"/></xsl:call-template></xsl:otherwise></xsl:choose></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='zero' and @cd='nats' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='nats']/@omdoc)"/><xsl:variable name="name" select="'zero'"/><xsl:choose><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">0</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'zero',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='succ' and @cd='nats' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='nats']/@omdoc)"/><xsl:variable name="name" select="'succ'"/><xsl:choose><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">s</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'succ',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'succ',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='nullary' and @cd='tpres' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'nullary'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">N</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'nullary',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">N</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'nullary',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='prefix-lisp' and @cd='tpres' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'prefix-lisp'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">[</xsl:with-param><xsl:with-param name="close">]</xsl:with-param><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">PL</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-lisp',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-lisp',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">[</xsl:with-param><xsl:with-param name="close">]</xsl:with-param><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">pl</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-lisp',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-lisp',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='prefix-math' and @cd='tpres' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'prefix-math'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">PM</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-math',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">[</xsl:with-param><xsl:with-param name="close">]</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-math',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">pm</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-math',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">[</xsl:with-param><xsl:with-param name="close">]</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'prefix-math',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='infix' and @cd='tpres' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'infix'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">\{</xsl:with-param><xsl:with-param name="close">\}</xsl:with-param><xsl:with-param name="content"><!--for some reason a comment here helps, don't ask me why--><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">IN</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'infix',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">\{</xsl:with-param><xsl:with-param name="close">\}</xsl:with-param><xsl:with-param name="content"><!--for some reason a comment here helps, don't ask me why--><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">in</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'infix',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='assoc' and @cd='tpres' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'assoc'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">!</xsl:with-param><xsl:with-param name="close">!</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:choose><xsl:when test="position()=1"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">{:}</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'assoc',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(../*[1]))"/></xsl:call-template></xsl:when><xsl:otherwise><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">{:}</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'assoc',$crossref-format)"/></xsl:call-template></xsl:otherwise></xsl:choose></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">!</xsl:with-param><xsl:with-param name="close">!</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:choose><xsl:when test="position()=1"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">:</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'assoc',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(../*[1]))"/></xsl:call-template></xsl:when><xsl:otherwise><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">:</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'assoc',$crossref-format)"/></xsl:call-template></xsl:otherwise></xsl:choose></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='postfix' and @cd='tpres' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'postfix'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'postfix',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">PM</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'postfix',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'postfix',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">pm</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'postfix',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='mixfix' and @cd='tpres' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='tpres']/@omdoc)"/><xsl:variable name="name" select="'mixfix'"/><xsl:choose><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">
  &lt;xsl:apply-templates select="*[2]" mode="html"/&gt;
           |-&lt;xsl:apply-templates select="*[3]" mode="html"/&gt;
           :&lt;xsl:apply-templates select="*[4]" mode="html"/&gt;
</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'mixfix',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'mixfix',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">
  &lt;xsl:apply-templates select="*[2]" mode="html"/&gt;
           \vdash&lt;xsl:apply-templates select="*[3]" mode="html"/&gt;
           :&lt;xsl:apply-templates select="*[4]" mode="html"/&gt;
</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'mixfix',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'mixfix',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>
