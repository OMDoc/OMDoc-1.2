<?xml version="1.0" encoding="utf-8"?>
<!-- Utilities for OMDoc XSL style sheets. 
     $Id: uri.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/util/uri.xsl $
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
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  extension-element-prefixes="func"
 version="1.0">  

<!-- this function constructs the effective URI. If the in the uri first argument
     is relative, we prefix it with the second argument, 
     if it is absolute, we take it as it is. -->
<func:function name="omdoc:effective-uri">
  <xsl:param name="uri"/>
  <xsl:param name="prefix"/>
  <xsl:choose>
    <xsl:when test="contains($uri,'://')"><func:result select="$uri"/></xsl:when>
    <xsl:otherwise><func:result select="concat($prefix,$uri)"/></xsl:otherwise>
  </xsl:choose>
</func:function>

<!-- this function computes an URIref for cross-referencing given 
     - the URI of the OMDoc document that contains the definition
     - the id of the symbol in question
     - file extension of the format generated from the OMDoc -->
<func:function name="omdoc:crossref">
  <xsl:param name="uri"/>
  <xsl:param name="id"/>
  <xsl:param name="ext"/>
  <xsl:choose>
    <xsl:when test="not($ext)"><func:result select="''"/></xsl:when>
    <xsl:when test="$uri='' or starts-with($uri,'#')">
      <func:result select="concat('#',$id)"/>
    </xsl:when>
    <xsl:otherwise>
      <func:result select="concat(substring-before($uri,'.omdoc'),'.',$ext,'#',$id)"/>
    </xsl:otherwise>
  </xsl:choose>
</func:function>

<!-- this function takes an OMDoc (relative) URI Reference as input and 
     gives back the nodeset referenced by this URI Reference. Note that 
     whole documents must be referenced by the xml:id of the omdoc root
     element. -->
<func:function name="omdoc:get-uriref">
  <xsl:param name="uriref"/>
  <func:result select="document($uriref,.)"/>
</func:function>


<!-- this function takes an OMDoc (relative) URI Reference as input and 
     returns true, iff it is local to the document -->
<func:function name="omdoc:local-uri">
  <xsl:param name="uriref"/>
  <xsl:choose>
    <xsl:when test="substring-before($uriref,'#')=''">
      <func:result select="'true'"/>
    </xsl:when>
    <xsl:otherwise><func:result select="'false'"/></xsl:otherwise>
  </xsl:choose>
</func:function>

<!-- this function strips off the path prefix and only leaves the file name -->
<func:function name="omdoc:strip-prefix">
  <xsl:param name="uri"/>
  <xsl:choose>
    <xsl:when test="contains($uri,'/')">
      <func:result select="omdoc:strip-prefix(substring-after($uri,'/'))"/>
    </xsl:when>
    <xsl:otherwise>
      <func:result select="$uri"/>
    </xsl:otherwise>
  </xsl:choose>
</func:function>

</xsl:stylesheet>



