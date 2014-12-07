<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: ext.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/ext.xsl $
     Comments are welcome! (send mail to users@omdoc.org or developers@omdoc.org)
     See the documentation and examples at http://omdoc.org

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
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:omdoc="http://www.mathweb.org/omdoc"
 version="1.0">  

<xsl:template match="omdoc:omlet[@type='link']">
  <xsl:text>{\ref{</xsl:text>
  <xsl:apply-templates/>
  <xsl:text>}}</xsl:text>
</xsl:template>

<xsl:template match="omdoc:omlet[@type='figure']">
  <xsl:variable name="uriref" select="@data"/>
  <xsl:apply-templates select="omdoc:get-uriref($uriref)" mode="show-figure"/>
</xsl:template>

<xsl:template match="omdoc:omlet[@type='code']">
  <xsl:variable name="uriref" select="@data"/>
  <xsl:apply-templates select="omdoc:get-uriref($uriref)"/>
</xsl:template>

<xsl:template match="omdoc:code">
  <xsl:param name="prefix"/>
  <xsl:text>\begin{center}\begin{tabular}{|l|l|}\hline&#xA;</xsl:text>
  <xsl:text disable-output-escaping="yes">Code snippet &amp;</xsl:text>
  <xsl:text>{\tt{</xsl:text><xsl:value-of select="@xml:id"/><xsl:text>}}\\\hline&#xA;</xsl:text>
  <xsl:if test="omdoc:metadata/dc:description">
    <xsl:text disable-output-escaping="yes">Description &amp;</xsl:text>
    <xsl:apply-templates select="omdoc:metadata/dc:description">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>\\\hline&#xA;</xsl:text>
  </xsl:if>
  <xsl:if test="omdoc:input">
    <xsl:text disable-output-escaping="yes">Input &amp;</xsl:text>
    <xsl:apply-templates select="omdoc:input">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>\\\hline&#xA;</xsl:text>
  </xsl:if>
  <xsl:if test="omdoc:output">
    <xsl:text disable-output-escaping="yes">Output &amp;</xsl:text>
    <xsl:apply-templates select="omdoc:output">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>\\\hline&#xA;</xsl:text>
  </xsl:if>
  <xsl:if test="omdoc:effect">
    <xsl:text disable-output-escaping="yes">Effect &amp;</xsl:text>
    <xsl:apply-templates select="omdoc:output">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>\\\hline&#xA;</xsl:text>
  </xsl:if>
  <xsl:text>\hline&#xA;</xsl:text>
  <xsl:for-each select="omdoc:data">
    <xsl:text>\setbox0=\hbox{}&#xA;</xsl:text>
    <xsl:choose>
      <xsl:when test="@format">
        <xsl:text>{\tt{</xsl:text><xsl:value-of select="@format"/><xsl:text>}}</xsl:text>
      </xsl:when>
      <xsl:otherwise><xsl:text>not supplied</xsl:text></xsl:otherwise>
    </xsl:choose>
    <xsl:text disable-output-escaping="yes">&amp;</xsl:text>
    <xsl:text>\begin{minipage}{8cm}\scriptsize&#xA;\begin{verbatim}</xsl:text>
    <xsl:apply-templates select=".">
      <xsl:with-param name="prefix" select="$prefix"/>
    </xsl:apply-templates>
    <xsl:text>\end{verbatim}&#xA;\end{minipage}</xsl:text>
    <xsl:text>\\\hline&#xA;</xsl:text>
  </xsl:for-each>
  <xsl:text>\end{tabular}\end{center}</xsl:text>
</xsl:template>

<xsl:template match="omdoc:private" mode="show-figure">
 \begin{figure}
 \begin{center}
 <xsl:choose>
  <xsl:when test="omdoc:data[@format='application/postscript']">
   <xsl:text>\includegraphics{</xsl:text>
   <xsl:value-of select="omdoc:data[@format = 'application/postscript']/@href"/>
   <xsl:text>}&#xA;</xsl:text>
  </xsl:when>
  <xsl:when test="omdoc:data[@format='image/jpg']">
   <xsl:text>\includegraphics{</xsl:text>
   <xsl:value-of select="omdoc:data[@format = 'image/jpg']/@href"/>
   <xsl:text>}&#xA;</xsl:text>
  </xsl:when>
  <xsl:when test="omdoc:data[@format='image/gif']">
   <xsl:text>\includegraphics{</xsl:text>
   <xsl:value-of select="omdoc:data[@format = 'image/gif']/@href"/>
   <xsl:text>}&#xA;</xsl:text>
  </xsl:when>
  <xsl:when test="omdoc:data[@format='application/pdf']">
   <xsl:text>\includegraphics{</xsl:text>
   <xsl:value-of select="omdoc:data[@format = 'application/pdf']/@href"/>
   <xsl:text>}&#xA;</xsl:text>
  </xsl:when>
  <xsl:when test="omdoc:data[@format='application/omdoc+xml']">
    <xsl:variable name="uriref" select="omdoc:data[@format = 'application/omdoc+xml']/@href"/>
    <xsl:text>\begin{small}&#xA;</xsl:text>
    <xsl:text>\begin{verbatim}</xsl:text>
      <xsl:apply-templates 
       select="omdoc:get-uriref(omdoc:data[@format = 'application/omdoc+xml']/@href)"
       mode="verbatimcopy"/>
      <xsl:text>\end{verbatim}&#xA;</xsl:text>
      <xsl:text>\end{small}&#xA;</xsl:text>
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="warning">
      <xsl:with-param name="string" select="'Data not suitable for inclusion as a figure!'"/>
    </xsl:call-template>
  </xsl:otherwise>
 </xsl:choose>
 <xsl:if test="omdoc:metadata/dc:title">
  <xsl:text>\caption{</xsl:text>
  <xsl:value-of select="omdoc:metadata/dc:title"/>
  <xsl:text>}\label{</xsl:text>
  <xsl:value-of select="@xml:id"/>
  <xsl:text>}&#xA;</xsl:text>
 </xsl:if>
 <xsl:text>\end{center}&#xA;\end{figure}&#xA;</xsl:text>
</xsl:template>

</xsl:stylesheet>
