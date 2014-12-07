<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: compatibility.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/compatibility.xsl $
     send bug-reports, patches, suggestions to users@omdoc.org

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

<xsl:template match="omdoc:omgroup[@type='labeled-dataset']">
 <xsl:param name="level"/>
 <xsl:param name="prefix"/>
 <xsl:text>&#xA;</xsl:text>
 <p>
   <xsl:choose>
     <xsl:when test="parent::node()[@type='itemize'] or parent::node()[@type='enumeration'] or parent::node()[@type='sequence']">
       <table align="char" border="1" cellspacing="1" cellpadding="1">
         <xsl:apply-templates select="*[not(self::omdoc:metadata)]" mode="table"/>
       </table>
     </xsl:when>
     <xsl:otherwise>
       <table align="center" border="1" cellspacing="1" cellpadding="1">
         <xsl:apply-templates select="*[not(self::omdoc:metadata)]" mode="table"/>
       </table>
     </xsl:otherwise>
   </xsl:choose>
   <xsl:if test="omdoc:metadata/dc:title and omdoc:metadata/dc:title!='(No title specified)'">
     <th><xsl:apply-templates select="omdoc:metadata/dc:title"/></th> 
   </xsl:if>
 </p>
</xsl:template>

<xsl:template match="omdoc:omgroup[@type='dataset']" mode="table">
  <tr>
    <xsl:for-each select="omdoc:omgroup[@type='dataset']">
      <td>
        <!--        <xsl:value-of select="child::node()"/> -->
        <xsl:apply-templates select="child::node()"/>
      </td>
    </xsl:for-each>
  </tr>
</xsl:template>

</xsl:stylesheet>



