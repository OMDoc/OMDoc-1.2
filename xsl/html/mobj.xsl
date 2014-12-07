<?xml version="1.0" encoding="iso-8859-1"?>
<!-- An XSL style sheet for creating html from OMDoc (Open Mathematical Documents). 
     $Id: mobj.xsl 8024 2008-09-09 16:51:59Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/html/mobj.xsl $
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

<xsl:stylesheet   xmlns="http://www.w3.org/1999/xhtml" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:om="http://www.openmath.org/OpenMath"
   xmlns:omdoc="http://www.mathweb.org/omdoc"
   xmlns:m="http://www.w3.org/1998/Math/MathML"
   exclude-result-prefixes="om omdoc m"
   version="1.0">  

 <xsl:template match="omdoc:legacy">
   <span class="legacy"><xsl:apply-templates mode="verbatimcopy-escaped"/></span>
 </xsl:template>

 <xsl:template match="om:OMSTR[not(@xref)]"><tt><xsl:apply-templates/></tt></xsl:template>

<xsl:template match="m:math">
  <span style="color:red">[MathML]</span>
</xsl:template>

</xsl:stylesheet>



