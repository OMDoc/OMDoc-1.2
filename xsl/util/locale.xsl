<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: locale.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/locale.xsl $
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


<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:func="http://exslt.org/functions" 
  extension-element-prefixes="func"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  version="1.0">  

<xsl:param name="locale" select="'../locale-default.xml'"/>

<xsl:template match="key/value" mode="locale">
  <xsl:if test="omdoc:valid-language()"><xsl:apply-templates mode="locale"/></xsl:if>
</xsl:template>

<xsl:variable name="loc" select="document($locale)"/>
<!-- this function looks up the value of the 'key' parameter for the given 
     $TargetLanguage-list, otherwise it gives a localized error message -->
<func:function name="omdoc:localize">
 <xsl:param name="key" select="'no-value-error'"/>
 <xsl:variable name="result">
  <xsl:apply-templates select="$loc/locale/key[@name=$key]/value" mode="locale"/>
 </xsl:variable>
 <xsl:choose>
  <xsl:when test="not($result='')">
   <func:result select="$result"/>
  </xsl:when>
  <xsl:when test="$result=''">
   <xsl:call-template name="localized-error">
    <xsl:with-param name="key" select="'no-value-error'"/>
    <xsl:with-param name="id" select="$key"/>
   </xsl:call-template>
  </xsl:when>
 </xsl:choose>
</func:function>

<xsl:template name="localized-error">
  <xsl:param name="key"/>
  <xsl:param name="id"/>
  <xsl:if test="$report-errors!='no'">
    <xsl:variable name="error_message" select="omdoc:localize($key)"/>
    <xsl:message>
      <xsl:choose>
        <xsl:when test="$error_message=''">
          <xsl:call-template name="warning">
            <xsl:with-param name="string">
              <xsl:text>Could not find the localized error message for </xsl:text>
              <xsl:value-of select="$key"/>
              <xsl:text>.&#xA;Tried languages:'</xsl:text>
              <xsl:value-of select="$TargetLanguage"/>
              <xsl:text>'.</xsl:text>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$error_message"/>
          <xsl:value-of select="$id"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:message>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>



