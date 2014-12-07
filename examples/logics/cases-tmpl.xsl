<?xml version="1.0"?>
<!--
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) cases.omdoc.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:exsl="http://exslt.org/common" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:om="http://www.openmath.org/OpenMath" xmlns:omdoc="http://www.mathweb.org/omdoc" version="1.0" exsl:dummy="to get the namespace right" xlink:dummy="to get the namespace right" om:dummy="to get the namespace right" omdoc:dummy="to get the namespace right" extension-element-prefixes="exsl">

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='cases' and @cd='cases' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='cases']/@omdoc)"/><xsl:variable name="name" select="'cases'"/><xsl:choose><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:element name="mrow" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>case</xsl:text></xsl:element><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>of</xsl:text></xsl:element><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[position()&gt;2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text> esac</xsl:text></xsl:element></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text>case </xsl:text><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text> of </xsl:text><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[position()&gt;2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text> esac</xsl:text></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='case' and @cd='cases' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='cases']/@omdoc)"/><xsl:variable name="name" select="'case'"/><xsl:choose><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:element name="mrow" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>: </xsl:text></xsl:element><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text/></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text>: </xsl:text><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[3]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text/></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

<xsl:template match="om:OMA[not(@xref) and om:OMS[position()=1 and @name='case-other' and @cd='cases' and not(@style)]]" priority="1"><xsl:param name="prec" select="1000"/><xsl:param name="prefix"/><xsl:variable name="theory"><xsl:choose><xsl:when test="ancestor::omdoc:theory[1]/@xml:id"><xsl:value-of select="ancestor::omdoc:theory[1]/@xml:id"/></xsl:when><xsl:when test="ancestor::*[@theory]"><xsl:value-of select="substring-after(ancestor::*[@theory][1]/@theory, '#')"/></xsl:when><xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise></xsl:choose></xsl:variable><xsl:variable name="omdoc" select="string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='cases']/@omdoc)"/><xsl:variable name="name" select="'case-other'"/><xsl:choose><xsl:when test="$format='pmml'"><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:element name="mrow" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:element name="mo" namespace="{$TargetNS}"><xsl:attribute name="xlink:href"><xsl:value-of select="omdoc:crossref($omdoc,$name,$crossref-format)"/></xsl:attribute><xsl:text>other: </xsl:text></xsl:element><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text/></xsl:element></xsl:when><xsl:otherwise/></xsl:choose></xsl:when><xsl:otherwise><xsl:variable name="valid-lang" select="omdoc:comp-valid-language('en',$TargetLanguage)"/><xsl:choose><xsl:when test="$valid-lang='en'"><xsl:text>other: </xsl:text><!--somehow I need this comment, otherwise xsltproc does not generate the rest--><xsl:apply-templates select="*[2]"><xsl:with-param name="prefix" select="$prefix"/></xsl:apply-templates><xsl:text/></xsl:when><xsl:otherwise/></xsl:choose></xsl:otherwise></xsl:choose></xsl:template>

</xsl:stylesheet>
