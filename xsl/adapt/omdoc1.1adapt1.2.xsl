<?xml version="1.0" encoding="utf-8"?>
<!-- this is a style sheet that serves as a seed to transforming an 
     OMDoc from version 1.1 to 1.2. It copies everything verbatim, except
     those templates that have been changed

     NOTE, that this style sheet eliminate comments and put in all 
     default values for attributes that are specified in the DTD.

     To get around the comment problems, put those you want to preserve 
     into <ignore> elements, the second one is actually a plus, since 
     it makes the whole thing more explicit.
     -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  version="1.0">

  <xsl:output
    doctype-public="-//OMDoc//DTD OMDoc V1.2//EN"
    doctype-system="http://www.mathweb.org/omdoc/dtd/omdoc1.2.dtd"
    method="xml" indent="yes" cdata-section-elements="data"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="*[@style]">
  <xsl:copy>
    <xsl:for-each select="@*[local-name()!='style']">
      <xsl:copy-of select="."/>
    </xsl:for-each>
    <xsl:attribute name="class"><xsl:value-of select="@style"/></xsl:attribute>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


<xsl:template match="omdoc:omdoc">
  <xsl:if test="@version!='1.1'">
    <xsl:message terminate="yes">ERROR: This document only converts OMDoc 1.1 documents to 1.2!</xsl:message>
  </xsl:if>
  <xsl:copy>
    <!-- only change the version attribute -->
    <xsl:for-each select="@*[local-name()!='version']">
      <xsl:copy-of select="."/>
    </xsl:for-each>
    <xsl:attribute name="version"><xsl:text>1.2</xsl:text></xsl:attribute>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="omdoc:constructor|omdoc:recognizer|omdoc:selector">
  <xsl:copy>
    <!-- the 'kind' attribute is now fixed to 'object' -->
    <xsl:for-each select="@*[local-name()!='kind']">
      <xsl:copy-of select="@*"/>
    </xsl:for-each>
    <xsl:attribute name="version" select="'object'"/>
    <xsl:if test="@kind!='object'">
      <xsl:message>Changing attribute 'kind' on element '{local-name()}' from '{@kind}' to 'object'!</xsl:message>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="omdoc:sortdef">
  <xsl:copy>
    <!-- the 'kind' attribute is now fixed to 'object' -->
    <xsl:for-each select="@*[local-name()!='kind']">
      <xsl:copy-of select="@*"/>
    </xsl:for-each>
    <xsl:attribute name="version" select="'sort'"/>
    <xsl:if test="@kind!='sort'">
      <xsl:message>Changing attribute 'kind' on element '{local-name()}' from '{@kind}' to 'sort!</xsl:message>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="omdoc:symbol[omdoc:selector]">
  <xsl:message terminate="yes">symbol with id={@id}  does not allow 'selector' child!</xsl:message>
</xsl:template>

<!-- tables are now supported in module RT -->
<xsl:template match="omdoc:omgroup[@type='labeled-dataset']">
  <xsl:message terminate="yes">Cannot convert deprecated tables yet!</xsl:message>
</xsl:template>

<xsl:template match="omdoc:omgroup/omdoc:omlet|omdoc:omdoc/omdoc:omlet|omdoc:theory/omdoc:omlet">
  <xsl:message terminate="yes">omlet is not allowed at top-level any more</xsl:message>
</xsl:template>

<xsl:template match="om:*[@xref]">
  <om:OMR xlink:href="{@xref}"/>
</xsl:template>

<xsl:template match="om:OMOBJ[@xref]">
  <xsl:message terminate="yes">OMOBJ with @xref, cannot reference sub-object!</xsl:message>
</xsl:template>

</xsl:stylesheet>


<!-- todo: 
     - merge the metadata of symbol and definition in some intelligent way
     - move the width and height attributes from 'code' and 'private' to 'omlet' 
  -->
