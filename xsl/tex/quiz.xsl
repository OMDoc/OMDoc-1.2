<?xml version="1.0" encoding="iso-8859-1"?>
<!-- This stylesheets transforms OmDoc into LaTeX input
     Initial Version: Michael Kohlhase 1999-09-07
     $Id: quiz.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/tex/quiz.xsl $
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
 xmlns:omdoc="http://www.mathweb.org/omdoc"
 version="1.0">  

<xsl:template name="with-mcgroup">
  <xsl:param name="content"/>
  <xsl:param name="prefix"/>
  <xsl:text>&#xA;\begin{center}&#xA;\begin{tabular}{|l|l|l|l|}\hline&#xA;</xsl:text>
  <xsl:text disable-output-escaping="yes">Choice &amp; Hint &amp; Answer &amp; Verdict\\\hline\hline</xsl:text>
  <xsl:copy-of select="$content"/>
  <xsl:text>&#xA;\end{tabular}&#xA;\end{center}&#xA;</xsl:text>
</xsl:template>

<xsl:template match="omdoc:mc">
  <xsl:param name="prefix"/>
  <xsl:text>&#xA;</xsl:text>
  <xsl:apply-templates select="omdoc:choice/omdoc:CMP">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text disable-output-escaping="yes"> &amp; </xsl:text>
  <xsl:apply-templates select="omdoc:hint/omdoc:CMP">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text disable-output-escaping="yes"> &amp; </xsl:text>
  <xsl:apply-templates select="omdoc:answer/omdoc:CMP">
    <xsl:with-param name="prefix" select="$prefix"/>
  </xsl:apply-templates>
  <xsl:text disable-output-escaping="yes"> &amp; </xsl:text>
  <xsl:value-of select="omdoc:answer/@verdict"/>
  <xsl:text>\\\hline</xsl:text>
</xsl:template>


</xsl:stylesheet>
