<?xml version="1.0" encoding="utf-8"?>
<!-- this is a style sheet that serves as a seed to transforming an 
     OMDoc from version 1.0 to 1.1. It copies everything verbatim, except
     those templates that have been changed

     NOTE, that this style sheet will eliminate comments and put in all 
     default values for attributes that are specified in the DTD.

     To get around the comment problems, put those you want to preserve 
     into <ignore> elements, the second one is actually a plus, since 
     it makes the whole thing more explicit.
     -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xsl:extension-element-prefixes="saxon"
                xmlns:saxon="http://icl.com/saxon" 
                version="1.0">
<!-- this parameter allows to specify a local dtd -->
<xsl:param name="dtd"/>

<xsl:output method="xml" indent="yes" cdata-section-elements="data"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
  <xsl:text>&#xA;&#xA;</xsl:text>
  <saxon:doctype xsl:extension-element-prefixes="saxon"
    xmlns:dtd="http://icl.com/saxon/dtd" xsl:exclude-result-prefixes="dtd">
    <xsl:choose>
      <xsl:when test="$dtd=''">
        <dtd:doctype name="omdoc" system="http://www.mathweb.org/omdoc/dtd/omdoc1.1.dtd"/>
      </xsl:when>
      <xsl:otherwise>
        <dtd:doctype name="omdoc" system="{$dtd}"/>
      </xsl:otherwise>
    </xsl:choose>
  </saxon:doctype>
  <xsl:text>&#xA;&#xA;</xsl:text>
  <xsl:apply-templates/>
</xsl:template>

<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xsl:template match="symbol">
  <xsl:variable name="id" select="@id"/>
  <xsl:choose>
    <xsl:when test="../definition[@for=$id]">
      <xsl:variable name="def" select="../definition[@for=$id]"/>
      <definition id="{$def/@id}">
        <xsl:apply-templates select="$def/metadata"/>
        <xsl:apply-templates select="$def/CMP"/>
        <xsl:choose>
          <xsl:when test="@kind='object'">
            <objdef id="{$id}" type="{$def/@type}">
              <xsl:apply-templates select="metadata"/>
              <xsl:apply-templates select="CMP"/>
              <xsl:apply-templates select="commonname"/>
              <xsl:apply-templates select="$def/FMP"/>
            </objdef>
          </xsl:when>
          <xsl:when test="@kind='type'">
            <sortdef id="{$id}">
              <xsl:apply-templates select="metadata"/>
              <xsl:apply-templates select="CMP"/>
              <xsl:apply-templates select="commonname"/>
            </sortdef>
          </xsl:when>
        </xsl:choose>
      </definition>
    </xsl:when>
    <xsl:otherwise>
      <definition id="{$id}-def">
        <xsl:apply-templates select="metadata"/>
        <xsl:choose>
          <xsl:when test="@kind='object'">
            <objdef id="{$id}" type="declaration">
              <xsl:apply-templates select="commonname"/>
            </objdef>
          </xsl:when>
          <xsl:when test="@kind='type'">
            <sortdef id="{$id}">
              <xsl:apply-templates select="commonname"/>
            </sortdef>
          </xsl:when>
        </xsl:choose>
      </definition>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- we can disregard definition elements, since they have been treated 
     in the symbol case. -->
<xsl:template match="definition"/>

<xsl:template match="adt">
  <definition id="{@id}">
    <xsl:apply-templates/>
  </definition>
</xsl:template>

<xsl:template match="sortdef">
  <sortdef id="{@id}" scope="{@scope}" semantics="{../@type}">
    <xsl:apply-templates/>
  </sortdef>
</xsl:template>

<xsl:template match="constructor">
  <constructor id="{@id}" scope="{@scope}">
    <xsl:apply-templates/>
  </constructor>
</xsl:template>

<xsl:template match="selector">
  <selector id="{@id}" scope="{@scope}" total="{@total}">
    <xsl:apply-templates/>
  </selector>
</xsl:template>

<xsl:template match="alternative">
  <xsl:variable name="id" select="@id"/>
  <xsl:variable name="for" select="@for"/>
  <xsl:variable name="sym" select="../symbol[@id=$for]"/>
  <definition id="{@id}">
    <xsl:apply-templates select="metadata"/>
    <xsl:apply-templates select="CMP"/>
    <entails definition="{@entails}" just-by="{@entails-thm}"/>
    <entailed-by definition="{@entailed-by}" just-by="{@entailed-by-thm}"/>
    <xsl:choose>
      <xsl:when test="$sym/@kind='object'">
        <objdef id="{$id}" type="{@type}">
          <xsl:apply-templates select="$sym/metadata"/>
          <xsl:apply-templates select="$sym/CMP"/>
          <xsl:apply-templates select="$sym/commonname"/>
          <xsl:apply-templates select="*[local-name()!='metadata' and local-name()!='CMP']"/>
        </objdef>
      </xsl:when>
      <xsl:when test="$sym/@kind='type'">
        <sortdef id="{$id}">
          <xsl:apply-templates select="$sym/metadata"/>
          <xsl:apply-templates select="$sym/CMP"/>
          <xsl:apply-templates select="$sym/commonname"/>
          <xsl:apply-templates select="*[local-name()!='metadata' and local-name()!='CMP']"/>
        </sortdef>
      </xsl:when>
    </xsl:choose>
  </definition>
</xsl:template>

<xsl:template match="alternative/requation|definition/requation">
  <rule>
    <OMOBJ>
      <xsl:apply-templates select="pattern"/>
    </OMOBJ>
    <OMOBJ>
      <xsl:apply-templates select="value"/>
    </OMOBJ>
  </rule>
</xsl:template>

<xsl:template match="morphism/requation">
 <mapsto>
  <OMOBJ>
   <xsl:apply-templates select="pattern"/>
  </OMOBJ>
  <xsl:for-each select="value/OMA/*[position() &gt; 1]">
   <OMOBJ>
    <xsl:apply-templates select="."/>
   </OMOBJ>
  </xsl:for-each>
 </mapsto>
</xsl:template>

<xsl:template match="private">
  <xsl:copy>
    <xsl:copy-of select="@*[local-name()!='width' and 
                            local-name()!='height' and 
                            local-name()!='classid' and 
                            local-name()!='codebase' and 
                            local-name()!='pto' and 
                            local-name()!='pto-version']"/>
    <xsl:apply-templates select="metadata"/>
    <xsl:if test="@pto">
      <pto>
        <xsl:variable name="versions" select="saxon:tokenize(@pto-version)"/>
        <xsl:for-each select="versions">
          <version string="{.}"/>
        </xsl:for-each>
      </pto>
    </xsl:if>
  </xsl:copy>
</xsl:template>

<xsl:template match="code">
  <xsl:copy>
    <xsl:copy-of select="@*[local-name()!='width' and 
                            local-name()!='height' and 
                            local-name()!='pto' and 
                            local-name()!='pto-version']"/>
    <xsl:apply-templates select="metadata"/>
    <xsl:if test="@pto">
      <pto>
        <xsl:variable name="versions" select="saxon:tokenize(@pto-version)"/>
        <xsl:for-each select="versions">
          <version string="{.}"/>
        </xsl:for-each>
      </pto>
    </xsl:if>
  </xsl:copy>
</xsl:template>

<xsl:template match="omlet">
  <xsl:variable name="id" select="@id"/>
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:if test="/../private[@for=$id]">
      <xsl:variable name="widths" select="/../private[@for=$id]/@width"/>
      <xsl:variable name="heights" select="/../private[@for=$id]/@height"/>
      <xsl:choose>
        <xsl:when test="count($widths)>1">
          <xsl:message>
            multiple width declarations for omlet <xsl:value-of select="@id"/>,
            taking the first one!
          </xsl:message>
          <xsl:attribute name="width">
            <xsl:value-of select="$widths[position()=1]"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="count($widths)=1">
          <xsl:attribute name="width">
            <xsl:value-of select="$widths[position()=1]"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:choose>
        <xsl:when test="count($heights)>1">
          <xsl:message>
            multiple height declarations for omlet <xsl:value-of select="@id"/>,
            taking the first one!
          </xsl:message>
          <xsl:attribute name="height">
            <xsl:value-of select="$heights[position()=1]"/>
          </xsl:attribute>
        </xsl:when>
        <xsl:when test="count($heights)=1">
          <xsl:attribute name="height">
            <xsl:value-of select="$heights[position()=1]"/>
          </xsl:attribute>
        </xsl:when>
      </xsl:choose>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>


<!-- put the CMP children in a theory into an omtext -->
<xsl:template match="theory">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <!-- first copy the metadata and the commonnames -->
    <xsl:apply-templates select="metadata"/>
    <xsl:apply-templates select="commonname"/>
    <!-- then come the CMPs we want to deal with -->
    <omtext id="generate-id()" type="introduction">
     <xsl:apply-templates select="CMP"/>
    </omtext>
    <!-- then copy the rest of the children -->
    <xsl:apply-templates select="*[local-name()!='metadata' and 
                                   local-name()!='commonname' and 
                                   local-name()!='CMP']"/>
    </xsl:copy>
</xsl:template>

</xsl:stylesheet>
<!-- todo: 
     - merge the metadata of symbol and definition in some intelligent way
     - move the width and height attributes from 'code' and 'private' to 'omlet' 
  -->
