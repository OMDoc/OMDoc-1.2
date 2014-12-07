<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: quiz.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/quiz.xsl $
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
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns="http://www.w3.org/1999/xhtml" 
  exclude-result-prefixes="omdoc"
  version="1.0">  

<xsl:template match="omdoc:mc">
  <xsl:param name="prefix"/>
  <tr>
    <td>
      <xsl:apply-templates select="omdoc:choice/omdoc:CMP">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="@xml:id"/>
      </xsl:apply-templates>
    </td>
    <td>
      <xsl:apply-templates select="omdoc:hint/omdoc:CMP">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="@xml:id"/>
      </xsl:apply-templates>
    </td>
    <td>
      <xsl:apply-templates select="omdoc:answer/omdoc:CMP">
        <xsl:with-param name="prefix" select="$prefix"/>
        <xsl:with-param name="indexprefix" select="@xml:id"/>
      </xsl:apply-templates>
    </td>
    <td><xsl:value-of select="omdoc:answer/@verdict"/></td>
  </tr>
</xsl:template>

<xsl:template name="with-mcgroup">
  <xsl:param name="prefix"/>
  <xsl:param name="content"/>
  <table border="1">
    <tr><td>Choice</td><td>Hint</td><td>Answer</td><td>Verdict</td></tr>
    <xsl:copy-of select="$content"/>
  </table>
</xsl:template>

</xsl:stylesheet>



