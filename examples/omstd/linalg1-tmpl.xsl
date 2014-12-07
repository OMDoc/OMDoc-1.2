<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) linalg1-omdoc.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMS[@name='vectorproduct' and @cd='linalg1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'vectorproduct'"/><xsl:choose><xsl:when test="$format='cmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="vectorproduct" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"/><xsl:with-param name="parent-element">vectorproduct</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='scalarproduct' and @cd='linalg1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'scalarproduct'"/><xsl:choose><xsl:when test="$format='cmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="scalarproduct" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"/><xsl:with-param name="parent-element">scalarproduct</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='outerproduct' and @cd='linalg1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'outerproduct'"/><xsl:choose><xsl:when test="$format='cmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="outerproduct" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"/><xsl:with-param name="parent-element">outerproduct</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='transpose' and @cd='linalg1' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'transpose'"/><xsl:choose><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="250"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="250"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'transpose',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">^T</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'transpose',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="250"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="250"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'transpose',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">&lt;sup&gt;T&lt;/sup&gt;</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'transpose',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="250"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="msup" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="250"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'transpose',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">T</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'transpose',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(*[1]))"/></xsl:call-template></xsl:with-param><xsl:with-param name="parent-element">msup</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='transpose' and @cd='linalg1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'transpose'"/><xsl:choose><xsl:when test="$format='cmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="transpose" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"/><xsl:with-param name="parent-element">transpose</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='determinant' and @cd='linalg1' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'determinant'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="make-group"><xsl:with-param name="content"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">|</xsl:with-param><xsl:with-param name="close">|</xsl:with-param><xsl:with-param name="content"><xsl:for-each select="*[position()!=1]"><xsl:call-template name="do-arg"><xsl:with-param name="content"><xsl:apply-templates select="."><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="1000"/></xsl:apply-templates></xsl:with-param></xsl:call-template><xsl:if test="position()!=last()"><xsl:call-template name="print-separator"><xsl:with-param name="print-form" select="','"/><xsl:with-param name="crossref-symbol" select="'brackets'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'determinant',$crossref-format)"/></xsl:call-template></xsl:if></xsl:for-each></xsl:with-param></xsl:call-template></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='determinant' and @cd='linalg1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'determinant'"/><xsl:choose><xsl:when test="$format='cmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="determinant" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"/><xsl:with-param name="parent-element">determinant</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='vector_selector' and @cd='linalg1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'vector_selector'"/><xsl:choose><xsl:when test="$format='cmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="with-arg-group"><xsl:with-param name="prefix" select="$prefix"/><xsl:with-param name="prec" select="$prec"/><xsl:with-param name="precedence" select="1000"/><xsl:with-param name="open">(</xsl:with-param><xsl:with-param name="close">)</xsl:with-param><xsl:with-param name="content"><xsl:element name="selector" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="concat('MCR',$prefix,generate-id())"/></xsl:attribute><xsl:call-template name="make-group"><xsl:with-param name="content"/><xsl:with-param name="parent-element">selector</xsl:with-param></xsl:call-template></xsl:element></xsl:with-param></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='vector_selector' and @cd='linalg1' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='linalg1']/@omdoc)"/><xsl:variable name="name" select="'vector_selector'"/><xsl:choose><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:element name="mrow" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>select</xsl:text></xsl:element><xsl:element name="mfenced" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:attribute name="open"><xsl:value-of select="'('"/></xsl:attribute><xsl:attribute name="close"><xsl:value-of select="')'"/></xsl:attribute><xsl:attribute name="separators"><xsl:value-of select="','"/></xsl:attribute><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:element></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text>select(</xsl:text><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text>,</xsl:text><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text>)</xsl:text></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>
