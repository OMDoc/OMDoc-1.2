<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) units_metric1-omdoc.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMS[@name='metre' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'metre'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">m</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'metre',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='metre' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'metre'"/><xsl:choose><xsl:when test="$format='defaut'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">sqm</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'metre',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='html'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text>m</xsl:text><xsl:element name="sup" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>2</xsl:text></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text>m^2</xsl:text></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:element name="msup" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>m</xsl:text></xsl:element><xsl:element name="mn" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>2</xsl:text></xsl:element></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='litre' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'litre'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">l</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'litre',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='metres_per_second' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'metres_per_second'"/><xsl:choose><xsl:when test="$format='defaut'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">m/s</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'metres_per_second',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text>{m\over s}</xsl:text></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:element name="msup" namespace="{$TargetNS}"><xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>m</xsl:text></xsl:element><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>s</xsl:text></xsl:element></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:apply-templates select="." mode="fallback"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='second' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'second'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">s</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'second',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='gramme' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'gramme'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">g</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'gramme',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='Newton' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'Newton'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">N</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'Newton',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='degree_Kelvin' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'degree_Kelvin'"/><xsl:choose><xsl:when test="$format='html' or $format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">°K</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'degree_Kelvin',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">^{\circ}K</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'degree_Kelvin',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">deg K</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'degree_Kelvin',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='degree_Celsius' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'degree_Celsius'"/><xsl:choose><xsl:when test="$format='html' or $format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">°C</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'degree_Celsius',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:when test="$format='TeX'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">^{\circ}C</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'degree_Celsius',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">deg C</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'degree_Celsius',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='Coulomb' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'Coulomb'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">C</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'Coulomb',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='amp' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'amp'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">A</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'amp',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

<xsl:template match="om:OMS[@name='volt' and @cd='units_metric1' and not(@style)]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='units_metric1']/@omdoc)"/><xsl:variable name="name" select="'volt'"/><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:call-template name="print-symbol"><xsl:with-param name="print-form">V</xsl:with-param><xsl:with-param name="crossref-symbol" select="'yes'"/><xsl:with-param name="uri" select="omdoc:crossref($omdoc,'volt',$crossref-format)"/><xsl:with-param name="id" select="concat('MCR',$prefix,generate-id(.))"/></xsl:call-template></xsl:when><xsl:otherwise/></xsl:choose></xsl:template>

</xsl:stylesheet>
