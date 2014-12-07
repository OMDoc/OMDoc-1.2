<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: ext.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/ext.xsl $
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
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="dc omdoc"
  version="1.0">  

<xsl:template match="omdoc:omlet[@action='display']">
  <xsl:param name="prefix"/>
  <span class="omlet">
    <xsl:apply-templates select="omdoc:get-uriref(@data)" mode="show-image">
      <xsl:with-param name="prefix" select="$prefix"/>
      <xsl:with-param name="style" select="@style"/>
    </xsl:apply-templates>
  </span>
</xsl:template>

<xsl:template match="omdoc:code" mode="show-image">
  <xsl:param name="prefix"/>
  <div class="code"><pre><xsl:value-of select="omdoc:data"/></pre></div>
</xsl:template>

<xsl:template match="omdoc:code" mode="show-image">
  <xsl:param name="prefix"/>
  <xsl:choose>
    <xsl:when test="omdoc:metadata/dc:description or
                    omdoc:input or omdoc:output or omdoc:effect or 
                    count(omdoc:data) &gt; 1">
  <table class="code" style="align:center">
    <xsl:if test="omdoc:metadata/dc:description">
      <tr>
        <td>Description</td>
        <td>
          <xsl:apply-templates select="omdoc:metadata/dc:description">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="omdoc:input">
      <tr>
        <td>Input</td>
        <td>
          <xsl:apply-templates select="omdoc:input">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="omdoc:output">
      <tr>
        <td>Output</td>
        <td>
          <xsl:apply-templates select="omdoc:output">
            <xsl:with-param name="prefix" select="$prefix"/>
          </xsl:apply-templates>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="omdoc:effect">
      <tr><td>Effect</td><td><xsl:apply-templates select="omdoc:output"/></td></tr>
    </xsl:if>
    <xsl:for-each select="omdoc:data">
      <tr>
        <td>
          <xsl:choose>
            <xsl:when test="@format">
              <span style="font-family:monospace"><xsl:value-of select="@format"/></span>
            </xsl:when>
            <xsl:otherwise><xsl:text>not supplied</xsl:text></xsl:otherwise>
          </xsl:choose>
        </td>
        <td>
          <pre>
            <xsl:apply-templates select=".">
              <xsl:with-param name="prefix" select="$prefix"/>
            </xsl:apply-templates>
          </pre>
        </td>
      </tr>
    </xsl:for-each>
  </table>
</xsl:when>
  <xsl:otherwise>
    <pre>
      <xsl:apply-templates select="omdoc:data">
        <xsl:with-param name="prefix" select="$prefix"/>
      </xsl:apply-templates>
    </pre>
  </xsl:otherwise>
</xsl:choose>
</xsl:template>


<xsl:template match="omdoc:data">
  <xsl:value-of select="."/>
</xsl:template>

<!-- normally do nothing -->
<xsl:template match="omdoc:private"/>
<xsl:template match="omdoc:private" mode="show-image">
  <xsl:param name="prefix"/>
  <xsl:param name="style"/>
  <div id="{@xml:id}" class="image">
    <xsl:choose>
      <xsl:when test="omdoc:data[@format='image/jpg']">
        <xsl:variable name="href" select="omdoc:data[@format='image/jpg']/@href"/>
        <img src="{$href}"><xsl:copy-of select="$style"/></img>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='image/gif']">
        <xsl:variable name="href" select="omdoc:data[@format='image/jpg']/@href"/>
       <img src="{$href}"><xsl:copy-of select="$style"/></img>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='image/png']">
       <img src="{omdoc:data[@format='image/png']/@href}"><xsl:copy-of select="$style"/></img>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='application/emz']">
       <a href="{omdoc:data[@format = 'application/emz']/@href}">EMZ(TexPoint)</a>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='application/pdf']">
       <a href="{omdoc:data[@format = 'application/pdf']/@href}">PDF</a>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='application/postscript']">
       <a href="{omdoc:data[@format = 'application/postscript']/@href}">PS</a>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='application/wmz']">
       <a href="{omdoc:data[@format = 'application/wmz']/@href}">WMZ(WindowsMetaFile)</a>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='text/html']">
       <xsl:value-of disable-output-escaping="yes" select="omdoc:data[@format = 'text/html']"/>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='application/omdoc+xml']">
       <pre>
         <xsl:apply-templates 
           select="omdoc:get-uriref(omdoc:data[@format = 'application/omdoc+xml']/@href)"
           mode="verbatimcopy-escaped"/>
       </pre>
     </xsl:when>
     <xsl:when test="omdoc:data[@format='text']">
       <pre>
         <xsl:choose>
           <xsl:when test="omdoc:data[@format='text']/@href">
             <xsl:apply-templates mode="verbatimcopy-escaped"
               select="omdoc:get-uriref(omdoc:data[@format = 'text']/@href)"/>
           </xsl:when>
           <xsl:otherwise>
             <xsl:apply-templates select="omdoc:data" mode="verbatimcopy-escaped"/>
           </xsl:otherwise>
         </xsl:choose>
       </pre>
     </xsl:when>
     <xsl:otherwise>
       <xsl:call-template name="warning">
         <xsl:with-param name="string">
           <xsl:text>Data </xsl:text>
           <xsl:value-of select="omdoc:data/@format"/>
           <xsl:text> not suitable for inclusion as an image!</xsl:text>
         </xsl:with-param>
       </xsl:call-template>
     </xsl:otherwise>
   </xsl:choose>
   <xsl:if test="omdoc:metadata/dc:title">
     <div class="caption"><xsl:value-of select="omdoc:metadata/dc:title"/></div>
   </xsl:if>
 </div>
</xsl:template>

</xsl:stylesheet>



