<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: mobj.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/pmml/mobj.xsl $
     send bug-reports, patches, suggestions to developers@omdoc.org 

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
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  xmlns:m="http://www.w3.org/1998/Math/MathML"
  xmlns:exsl="http://exslt.org/common" 
  extension-element-prefixes="exsl"
  exclude-result-prefixes="om omdoc m xlink exsl"
  version="1.0">  

<xsl:template match="omdoc:legacy">
  <span xmlns="http://www.w3.org/1999/xhtml" class="legacy">
    <xsl:apply-templates mode="verbatimcopy-escaped"/>
  </span>
</xsl:template>


<!-- this is all we need to do to enable David Carlisle's ctop.xsl -->
<xsl:template match="m:*" priority="-1">
  <xsl:apply-templates select="." mode="c2p"/>
</xsl:template>

<xsl:template match="om:OMOBJ[not(@xref)]|m:math">
  <xsl:param name="prefix"/>
  <math id="{concat('MCR',$prefix,generate-id())}" xmlns="http://www.w3.org/1998/Math/MathML">
    <semantics xmlns="http://www.w3.org/1998/Math/MathML">
      <xsl:apply-templates>
	<xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
      <annotation-xml encoding="OpenMath" xmlns="http://www.w3.org/1998/Math/MathML">
	<xsl:apply-templates  select="." mode="withpref">
	  <xsl:with-param name="prefix" select="$prefix"/>
	</xsl:apply-templates>
      </annotation-xml>
    </semantics>
  </math>
</xsl:template>

<xsl:template match="om:OMS" mode="withpref">
  <xsl:param name="prefix"/>
  <OMS xmlns="http://www.openmath.org/OpenMath" cd="{@cd}" name="{@name}" 
       xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple"/>
</xsl:template>

<xsl:template match="csymbol" mode="withpref">
  <xsl:param name="prefix"/>
  <csymbol xmlns="http://www.w3.org/1998/Math/MathML"
    definitionURL="{@definitionURL}" xlink:href="{concat('MCR',$prefix,generate-id())}"/>
</xsl:template>

<xsl:template match="om:OMV" mode="withpref">
  <xsl:param name="prefix"/>
  <OMV xmlns="http://www.openmath.org/OpenMath" name="{@name}" 
       xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple"/>
</xsl:template>

<xsl:template match="ci" mode="withpref">
  <xsl:param name="prefix"/>
  <ci xmlns="http://www.w3.org/1998/Math/MathML" 
      xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:copy-of select="@*"/>
    <xsl:copy-of select="*"/>
  </ci>
</xsl:template>

<xsl:template match="om:OMA" mode="withpref">
  <xsl:param name="prefix"/>
  <OMA xmlns="http://www.openmath.org/OpenMath" 
       xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OMA>
</xsl:template>

<xsl:template match="apply" mode="withpref">
  <xsl:param name="prefix"/>
  <apply xmlns="http://www.w3.org/1998/Math/MathML" 
         xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </apply>
</xsl:template>

<xsl:template match="om:OMOBJ" mode="withpref">
  <xsl:param name="prefix"/>
  <OMOBJ xmlns="http://www.openmath.org/OpenMath" 
	 xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OMOBJ>
</xsl:template>

<xsl:template match="math" mode="withpref">
  <xsl:param name="prefix"/>
  <math xmlns="http://www.w3.org/1998/Math/MathML" 
        xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </math>
</xsl:template>

<xsl:template match="semantics" mode="withpref">
  <xsl:param name="prefix"/>
    <xsl:apply-templates select="*[1]" mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
</xsl:template>


<xsl:template match="om:OMBIND" mode="withpref">
  <xsl:param name="prefix"/>
  <OMBIND xmlns="http://www.openmath.org/OpenMath" 
	  xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OMBIND>
</xsl:template>

<xsl:template match="om:OMBVAR" mode="withpref">
  <xsl:param name="prefix"/>
  <OMBVAR xmlns="http://www.openmath.org/OpenMath" 
	  xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OMBVAR>
</xsl:template>

<xsl:template match="bvar" mode="withpref">
  <xsl:param name="prefix"/>
  <bvar xmlns="http://www.w3.org/1998/Math/MathML" 
        xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </bvar>
</xsl:template>

<xsl:template match="om:OME" mode="withpref">
  <xsl:param name="prefix"/>
  <OME xmlns="http://www.openmath.org/OpenMath" 
       xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OME>
</xsl:template>

<xsl:template match="om:OMATTR" mode="withpref">
  <xsl:param name="prefix"/>
  <OMATTR xmlns="http://www.openmath.org/OpenMath" 
	  xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OMATTR>
</xsl:template>

<xsl:template match="om:OMDATA" mode="withpref">
  <xsl:param name="prefix"/>
  <OMDATA xmlns="http://www.openmath.org/OpenMath" 
	  xlink:href="{concat('MCR',$prefix,generate-id())}" xlink:type="simple">
    <xsl:copy-of select="@*|*|text()"/>
  </OMDATA>
</xsl:template>

<xsl:template match="om:OMATP" mode="withpref">
  <xsl:param name="prefix"/>
  <OMATP xmlns="http://www.openmath.org/OpenMath" 
	 xlink:type="simple" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates mode="withpref">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
  </OMATP>
</xsl:template>

<xsl:template match="om:OMI" mode="withpref">
  <xsl:param name="prefix"/>
  <OMI xmlns="http://www.openmath.org/OpenMath" xlink:type="simple" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates/>
  </OMI>
</xsl:template>

<xsl:template match="cn" mode="withpref">
  <xsl:param name="prefix"/>
  <cn xmlns="http://www.w3.org/1998/Math/MathML" 
      xlink:type="simple" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:copy-of select="@*"/>
    <xsl:copy-of select="*"/>
  </cn>
</xsl:template>

<xsl:template match="om:OMB" mode="withpref">
  <xsl:param name="prefix"/>
  <OMB xmlns="http://www.openmath.org/OpenMath" xlink:type="simple" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates/>
  </OMB>
</xsl:template>

<xsl:template match="om:OMF" mode="withpref">
  <xsl:param name="prefix"/>
  <OMF xmlns="http://www.openmath.org/OpenMath" xlink:type="simple" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:if test="@dec"><xsl:copy-of select="@dec"/></xsl:if>
    <xsl:if test="@hex"><xsl:copy-of select="@hex"/></xsl:if>
  </OMF>
</xsl:template>

<xsl:template match="om:OMSTR" mode="withpref">
  <xsl:param name="prefix"/>
  <OMSTR xmlns="http://www.openmath.org/OpenMath" 
         xlink:type="simple" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates/>
  </OMSTR>
</xsl:template>

<xsl:template match="mtext" mode="withpref">
  <xsl:param name="prefix"/>
  <mtext xmlns="http://www.w3.org/1998/Math/MathML" xlink:href="{concat('MCR',$prefix,generate-id())}">
    <xsl:copy-of select="@*"/>
    <xsl:copy-of select="*"/>
  </mtext>
</xsl:template>

<xsl:template match="om:OMA[@xref]|om:OMBIND[@xref]|om:OMBVAR[@xref]|om:OMATTR[@xref]" mode="withpref">
  <xsl:param name="prefix"/>
  <xsl:variable name="ref" select="@xref"/>
  <xsl:apply-templates select="id($ref)" mode="withpref">
    <xsl:with-param name="prefix" select="concat($prefix,generate-id())"/>
  </xsl:apply-templates>
</xsl:template>

<xsl:template match="om:OMA[not(@xref)]" mode="fallback">
  <xsl:param name="prefix"/>
  <!-- <xsl:message>CREATING IN FALLBACK MODE: <xsl:value-of select="concat(*[1]/@cd, '#', *[1]/@name)"/></xsl:message> -->
  <mrow id="{concat('MCR',$prefix,generate-id())}" xmlns="http://www.w3.org/1998/Math/MathML">
    <xsl:apply-templates select="*[1]">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <mrow xmlns="http://www.w3.org/1998/Math/MathML">
      <mo xmlns="http://www.w3.org/1998/Math/MathML" fence="true">(</mo>
      <mrow xmlns="http://www.w3.org/1998/Math/MathML">
        <xsl:for-each select="*[position()!=1]">
          <xsl:apply-templates select=".">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
          <xsl:if test="position()!=last()">
            <mo xmlns="http://www.w3.org/1998/Math/MathML" separator="true">,</mo>
	  </xsl:if>
        </xsl:for-each>
      </mrow>
      <mo xmlns="http://www.w3.org/1998/Math/MathML" fence="true">)</mo>
    </mrow>
  </mrow>
</xsl:template>

<xsl:template match="om:OMBIND[not(@xref)]" mode="fallback">
  <xsl:param name="prefix"/>
  <mrow id="{concat('MCR',$prefix,generate-id())}" xmlns="http://www.w3.org/1998/Math/MathML">
    <xsl:for-each select="*">
      <xsl:apply-templates select=".">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </xsl:for-each>
  </mrow>
</xsl:template>

<!-- *** this is not optimal yet *** -->
<xsl:template match="om:OMATTR[not(@xref) and om:OMATP[om:OMS[@cd='notation' and @name='pmml']]]">
  <xsl:copy-of select="om:OMATP/om:OMS[@cd='notation' and @name='pmml']/following-sibling::node()[1]"/>
</xsl:template>

<xsl:template match="om:OMBVAR">
  <xsl:param name="prefix"/>
  <mrow id="{concat('MCR',$prefix,generate-id())}" xmlns="http://www.w3.org/1998/Math/MathML">
    <xsl:for-each select="*">
      <xsl:apply-templates select=".">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
      <xsl:if test="not(position()=last())"><mo separator="true">,</mo></xsl:if>
    </xsl:for-each>
  </mrow>
</xsl:template>

<xsl:template match="om:OMSTR[not(@xref)]">
  <xsl:param name="prefix"/>
  <mtext  xmlns="http://www.w3.org/1998/Math/MathML" id="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates/>
  </mtext> 
</xsl:template>


<xsl:template match="om:OMI[not(@xref)]">
  <xsl:param name="prefix"/>
  <mn xmlns="http://www.w3.org/1998/Math/MathML" id="{concat('MCR',$prefix,generate-id())}">
    <xsl:apply-templates/>
  </mn>
</xsl:template>

<xsl:template match="om:OMF[not(@xref)]">
  <xsl:param name="prefix"/>
  <mn xmlns="http://www.w3.org/1998/Math/MathML" id="{concat('MCR',$prefix,generate-id())}">
    <xsl:choose>
      <xsl:when test="@dec"><xsl:value-of select="@dec"/></xsl:when>
      <xsl:when test="@hex"><xsl:value-of select="@hex"/></xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="warning">
          <xsl:with-param name="string"
            select="'Must have xref, dec, or hex attribute to present an OMF'"/>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </mn>
</xsl:template>

<xsl:template match="om:OME">
  <xsl:param name="prefix"/>
  <mrow xmlns="http://www.w3.org/1998/Math/MathML"
    style="color:red" id="{concat('MCR',$prefix,generate-id())}">
    <mo xmlns="http://www.w3.org/1998/Math/MathML">OM Error</mo>
    <mrow xmlns="http://www.w3.org/1998/Math/MathML">
      <mo xmlns="http://www.w3.org/1998/Math/MathML" fence="true">(</mo>
      <xsl:apply-templates select="*[1]"/>
      <mo  xmlns="http://www.w3.org/1998/Math/MathML" fence="true">)</mo>
    </mrow>
  </mrow>
  <xsl:call-template name="warning">
    <xsl:with-param name="string" select="'Not formatting OM Error element'"/>
  </xsl:call-template>
</xsl:template>

</xsl:stylesheet>



