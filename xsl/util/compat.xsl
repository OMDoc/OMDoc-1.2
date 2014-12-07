<!-- An XSL style sheet style sheet compatibility
     Initial version 20030831 by Michael Kohlhase, 
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

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:func="http://exslt.org/functions" 
  xmlns:str="http://exslt.org/strings" 
  xmlns:saxon="http://icl.com/saxon" 
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  extension-element-prefixes="saxon str func"
  version="1.0">

<!-- it is a shame that saxon does not support str:tokenize -->
<func:function name="omdoc:tokenize">
  <xsl:param name="wslist"/>
  <xsl:param name="separator"/>
  <xsl:choose>
    <xsl:when test="function-available('saxon:tokenize')">
      <func:result select="saxon:tokenize($wslist,$separator)"/>
    </xsl:when>
    <xsl:when test="function-available('str:tokenize')">
      <func:result select="str:tokenize($wslist,$separator)"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message terminate="yes">no tokenizer available!</xsl:message>
    </xsl:otherwise>
  </xsl:choose>
</func:function>

<!-- ****************** does not work yet **************
<func:function name="omdoc:tokenize">
  <xsl:param name="wslist"/>
  <xsl:param name="separator"/>
  <xsl:choose>
    <xsl:when test="$wslist!=''">
      <xsl:variable name="first" select="substring-before($wslist,$separator)"/>
      <xsl:variable name="rest" select="substring-after($wslist,$separator)"/>
      <xsl:variable name="res">
        <token><xsl:value-of select="$first"/></token>
        <xsl:copy-of select="omdoc:tokenize($rest,$separator)"/>
      </xsl:variable>
      <func:result select="exsl:node-set($res)"/>
    </xsl:when>
    <xsl:otherwise><func:result/></xsl:otherwise>
  </xsl:choose>
</func:function> -->

</xsl:stylesheet>
