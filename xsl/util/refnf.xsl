<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: refnf.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/refnf.xsl $
     send bug-reports, patches, suggestions to developers@omdoc.org

     Copyright (c) 2003 Michael Kohlhase, 

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


<!-- this stylesheet provides a mode 'refnf' that computes the ref-normal form of
     a document, by inserting all the links. This normalization process can be
     tuned by supplying more templates for the mode refnf -->

<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.mathweb.org/omdoc"
 version="1.0">  

  <xsl:import href="uri.xsl"/>
  <xsl:output method="xml"/>

<xsl:variable name="version" select="/omdoc:omdoc/@version"/>

<!-- we first collect all of the document (including the sub-documents
     reference in the 'ref' nodes) into a variable. -->
<xsl:template match="omdoc:omdoc" mode="refnf">
  <omdoc>
    <xsl:copy-of select="/omdoc:omdoc/@*"/>
    <xsl:apply-templates select="/omdoc:omdoc/*" mode="refnf"/>
  </omdoc>
</xsl:template>

<xsl:template match="*" mode="refnf">
  <xsl:param name="id-prefix"/>
  <xsl:copy>
    <xsl:copy-of select="@*[local-name()!='id']"/>
    <xsl:if test="@xml:id">
      <xsl:attribute name="xml:id">
        <xsl:choose>
          <xsl:when test="$id-prefix!=''">
            <xsl:value-of select="concat($id-prefix,'!',@xml:id)"/>
          </xsl:when>
          <xsl:otherwise><xsl:value-of select="@xml:id"/></xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>
    </xsl:if>
    <xsl:apply-templates mode="refnf">
      <xsl:with-param name="id-prefix" select="$id-prefix"/>
    </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<!-- theories and theory-constitutive elements keep their id attribute -->
<xsl:template match="omdoc:theory|omdoc:axiom|omdoc:definition|omdoc:symbol" mode="refnf">
  <xsl:param name="id-prefix"/>
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates mode="refnf">
      <xsl:with-param name="id-prefix" select="$id-prefix"/>
    </xsl:apply-templates>
  </xsl:copy>
</xsl:template>

<xsl:template match="omdoc:ref[@type='include']" mode="refnf">
  <xsl:param name="id-prefix"/>
  <xsl:variable name="uri" select="@xref"/>
  <xsl:message>including <xsl:value-of select="$uri"/> ...</xsl:message>
  <xsl:variable name="incl" select="omdoc:get-uriref($uri)"/>
  <xsl:variable name="pfx">
    <xsl:if test="$id-prefix!=''">
      <xsl:value-of select="$id-prefix"/>
      <xsl:text>!</xsl:text>
    </xsl:if>
    <xsl:value-of select="@xml:id"/>
  </xsl:variable>
  <xsl:if test="$incl/omdoc:omdoc/@version!=$version">
    <xsl:message>Version Mismatch in imported OMDoc <xsl:value-of select="$incl/@xml:id"/>!</xsl:message>
  </xsl:if>
  <omgroup type="sectioning">
    <xsl:copy-of select="$incl/@*[local-name()!='schemaLocation' and 
                            local-name()!='version' and
                            local-name()!='catalogue' and
                            local-name()!='type']"/>
    <xsl:apply-templates select="$incl/*[local-name()!='catalogue']" mode="refnf">
      <xsl:with-param name="id-prefix" select="$pfx"/>
    </xsl:apply-templates>
  </omgroup>
</xsl:template>

<!-- for testing
<xsl:template match="/">
  <xsl:apply-templates mode="refnf"/>
</xsl:template> -->

</xsl:stylesheet>



