<!-- An XSL style sheet for creating OMDoc from OpenMath Content Dictionaries
     Initial version 2000-05-18 by Michael Kohlhase 
     send bug-reports, patches, suggestions to users@omdoc.org or developers@omdoc.org
     Copyright (c) 2000 - 2002 Michael Kohlhase, 

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
-->
 
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:saxon="http://icl.com/saxon" 
  extension-element-prefixes="saxon"
  xmlns:om="http//www.openmath.org/OpenMath"
  xmlns:cd="http://www.openmath.org/OpenMathCD">
  <!-- somewhat dangerous: we output in blank namespace which will be corrected
     by DTD... -->

<!-- The parameter is the omdoc file that material should be copied from -->
<xsl:param name="update-from"/>
<xsl:strip-space elements="*" /> 

<xsl:output method="xml"
  version="1.0"
  indent="yes"
  cdata-section-elements="use"/>

<xsl:variable name="stsname">../sts/<xsl:value-of select="/cd:CD/cd:CDName"/>.sts</xsl:variable>
<xsl:variable name="stsfile" select="translate($stsname,'&#x9;&#x20;','')"/>
<xsl:variable name="sts" select="document($stsfile,.)/cd:CDSignatures"/>
<xsl:variable name="update" select="document($update-from)/omdoc"/>

<!-- the default behavior is that everything (for instance OMOBJects)
     are copied verbatim. This is overridden later by the other rules
  -->

<xsl:template match="*">
  <xsl:copy-of select="."/>
</xsl:template>


<xsl:template match="/">
  <xsl:text>&#xA;&#xA;</xsl:text>
  <xsl:variable name="cdname" select="cd:CD/cd:CDName"/>
  <xsl:variable name="ncdname" select="translate($cdname,'&#x20;&#x9;','')"/>
  <xsl:comment>
    <xsl:text> This OMDoc file  is automatically generated from the OpenMath Content 
     Dictionary "</xsl:text> 
    <xsl:value-of select="$ncdname"/>
    <xsl:text>.ocd",  version </xsl:text>
    <xsl:value-of select="cd:CD/cd:CDVersion"/> 
    <xsl:text>&#xA;     available at </xsl:text>
    <xsl:value-of select="cd:CD/cd:CDURL"/>
    <xsl:text>,&#xA;     DO NOT EDIT!&#xA;</xsl:text>
    </xsl:comment>
    <xsl:text>&#xA;&#xA;</xsl:text>
  <saxon:doctype xsl:extension-element-prefixes="saxon"
    xmlns:dtd="http://icl.com/saxon/dtd" xsl:exclude-result-prefixes="dtd">
    <dtd:doctype name="omdoc" system="../dtd/omdoc.dtd">
      <!-- <dtd:entity name="presdtd" parameter="yes" system="pres.dtd"/>
      <xsl:text>%presdtd;</xsl:text> -->
    </dtd:doctype>
  </saxon:doctype>
<xsl:apply-templates/></xsl:template>


<xsl:template match="cd:CD">
  <xsl:variable name="cdname" select="cd:CDName"/>
  <xsl:variable name="ncdname" select="translate($cdname,'&#x20;&#x9;','')"/>
  <xsl:text>&#xA;&#xA;</xsl:text>
  <omdoc xml:id="{$ncdname}-omdoc" catalogue="catalogue.omdoc">
    <xsl:text>&#xA;</xsl:text>
    <metadata>
      <Title>
        <xsl:text>The OpenMath Content Dictionary </xsl:text>
        <xsl:value-of select="$ncdname"/>
        <xsl:text>.ocd  in OMDoc form</xsl:text>
      </Title>
      <Creator role="trl"><xsl:text>cd2omdoc</xsl:text></Creator>
      <Creator role="aut"><xsl:text>The OpenMath Society</xsl:text></Creator>
      <Date><xsl:value-of select="cd:CDReviewDate"/></Date>
      <Description><xsl:value-of select="cd:Description"/></Description>
    </metadata>
    <xsl:text>&#xA;</xsl:text>
    <theory xml:id="{$ncdname}">
      <xsl:text>&#xA;</xsl:text>
      <xsl:apply-templates/>
    </theory>
  </omdoc>
  <xsl:text>&#xA;</xsl:text>
</xsl:template>

<xsl:template match="cd:CDUses|cd:CDName|cd:CDURL|cd:CDReviewDate|cd:CDStatus|cd:CDDate|cd:CDVersion|cd:Description|cd:CDRevision"/>

<xsl:template match="cd:Name|cd:Role"/>

<xsl:template match="cd:CDDefinition">
  <xsl:variable name="id" select="cd:Name"/>
  <xsl:variable name="nid" select="translate($id,'&#x9;&#x20;','')"/>
  <symbol xml:id="{$nid}" kind="object" scope="global">
    <CMP><xsl:value-of select="Description"/></CMP>
    <xsl:if test="$update/theory/symbol[@name=$nid]/cd:CMP[@xml:lang!='en']">
      <xsl:copy-of select="$update/theory/symbol[@name=$nid]/cd:CMP[@xml:lang!='en']"/>
    </xsl:if>
    <commonname><xsl:value-of select="translate($nid,'_',' ')"/></commonname>
    <xsl:if test="$update/theory/symbol[@name=$nid]/commonname[@xml:lang!='en']">
      <xsl:copy-of select="$update/theory/symbol[@name=$nid]/commonname[@xml:lang!='en']"/>
    </xsl:if>
    <xsl:if test="$sts/Signature[@name=$nid]/om:OMOBJ">
      <type system="sts">
        <xsl:copy-of select="$sts/Signature[@name=$nid]/om:OMOBJ"/>
      </type>
    </xsl:if>
  </symbol>
  <xsl:if test="$update/theory/presentation[@for=$nid]">
    <xsl:copy-of select="$update/theory/presentation[@for=$nid]"/>
  </xsl:if>
  <xsl:apply-templates select="child::node()[not(self::Description) and not(self::Name)]"/>
</xsl:template>


<xsl:template match="cd:Example">
  <xsl:variable name="id" select="../cd:Name"/>
  <xsl:variable name="nid" select="translate($id,'&#x9;&#x20;','')"/>
  <xsl:variable name="num">
    <xsl:number value="position()" format="1"/>
  </xsl:variable>
  <example xml:id="{$nid}-ex-{$num}" type="for" for="{$nid}">
    <CMP><xsl:apply-templates/></CMP>
  </example>
</xsl:template>

<!-- we assume that every CMP that is followed by an FMP mean the same thing -->
<xsl:template match="cd:CDDefinition/cd:CMP">
  <xsl:variable name="id" select="../cd:Name"/>
  <xsl:variable name="nid" select="translate($id,'&#x9;&#x20;','')"/>
  <xsl:variable name="num">
    <xsl:number value="position()" format="1"/>
  </xsl:variable>
  <assertion xml:id="{$nid}-prop-{$num}" type="lemma">
    <CMP><xsl:copy-of select="*[node()]"/></CMP>
    <xsl:if test="following-sibling::cd:FMP">
      <xsl:copy-of select="following-sibling::cd:FMP[1]"/>
      <FMP><xsl:copy-of select="following-sibling::cd:FMP[1]/*[node()]"/></FMP>
    </xsl:if>
  </assertion>
</xsl:template>

<xsl:template match="cd:CDDefinition/cd:FMP">
  <xsl:variable name="id" select="../cd:Name"/>
  <xsl:variable name="nid" select="translate($id,'&#x9;&#x20;','')"/>
  <xsl:variable name="num">
    <xsl:number value="position()" format="1"/>
  </xsl:variable>
  <xsl:if test="not(preceding-sibling::cd:CMP)">
    <xsl:message>fmp</xsl:message>
    <assertion xml:id="{$nid}-prop-{$num}">
      <xsl:copy-of select="."/>
    </assertion>
  </xsl:if>
</xsl:template>


<xsl:template match="Signature"><xsl:apply-templates/></xsl:template>

<xsl:template match="cd:CDComment">
  <xsl:variable name="num"><xsl:number value="position()" format="1"/></xsl:variable>
  <omtext xml:id="CDComment-{$num}" type="introduction">
    <CMP><xsl:apply-templates/></CMP>
  </omtext>
</xsl:template>
    
</xsl:stylesheet>
