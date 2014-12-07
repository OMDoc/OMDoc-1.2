<!-- An XSL style sheet for creating xsl style sheets for presenting 
     OpenMath Symbols from OMDoc presentation elements.
     Initial version 20000824 by Michael Kohlhase, 
     $Id: expres.xsl 8018 2008-09-07 20:39:50Z kohlhase $
     $HeadURL: https://svn.omdoc.org/repos/omdoc/branches/omdoc-1.2/xsl/expres.xsl $
     send bug-reports, patches, suggestions to omdoc@omdoc.org

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
  xmlns:exsl="http://exslt.org/common" 
  xmlns:func="http://exslt.org/functions" 
  xmlns:set="http://exslt.org/sets" 
  xmlns:str="http://exslt.org/strings" 
  xmlns:saxon="http://icl.com/saxon" 
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:omdoc="http://www.mathweb.org/omdoc"
  xmlns:xlink="http://www.w3.org/1999/xlink"
  extension-element-prefixes="func exsl set saxon str xsl"
  exclude-result-prefixes="om omdoc func set str saxon exsl xsl"
  version="1.0">

<xsl:include href="util/error.xsl"/>
<xsl:include href="util/compat.xsl"/>
<xsl:include href="util/uri.xsl"/>
<xsl:include href="util/values.xsl"/>

<xsl:param name="debug" select="false()"/> 

<xsl:output method="xml" version="1.0" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- the top-level template prints the header of the XSL style sheet. -->

<xsl:template match="/">
  <xsl:comment>
    An XSL style sheet for presenting OpenMath Symbols used in the 
    OpenMath Document (OMDoc) <xsl:value-of select="omdoc:omdoc/@xml:id"/>.omdoc.
  
    This XSL style file is automatically generated from an OMDoc document, do not edit!
  </xsl:comment>
  <xsl:element name="xsl:stylesheet">
    <xsl:attribute name="version"><xsl:text>1.0</xsl:text></xsl:attribute>
    <xsl:attribute name="exsl:dummy">
      <xsl:text>to get the namespace right</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="xlink:dummy">
      <xsl:text>to get the namespace right</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="om:dummy">
      <xsl:text>to get the namespace right</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="omdoc:dummy">
      <xsl:text>to get the namespace right</xsl:text>
    </xsl:attribute>
    <xsl:attribute name="extension-element-prefixes">
      <xsl:text>exsl</xsl:text>
    </xsl:attribute>
    <xsl:text>&#xA;&#xA;</xsl:text>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<!-- the default action is to do nothing on OMDoc elements -->
<xsl:template match="omdoc:*"/>
<!-- except on these, which may contain 'presentation', 'omstyle', 
     or 'ref' elements, which we must take into consideration -->
<xsl:template match="omdoc:omdoc|omdoc:omgroup|omdoc:theory">
 <xsl:apply-templates/>
</xsl:template>

<!-- ref pointers are followed, if they point to external documents -->
<xsl:template match="omdoc:ref">
  <xsl:apply-templates select="omdoc:get-uriref(@xref)"/>
</xsl:template>

<!-- the template for the OMDoc presentation element produces an XSL 
     template in two parts: 
     - first it makes the pattern of the template depending on the 
       parent element, 
     - and then the body depending on fixity and brackets. 
     The parameters 'name' and 'cd' are for treating referenced presentation elements
-->
<xsl:template match="omdoc:presentation">
  <xsl:param name="name" select="substring-after(@for,'#')"/>
  <xsl:param name="cd">
    <xsl:choose>
      <xsl:when test="ancestor::omdoc:theory/@xml:id">
        <xsl:value-of select="ancestor::omdoc:theory/@xml:id"/> 
      </xsl:when>
      <!-- If this presentation is not enclosed in a theory, but if some ancestor (or itself) 
           references a theory, take that name -->
      <!-- testing for * instead of omdoc:* w.r.t extensions
	   (does not affect the semantics of transforming regular OMDoc) -->
      <xsl:when test="ancestor-or-self::*[@theory]">
	<xsl:value-of select="substring-after(ancestor-or-self::*[@theory][1]/@theory, '#')"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:call-template name="warning">
          <xsl:with-param name="string">
            <xsl:text>unable to infer theory of presentation element</xsl:text>
            <xsl:value-of select="@xml:id"/>
            <xsl:text>!</xsl:text>
          </xsl:with-param>
        </xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:param>
  <xsl:variable name="xref" select="@xref"/>
  <xsl:variable name="file" select="substring-before($xref,'#')"/>
  <xsl:variable name="id" select="substring-after($xref,'#')"/>
  <xsl:variable name="req" select="@requires"/>
  <!--  <xsl:variable name="defs" select="//omdoc:private[@xml:id=$req]/omdoc:data"/>
    <xsl:if test="$defs!=''">
      <xsl:element name="xsl:text>
        <xsl:value-of select="$defs"/>
        <xsl:text>&#xA;</xsl:text>
      </xsl:element>
  </xsl:if>-->
  <xsl:variable name="style-attrib">
    <xsl:choose>
      <xsl:when test="@style">
        <xsl:text> and @style='</xsl:text><xsl:value-of select="@style"/><xsl:text>'</xsl:text>
      </xsl:when>
      <xsl:otherwise><xsl:text> and not(@style)</xsl:text></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$xref!=''">
      <xsl:apply-templates 
        select="exsl:node-set(document($file,.)//omdoc:presentation[@xml:id=$id])">
        <xsl:with-param name="name" select="$name"/>
        <xsl:with-param name="cd" select="$cd"/>
      </xsl:apply-templates>
    </xsl:when>
    <xsl:when test="@role='applied'">
      <xsl:call-template name="make-template">
        <xsl:with-param name="pattern">
          <xsl:text>om:OMA[not(@xref) and om:OMS[position()=1 and @name='</xsl:text>
          <xsl:value-of select="$name"/>
          <xsl:text>' and @cd='</xsl:text>
          <xsl:value-of select="$cd"/>
          <xsl:text>'</xsl:text>
          <xsl:value-of select="$style-attrib"/>
          <xsl:text>]]</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="cd" select="$cd"/>
        <xsl:with-param name="name" select="$name"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@role='binding'">
      <xsl:call-template name="make-template">
        <xsl:with-param name="pattern">
          <xsl:text>om:OMBIND[not(@xref) and  om:OMS[position()=1 and @name='</xsl:text>
          <xsl:value-of select="$name"/>
          <xsl:text>' and @cd='</xsl:text>
          <xsl:value-of select="$cd"/>
          <xsl:text>'</xsl:text>
          <xsl:value-of select="$style-attrib"/>
          <xsl:text>]]</xsl:text> 
        </xsl:with-param>
        <xsl:with-param name="cd" select="$cd"/>
        <xsl:with-param name="name" select="$name"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="@role='key'">
      <xsl:variable name="pattern">
        <xsl:text>om:OMS[@name='</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>' and @cd='</xsl:text>
        <xsl:value-of select="$cd"/>
        <xsl:text>'</xsl:text>
        <xsl:value-of select="$style-attrib"/>
        <xsl:text>]</xsl:text>
      </xsl:variable>
      <!--       <xsl:message>OMATTR math: <xsl:value-of select="count(omdoc:use[omdoc:bracket-style()='math'])"/> lisp: <xsl:value-of select="count(omdoc:use[omdoc:bracket-style()='lisp'])"/></xsl:message>-->
      <!-- when there are uses for a special format, consider only these -->
      <xsl:variable name="uses-lisp" select="omdoc:use[omdoc:bracket-style()='lisp' and (not(../omdoc:use[@format!='default']) or @format!='default')]"/>
      <xsl:if test="$uses-lisp">
        <xsl:call-template name="make-template">
          <xsl:with-param name="mode" select="'around'"/>
          <xsl:with-param name="pattern" select="$pattern"/>
          <xsl:with-param name="pos" select="true()"/>
          <xsl:with-param name="cd" select="$cd"/>
          <xsl:with-param name="name" select="$name"/>
	  <xsl:with-param name="uses" select="$uses-lisp"/>
        </xsl:call-template>
      </xsl:if>
      <xsl:variable name="uses-math" select="omdoc:use[omdoc:bracket-style()='math' and (not(../omdoc:use[@format!='default']) or @format!='default')]"/>
      <xsl:if test="$uses-math">
	<xsl:call-template name="make-template">
	  <xsl:with-param name="mode" select="omdoc:fixity()"/>
	  <xsl:with-param name="pattern" select="$pattern"/>
	  <xsl:with-param name="pos" select="true()"/>
	  <xsl:with-param name="cd" select="$cd"/>
	  <xsl:with-param name="name" select="$name"/>
	  <xsl:with-param name="uses" select="$uses-math"/>
	</xsl:call-template>
      </xsl:if>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="make-template">
        <xsl:with-param name="pattern">
          <xsl:text>om:OMS[@name='</xsl:text>
          <xsl:value-of select="$name"/>
          <xsl:text>' and @cd='</xsl:text>
          <xsl:value-of select="$cd"/>
          <xsl:text>'</xsl:text>
          <xsl:value-of select="$style-attrib"/>
          <xsl:text>]</xsl:text>
        </xsl:with-param>
        <xsl:with-param name="cd" select="$cd"/>
        <xsl:with-param name="name" select="$name"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
  <xsl:text>&#xA;&#xA;</xsl:text>
</xsl:template>
 
<xsl:template name="make-template">
  <xsl:param name="mode" select="false()"/>
  <xsl:param name="pos" select="false()"/>
  <xsl:param name="cd"/>
  <xsl:param name="name"/>
  <xsl:param name="pattern" select="false()"/>
  <xsl:param name="uses" select="*"/>
  <!--   <xsl:message>make-template: uses=<xsl:value-of select="count($uses)"/></xsl:message> -->
  <xsl:element name="xsl:template">
    <xsl:attribute name="match"><xsl:value-of select="$pattern"/></xsl:attribute>
    <xsl:attribute name="priority">1</xsl:attribute>
    <xsl:if test="$mode">
      <xsl:attribute name="mode"><xsl:value-of select="$mode"/></xsl:attribute>
    </xsl:if>
    <xsl:element name="xsl:param">
      <xsl:attribute name="name"><xsl:text>prec</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>1000</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:param">
      <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:if test="$mode='around'">
      <xsl:element name="xsl:param">
        <xsl:attribute name="name"><xsl:text>content</xsl:text></xsl:attribute>
      </xsl:element>
    </xsl:if>
    <!-- locate the symbol in the catalogue for the enclosing theory -->
    <xsl:element name="xsl:variable">
      <xsl:attribute name="name"><xsl:text>theory</xsl:text></xsl:attribute>
      <xsl:element name="xsl:choose">
	<xsl:element name="xsl:when">
	  <xsl:attribute name="test">
	    <xsl:text>ancestor::omdoc:theory[1]/@xml:id</xsl:text>
	  </xsl:attribute>
	  <xsl:element name="xsl:value-of">
	    <xsl:attribute name="select">
	      <xsl:text>ancestor::omdoc:theory[1]/@xml:id</xsl:text>
	    </xsl:attribute>
	  </xsl:element>
	</xsl:element>
	<xsl:element name="xsl:when">
	  <!-- testing for * instead of omdoc:* w.r.t extensions
	       (does not affect the semantics of transforming regular OMDoc) -->
	  <xsl:attribute name="test">
	    <xsl:text>ancestor::*[@theory]</xsl:text>
	  </xsl:attribute>
	  <xsl:element name="xsl:value-of">
	    <xsl:attribute name="select">
	      <xsl:text>substring-after(ancestor::*[@theory][1]/@theory, '#')</xsl:text>
	    </xsl:attribute>
	  </xsl:element>
	</xsl:element>
	<xsl:element name="xsl:otherwise">
	  <xsl:element name="xsl:value-of">
	    <xsl:attribute name="select">
	      <xsl:text>''</xsl:text>
	    </xsl:attribute>
	  </xsl:element>
	</xsl:element>
      </xsl:element>
    </xsl:element>
    <xsl:element name="xsl:variable">
      <xsl:attribute name="name"><xsl:text>omdoc</xsl:text></xsl:attribute>
      <xsl:attribute name="select">
	<xsl:text>string($href-cat/catalogue[@for=concat('#',$theory)]/loc[@theory='</xsl:text>
        <xsl:value-of select="$cd"/>
        <xsl:text>']/@omdoc)</xsl:text>
      </xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:variable">
      <xsl:attribute name="name"><xsl:text>name</xsl:text></xsl:attribute>
      <xsl:attribute name="select">
        <xsl:text>'</xsl:text>
        <xsl:value-of select="$name"/>
        <xsl:text>'</xsl:text>
      </xsl:attribute>
    </xsl:element>
    <xsl:if test="$pos">
      <xsl:element name="xsl:variable">
        <xsl:attribute name="name"><xsl:text>pos</xsl:text></xsl:attribute>
        <xsl:attribute name="select"><xsl:text>position()</xsl:text></xsl:attribute>
      </xsl:element>
    </xsl:if>
    <xsl:variable name="symbol" select="substring-after(@for,'#')"/>
    <!--     <xsl:message>do-inner: uses=<xsl:value-of select="count($uses)"/></xsl:message>
    <xsl:message>non-default formats <xsl:value-of select="count($uses[@format!='default'])"/></xsl:message> -->
    <xsl:choose>
      <!-- if there are formats other than 'default' -->
      <xsl:when test="$uses[@format!='default']">
        <xsl:element name="xsl:choose">
          <!-- We need to group the cases by format. 
               We collect the set of distinct formats (except 'default') -->
          <xsl:variable name="useses" select="$uses[@format!='default']"/>
          <xsl:variable name="formats" select="set:distinct($useses/@format)"/>
          <xsl:for-each select="$formats">
            <xsl:variable name="cases" select="$useses[@format=current()]"/>
            <xsl:call-template name="do-one-format">
              <xsl:with-param name="symbol" select="$symbol"/>
              <xsl:with-param name="cd" select="$cd"/>
              <xsl:with-param name="mode" select="$mode"/>
              <xsl:with-param name="theformat" select="current()"/>
              <xsl:with-param name="givens" select="$cases/@xml:lang"/>
              <xsl:with-param name="langcases">
                <xsl:for-each select="$cases[@xml:lang]">
                  <xsl:element name="xsl:when">
                    <xsl:attribute name="test">
                      <xsl:text>$valid-lang='</xsl:text>
                      <xsl:value-of select="@xml:lang"/>
                      <xsl:text>'</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates select=".">
                      <xsl:with-param name="mode" select="$mode"/>
                    </xsl:apply-templates>
                  </xsl:element>
                </xsl:for-each>
              </xsl:with-param>
              <xsl:with-param name="ocase">
                <xsl:for-each select="$cases[not(@xml:lang)]">
                  <xsl:apply-templates select="."><xsl:with-param name="mode" select="$mode"/></xsl:apply-templates>
                </xsl:for-each>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:for-each>
          <xsl:choose>
            <!-- if there is a default treatment, then use it -->
            <xsl:when  test="$uses[@format='default']">
              <xsl:element name="xsl:otherwise">
                <xsl:call-template name="do-one-format">
                  <xsl:with-param name="symbol" select="$symbol"/>
                  <xsl:with-param name="cd" select="$cd"/>
                  <xsl:with-param name="mode" select="$mode"/>
                  <xsl:with-param name="theformat" select="'default'"/>
                  <xsl:with-param name="givens" select="exsl:node-set($uses[@format='default'])/@xml:lang"/>
                  <xsl:with-param name="langcases">
                    <xsl:for-each select="$uses[@format='default' and @xml:lang]">
                      <xsl:element name="xsl:when">
                        <xsl:attribute name="test">
                          <xsl:text>$valid-lang='</xsl:text>
                          <xsl:value-of select="@xml:lang"/>
                          <xsl:text>'</xsl:text>
                        </xsl:attribute>
                        <xsl:apply-templates select=".">
                          <xsl:with-param name="mode" select="$mode"/>
                        </xsl:apply-templates>
                      </xsl:element>
                    </xsl:for-each>
                  </xsl:with-param>
                  <xsl:with-param name="ocase">
                    <xsl:apply-templates select="$uses[@format='default' and not(@xml:lang)]">
                      <xsl:with-param name="mode" select="$mode"/>
                    </xsl:apply-templates>
                  </xsl:with-param>
                </xsl:call-template>
              </xsl:element>
            </xsl:when>
            <!-- if ther is no 'default' case, use a fallback treatment defined by the 
                 main stylesheet for the format-->
            <xsl:otherwise>
              <xsl:element name="xsl:otherwise">
                <xsl:element name="xsl:apply-templates">
                  <xsl:attribute name="select"><xsl:text>.</xsl:text></xsl:attribute>
                  <xsl:attribute name="mode">
                    <xsl:if test="$mode!=''"><xsl:value-of select="concat($mode,'-')"/></xsl:if>
                    <xsl:text>fallback</xsl:text>
                  </xsl:attribute>
                  <xsl:element name="xsl:with-param">
                    <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
                    <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
                  </xsl:element>
                  <xsl:if test="$mode='around'">
                    <xsl:element name="xsl:with-param">
                      <xsl:attribute name="name"><xsl:text>content</xsl:text></xsl:attribute>
                      <xsl:attribute name="select"><xsl:text>$content</xsl:text></xsl:attribute>
                    </xsl:element>
                  </xsl:if>
                </xsl:element>
              </xsl:element>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:element>
      </xsl:when>
      <xsl:otherwise>
        <!-- there are only format='default' treatments -->
        <xsl:choose>
          <xsl:when  test="$uses[@format='default']">
            <!--             <xsl:message>only default!</xsl:message> -->
            <xsl:call-template name="do-one-format">
              <xsl:with-param name="symbol" select="$symbol"/>
              <xsl:with-param name="mode" select="$mode"/>
              <xsl:with-param name="theformat" select="'default'"/>
              <xsl:with-param name="givens" select="exsl:node-set($uses[@format='default'])/@xml:lang"/>
              <xsl:with-param name="langcases">
                <xsl:for-each select="$uses[@format='default' and @xml:lang]">
                  <xsl:element name="xsl:when">
                    <xsl:attribute name="test">
                      <xsl:text>$valid-lang='</xsl:text>
                      <xsl:value-of select="@xml:lang"/>
                      <xsl:text>'</xsl:text>
                    </xsl:attribute>
                    <xsl:apply-templates select="."/>
                  </xsl:element>
                </xsl:for-each>
              </xsl:with-param>
              <xsl:with-param name="ocase">
                <xsl:apply-templates select="$uses[@format='default' and not(@xml:lang)]">
                  <xsl:with-param name="mode" select="$mode"/>
                </xsl:apply-templates>
              </xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <!-- if ther is no 'default' case, use a fallback treatment defined by the 
               main stylesheet for the format-->
          <xsl:otherwise>
            <xsl:element name="xsl:apply-templates">
              <xsl:attribute name="select"><xsl:text>.</xsl:text></xsl:attribute>
              <xsl:attribute name="mode"><xsl:text>fallback</xsl:text></xsl:attribute>
            </xsl:element>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>
 
<!-- this template generates the case for one specific format in a template. 
     it takes three main parameters, 
     'theformat' is the format string, it is a |-separated list of format specifiers
     'givens' is a node-stet of languages given for this format
     'langcases' is an xslt fragment that handles the language cases -->
<xsl:template name="do-one-format">
  <xsl:param name="theformat"/>
  <xsl:param name="symbol"/>
  <xsl:param name="cd"/>
  <xsl:param name="mode"/>
  <xsl:param name="givens"/>
  <xsl:param name="langcases"/>
  <xsl:param name="ocase"/>
  <!--   <xsl:message>langcases: <xsl:value-of select="count($langcases)"/></xsl:message>
  <xsl:message>ocases: <xsl:value-of select="count($ocase)"/></xsl:message> -->
  <!-- the set of languages given for this format as a whitespace-separated list -->
  <xsl:variable name="given">
    <xsl:text>'</xsl:text>
    <xsl:for-each select="$givens">
      <xsl:value-of select="."/>
      <xsl:if test="position()!=last()"><xsl:text> </xsl:text></xsl:if>
    </xsl:for-each>
    <xsl:text>'</xsl:text>
  </xsl:variable>
  <!--   <xsl:message>given: <xsl:value-of select="$given"/></xsl:message> -->
  <xsl:variable name="inner">
    <xsl:choose>
      <xsl:when test="$langcases!=''">
        <xsl:element name="xsl:variable">
          <xsl:attribute name="name"><xsl:text>valid-lang</xsl:text></xsl:attribute>
          <xsl:attribute name="select">
            <xsl:text>omdoc:comp-valid-language(</xsl:text>
            <xsl:value-of select="$given"/>
            <xsl:text>,$TargetLanguage)</xsl:text>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="xsl:choose">
          <xsl:copy-of select="$langcases"/>
          <xsl:element name="xsl:otherwise">
            <xsl:choose>
              <xsl:when test="count($ocase) &gt; 0"><xsl:copy-of select="$ocase"/></xsl:when>
              <xsl:otherwise>
                <xsl:element name="xsl:call-template">
                  <xsl:attribute name="name"><xsl:text>error</xsl:text></xsl:attribute>
                  <xsl:element name="xsl:with-param">
                    <xsl:attribute name="name"><xsl:text>string</xsl:text></xsl:attribute>
                    <xsl:text>presentation for symbol </xsl:text>
                    <xsl:value-of select="$symbol"/>
                    <xsl:text>@</xsl:text>
                    <xsl:value-of select="$cd"/>
                    <xsl:text> lacks fallback case for format </xsl:text>
                    <xsl:value-of select="$theformat"/>
                    <xsl:text>!</xsl:text>
                  </xsl:element>
                </xsl:element>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:element>
        </xsl:element>
      </xsl:when>
      <xsl:when test="count($ocase) &gt; 0"><xsl:copy-of select="$ocase"/></xsl:when>
      <xsl:otherwise>
        <xsl:element name="xsl:call-template">
          <xsl:attribute name="name"><xsl:text>error</xsl:text></xsl:attribute>
          <xsl:element name="xsl:with-param">
            <xsl:attribute name="name"><xsl:text>string</xsl:text></xsl:attribute>
            <xsl:text>presentation for symbol </xsl:text>
            <xsl:value-of select="$symbol"/>
            <xsl:text>@</xsl:text>
            <xsl:value-of select="$cd"/>
            <xsl:text> lacks fallback case for format </xsl:text>
            <xsl:value-of select="$theformat"/>
            <xsl:text>!</xsl:text>
          </xsl:element>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="$theformat!='default'">
      <xsl:element name="xsl:when">
        <xsl:attribute name="test">
          <xsl:value-of select="omdoc:format-disjunction($theformat)"/>
        </xsl:attribute>
        <xsl:copy-of select="$inner"/>
      </xsl:element>
    </xsl:when>
    <xsl:otherwise><xsl:copy-of select="$inner"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="omdoc:use[../@role='applied' or ../@role='binding']">
  <xsl:variable name="name" select="substring-after(../@for,'#')"/>
  <xsl:variable name="fixity" select="omdoc:fixity()"/>
  <xsl:choose>
    <xsl:when test="$fixity='prefix' or $fixity='postfix'">
      <!-- in this case we generate code for printing a 
           function of on n arguments, depending on the fixity, bracket-style,
           and separator attributes:
           prefix and lisp:  (f,1,2,3)
           prefix and math:  f(1,2,3)
           postfix and lisp: (1,2,3,f)
           postfix and math: (1,2,3)f -->
      <xsl:variable name="inner"><!-- this variable takes care of the reusable part 1,2,3 -->
        <xsl:element name="xsl:for-each">
          <xsl:attribute name="select"><xsl:text>*[position()!=1]</xsl:text></xsl:attribute>
          <xsl:call-template name="do-arg"/>
          <xsl:element name="xsl:if">
            <xsl:attribute name="test"><xsl:text>position()!=last()</xsl:text></xsl:attribute>
            <xsl:element name="xsl:call-template">
              <xsl:attribute name="name"><xsl:text>print-separator</xsl:text></xsl:attribute>
              <xsl:element name="xsl:with-param">
                <xsl:attribute name="name"><xsl:text>print-form</xsl:text></xsl:attribute>
                <xsl:attribute name="select">
                  <xsl:text>'</xsl:text>
                  <xsl:value-of select="omdoc:separator()"/>
                  <xsl:text>'</xsl:text>
                </xsl:attribute>
              </xsl:element>
              <xsl:element name="xsl:with-param">
                <xsl:attribute name="name"><xsl:text>crossref-symbol</xsl:text></xsl:attribute>
                <xsl:attribute name="select">
                  <xsl:text>'</xsl:text>
                  <xsl:value-of select="omdoc:crossref-symbol()"/>
                  <xsl:text>'</xsl:text>
                </xsl:attribute>
              </xsl:element>
              <xsl:element name="xsl:with-param">
                <xsl:attribute name="name"><xsl:text>uri</xsl:text></xsl:attribute>
                <xsl:attribute name="select">
                  <xsl:text>omdoc:crossref($omdoc,'</xsl:text>
                  <xsl:value-of select="$name"/>
                  <xsl:text>',$crossref-format)</xsl:text>
                </xsl:attribute>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:element>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="$fixity ='prefix' and omdoc:bracket-style()='lisp'">
          <xsl:call-template name="with-brackets">
            <xsl:with-param name="content">
              <xsl:call-template name="print-crossref-symbol">
                <xsl:with-param name="path" select="'*[1]'"/>
              </xsl:call-template>
	      <xsl:call-template name="make-group">
		<xsl:with-param name="content" select="$inner"/>
	      </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$fixity ='prefix' and omdoc:bracket-style()='math'">
	  <xsl:call-template name="make-group">
	    <xsl:with-param name="content">
	      <xsl:call-template name="print-crossref-symbol">
		<xsl:with-param name="path" select="'*[1]'"/>
	      </xsl:call-template>
	      <xsl:call-template name="with-brackets">
		<xsl:with-param name="content" select="$inner"/>
	      </xsl:call-template>
	    </xsl:with-param>
	  </xsl:call-template>
        </xsl:when>
        <xsl:when test="$fixity ='postfix' and omdoc:bracket-style()='lisp'">
          <xsl:call-template name="with-brackets">
            <xsl:with-param name="content">
	      <xsl:call-template name="make-group">
	        <xsl:with-param name="content" select="$inner"/>
              </xsl:call-template>
              <xsl:call-template name="print-crossref-symbol">
                <xsl:with-param name="path" select="'*[1]'"/>
              </xsl:call-template>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <xsl:when test="$fixity ='postfix' and omdoc:bracket-style()='math'">
	  <xsl:call-template name="make-group">
	    <xsl:with-param name="content">
	      <xsl:call-template name="with-brackets">
		<xsl:with-param name="content" select="$inner"/>
	      </xsl:call-template>
	      <xsl:call-template name="print-crossref-symbol">
		<xsl:with-param name="path" select="'*[1]'"/>
	      </xsl:call-template>
	    </xsl:with-param>
	  </xsl:call-template>
        </xsl:when>
      </xsl:choose>
    </xsl:when>
    <xsl:when test="$fixity='infix'">
      <xsl:call-template name="with-brackets">
        <xsl:with-param name="content">
          <xsl:comment>for some reason a comment here helps, don't ask me why</xsl:comment>
          <xsl:call-template name="do-arg">
            <xsl:with-param name="path" select="'*[2]'"/>
          </xsl:call-template>
          <xsl:call-template name="print-crossref-symbol">
            <xsl:with-param name="path" select="'*[1]'"/>
          </xsl:call-template>
          <xsl:call-template name="do-arg">
            <xsl:with-param name="path" select="'*[3]'"/>
          </xsl:call-template>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:when test="$fixity='assoc'">
      <xsl:call-template name="with-brackets">
        <xsl:with-param name="content">
          <xsl:element name="xsl:for-each">
            <xsl:attribute name="select"><xsl:text>*[position()!=1]</xsl:text></xsl:attribute>
            <xsl:call-template name="do-arg"/>
            <xsl:element name="xsl:if">
              <xsl:attribute name="test"><xsl:text>position()!=last()</xsl:text></xsl:attribute>
              <xsl:element name="xsl:choose">
                <xsl:element name="xsl:when">
                  <xsl:attribute name="test"><xsl:text>position()=1</xsl:text></xsl:attribute>
                  <xsl:call-template name="print-crossref-symbol">
                    <xsl:with-param name="path" select="'../*[1]'"/>
                  </xsl:call-template>
                </xsl:element>
                <xsl:element name="xsl:otherwise">
                  <xsl:call-template name="print-crossref-symbol"/>
                </xsl:element>
              </xsl:element>
            </xsl:element>
          </xsl:element>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="error">
        <xsl:with-param name="string" select="'Unrecognized fixity!'"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="omdoc:use[../@role='key']">
  <xsl:param name="mode"/>
  <xsl:choose>
    <xsl:when test="omdoc:bracket-style()='lisp'">
      <xsl:call-template name="with-brackets">
        <xsl:with-param name="content">
          <xsl:call-template name="print-crossref-symbol">
            <xsl:with-param name="path" select="'*[1]'"/>
          </xsl:call-template>
          <xsl:if test="omdoc:fixity()='postfix'">
            <xsl:element name="xsl:copy-of">
              <xsl:attribute name="select">
                <xsl:text>$content</xsl:text>
              </xsl:attribute>
            </xsl:element>
          </xsl:if>
          <xsl:element name="xsl:apply-templates">
            <xsl:attribute name="select">
              <xsl:text>../*[position()=$pos+1]</xsl:text>
            </xsl:attribute>
            <xsl:element name="xsl:with-param">
              <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
              <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
            </xsl:element>
          </xsl:element>
          <xsl:if test="omdoc:fixity()='prefix'">
            <xsl:element name="xsl:copy-of">
              <xsl:attribute name="select">
                <xsl:text>$content</xsl:text>
              </xsl:attribute>
            </xsl:element>
          </xsl:if>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="print-crossref-symbol">
	<xsl:with-param name="path" select="'*[1]'"/>
      </xsl:call-template>
      <xsl:call-template name="with-brackets">
	<xsl:with-param name="content">
	  <xsl:call-template name="make-group">
	    <xsl:with-param name="content">
	      <xsl:element name="xsl:apply-templates">
		<xsl:attribute name="select">
		  <xsl:text>../*[position()=$pos+1]</xsl:text>
		</xsl:attribute>
		<xsl:element name="xsl:with-param">
		  <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
		  <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
		</xsl:element>
	      </xsl:element>
	    </xsl:with-param>
	  </xsl:call-template>
	</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="omdoc:use[not(../@role)]">
  <xsl:call-template name="print-crossref-symbol">
    <xsl:with-param name="path" select="'.'"/>
  </xsl:call-template>
</xsl:template>

<!-- This template composes the treatment for an argument of a function. -->
<xsl:template name="do-arg">
  <xsl:param name="path" select="'.'"/>
  <xsl:element name="xsl:call-template">
    <xsl:attribute name="name"><xsl:text>do-arg</xsl:text></xsl:attribute>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>content</xsl:text></xsl:attribute>
      <xsl:element name="xsl:apply-templates">
        <xsl:attribute name="select"><xsl:value-of select="$path"/></xsl:attribute>
        <xsl:element name="xsl:with-param">
          <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
          <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
        </xsl:element>
        <xsl:element name="xsl:with-param">
          <xsl:attribute name="name"><xsl:text>prec</xsl:text></xsl:attribute>
          <xsl:attribute name="select"><xsl:value-of select="omdoc:precedence-value()"/></xsl:attribute>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:template>


<xsl:template match="omdoc:presentation/omdoc:xslt">
  <!-- copy the style sheet. It is assumed to be in the xsl name space -->
  <xsl:copy-of select="xsl:*"/>
</xsl:template>

<xsl:template match="omdoc:omstyle/omdoc:xslt">
  <xsl:element name="xsl:when">
    <xsl:attribute name="test"><xsl:value-of select="omdoc:format-disjunction(@format)"/></xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<!-- the next set of templates prints the crossref-symbol, i.e. if the 
     crossref-symbol switch is 't', then it constructs the crossref, 
     whereever possible, (depending on the format).
     It calls the template 'print-symbol' with the right format, so that this
     can be overwritten by another style sheet  -->

<xsl:template name="print-crossref-symbol">
  <xsl:param name="path"/>
  <xsl:variable name="cd" select="../../@xml:id"/>
  <xsl:variable name="name" select="substring-after(../@for,'#')"/>
  <xsl:variable name="sym"/>
  <xsl:variable name="cont">
    <xsl:if test="string(.)!=''">
      <xsl:element name="xsl:call-template">
        <xsl:attribute name="name"><xsl:text>print-symbol</xsl:text></xsl:attribute>
        <xsl:element name="xsl:with-param">
          <xsl:attribute name="name"><xsl:text>print-form</xsl:text></xsl:attribute>
          <xsl:apply-templates/>
        </xsl:element>
        <xsl:element name="xsl:with-param">
          <xsl:attribute name="name"><xsl:text>crossref-symbol</xsl:text></xsl:attribute>
          <xsl:attribute name="select">
            <xsl:text>'</xsl:text>
            <xsl:value-of select="omdoc:crossref-symbol()"/>
            <xsl:text>'</xsl:text>
          </xsl:attribute>
        </xsl:element>
        <xsl:element name="xsl:with-param">
          <xsl:attribute name="name"><xsl:text>uri</xsl:text></xsl:attribute>
          <xsl:attribute name="select">
            <xsl:text>omdoc:crossref($omdoc,'</xsl:text>
            <xsl:value-of select="$name"/>
            <xsl:text>',$crossref-format)</xsl:text>
          </xsl:attribute>
        </xsl:element>
        <xsl:if test="omdoc:element">
          <xsl:element name="xsl:with-param">
            <xsl:attribute name="name"><xsl:text>mo</xsl:text></xsl:attribute>
            <xsl:attribute name="select"><xsl:text>'no'</xsl:text></xsl:attribute>
          </xsl:element>
        </xsl:if>
        <xsl:if test="$path!=''">
          <xsl:element name="xsl:with-param">
            <xsl:attribute name="name"><xsl:text>id</xsl:text></xsl:attribute>
            <xsl:attribute name="select">
              <xsl:text>concat('MCR',$prefix,generate-id(</xsl:text>
              <xsl:value-of select="$path"/>
              <xsl:text>))</xsl:text>
            </xsl:attribute>
          </xsl:element>
        </xsl:if>
      </xsl:element>
    </xsl:if>
  </xsl:variable>
  <xsl:choose>
    <xsl:when test="@element and not(../@role)">
      <xsl:call-template name="with-brackets">
        <xsl:with-param name="content" select="$cont"/>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise><xsl:copy-of select="$cont"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- this template groups some arguments together so that, for example,
     a group container like mrow in Presentation MathML can be generated
     to hold them. -->
<xsl:template name="make-group">
  <xsl:param name="content"/>
  <xsl:param name="parent-element" select="''"/>
  <xsl:if test="$debug">
    <xsl:message>[make-group] in element <xsl:value-of select="$parent-element"/>, content=<xsl:copy-of select="$content"/></xsl:message>
  </xsl:if>
  <xsl:choose>
    <!-- determine whether we have to mark this group ... -->
    <xsl:when test="$content and (not(@element) or $parent-element or (omdoc:bracket-style() = 'lisp' and omdoc:fixity() = 'postfix'))">
      <xsl:element name="xsl:call-template">
	<xsl:attribute name="name">
	  <xsl:text>make-group</xsl:text>
	</xsl:attribute>
	<xsl:element name="xsl:with-param">
	  <xsl:attribute name="name">
	    <xsl:text>content</xsl:text>
	  </xsl:attribute>
	  <xsl:copy-of select="$content"/>
	</xsl:element>
	<xsl:if test="$parent-element">
	  <xsl:element name="xsl:with-param">
	    <xsl:attribute name="name">
	      <xsl:text>parent-element</xsl:text>
	    </xsl:attribute>
	    <xsl:value-of select="$parent-element"/>
	  </xsl:element>
	</xsl:if>
      </xsl:element>
    </xsl:when>
    <!-- ... or not. -->
    <xsl:otherwise>
      <xsl:copy-of select="$content"/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- this template generates the code that places brackets around 
     argument lists given as an argument -->
<xsl:template name="with-brackets">
  <xsl:param name="content"/>
  <xsl:if test="$debug">
    <xsl:message>[with-brackets] content = <xsl:copy-of select="$content"/></xsl:message>
  </xsl:if>
  <xsl:element name="xsl:call-template">
    <xsl:attribute name="name"><xsl:text>with-arg-group</xsl:text></xsl:attribute>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>prec</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>$prec</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>precedence</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:value-of select="omdoc:precedence-value()"/></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>open</xsl:text></xsl:attribute>
      <xsl:choose>
	<xsl:when test="@lbrack=''"><xsl:value-of select="''"/></xsl:when>
	<xsl:when test="not(@lbrack)">
	  <xsl:choose>
	    <xsl:when test="../@lbrack"><xsl:value-of select="../@lbrack"/></xsl:when>
	    <xsl:otherwise><xsl:value-of select="'('"/></xsl:otherwise>
	  </xsl:choose>
	</xsl:when>
	<xsl:otherwise><xsl:value-of select="@lbrack"/></xsl:otherwise>
      </xsl:choose>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>close</xsl:text></xsl:attribute>
      <xsl:choose>
	<xsl:when test="@rbrack=''"><xsl:value-of select="''"/></xsl:when>
	<xsl:when test="not(@rbrack)">
	  <xsl:choose>
	    <xsl:when test="../@rbrack"><xsl:value-of select="../@rbrack"/></xsl:when>
	    <xsl:otherwise><xsl:value-of select="')'"/></xsl:otherwise>
	  </xsl:choose>
	</xsl:when>
	<xsl:otherwise><xsl:value-of select="@rbrack"/></xsl:otherwise>
      </xsl:choose>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>content</xsl:text></xsl:attribute>
      <xsl:choose><!-- we have generate XML element constructors -->
	<xsl:when test="@element">
	  <xsl:element name="xsl:element">
	    <xsl:attribute name="name"><xsl:value-of select="@element"/></xsl:attribute>
	    <xsl:attribute name="namespace"><xsl:text>{$TargetNS}</xsl:text></xsl:attribute>
	    <xsl:element name="xsl:attribute">
	      <xsl:attribute name="name"><xsl:text>id</xsl:text></xsl:attribute>
	      <xsl:element name="xsl:value-of">
		<xsl:attribute name="select">
		  <xsl:text>concat('MCR',$prefix,generate-id())</xsl:text>
		</xsl:attribute>
	      </xsl:element>
	    </xsl:element>
	    <xsl:if test="@attributes">
	      <xsl:for-each select="omdoc:tokenize(@attributes,' ')">
		<xsl:variable name="name" select="substring-before(.,'=')"/>
		<xsl:variable name="pre-value" select="substring-after(.,'=')"/>
		<xsl:variable name="value" select="substring($pre-value,2,string-length($pre-value)-2)"/>
		<xsl:element name="xsl:attribute">
		  <xsl:attribute name="name"><xsl:value-of select="$name"/></xsl:attribute>
		  <xsl:value-of select="$value"/>
		</xsl:element>
	      </xsl:for-each>
	    </xsl:if>
	    <xsl:call-template name="make-group">
	      <xsl:with-param name="content" select="$content"/>
	      <xsl:with-param name="parent-element" select="@element"/>
	    </xsl:call-template>
	  </xsl:element>
	</xsl:when>
	<xsl:otherwise><!-- we do not have to deal with elements -->
	  <xsl:copy-of select="$content"/>
	</xsl:otherwise>
      </xsl:choose>
    </xsl:element>
  </xsl:element>
</xsl:template>

<!-- the template for the OMDoc style element produces anL template -->
<xsl:template match="omdoc:omstyle">
  <xsl:element name="xsl:template">
    <xsl:attribute name="match">
      <xsl:text>omdoc:</xsl:text>
      <xsl:value-of select="@element"/>
      <xsl:text>[@style='</xsl:text>
      <xsl:value-of select="@style"/>
      <xsl:text>']</xsl:text>
    </xsl:attribute>
    <xsl:element name="xsl:param">
      <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:choose">
      <xsl:apply-templates/>
      <xsl:element name="xsl:otherwise">
        <xsl:element name="xsl:apply-templates">
          <xsl:attribute name="select">
            <xsl:text>../*[position()=$pos+1]</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="mode"><xsl:text>fallback</xsl:text></xsl:attribute>
          <xsl:element name="xsl:with-param">
            <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
            <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
          </xsl:element>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
  <xsl:text>&#xA;&#xA;</xsl:text>
</xsl:template>

<!-- we give the right namespace for the element elements -->
<xsl:template match="omdoc:presentation/omdoc:style">
  <xsl:apply-templates/>
</xsl:template>

<!-- we give the right namespace for the element elements -->
<xsl:template match="omdoc:omstyle/omdoc:style">
  <xsl:element name="xsl:when">
    <xsl:attribute name="test"><xsl:value-of select="omdoc:format-disjunction(@format)"/></xsl:attribute>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="omdoc:element">
  <xsl:element name="xsl:element">
    <xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
    <xsl:attribute name="namespace">
      <xsl:choose>
        <xsl:when test="@ns"><xsl:value-of select="@ns"/></xsl:when>
        <xsl:otherwise><xsl:text>{$TargetNS}</xsl:text></xsl:otherwise>        
      </xsl:choose>
    </xsl:attribute>
    <xsl:if test="@crid">
      <xsl:element name="xsl:attribute">
	<xsl:attribute name="name"><xsl:text>id</xsl:text></xsl:attribute>
	<xsl:element name="xsl:value-of">
	  <xsl:attribute name="select">
	    <xsl:value-of select="concat('generate-id(',@crid,')')"/>
	  </xsl:attribute>
	</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:if test="@cr='yes'">
      <xsl:element name="xsl:attribute">
	<xsl:attribute name="name"><xsl:text>xlink:href</xsl:text></xsl:attribute>
	<xsl:element name="xsl:value-of">
	  <xsl:attribute name="select">
	    <xsl:text>omdoc:crossref($omdoc,$name,$crossref-format)</xsl:text>
	  </xsl:attribute>
	</xsl:element>
      </xsl:element>
    </xsl:if>
    <xsl:apply-templates/>
  </xsl:element>
</xsl:template>

<xsl:template match="omdoc:text">
  <xsl:element name="xsl:text"><xsl:apply-templates/></xsl:element>
</xsl:template>

<xsl:template match="omdoc:attribute">
  <xsl:element name="xsl:attribute">
    <xsl:copy-of select="@name"/>
    <xsl:choose>
      <xsl:when test="@select">
	<xsl:element name="xsl:value-of">
	  <xsl:attribute name="select"><xsl:value-of select="@select"/></xsl:attribute>
	</xsl:element>
      </xsl:when>
      <xsl:otherwise>
	<xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
</xsl:template>

<xsl:template match="omdoc:value-of">
  <xsl:element name="xsl:value-of">
    <xsl:attribute name="select"><xsl:value-of select="@select"/></xsl:attribute>
  </xsl:element>
</xsl:template>

<xsl:template match="omdoc:recurse">
  <xsl:comment>somehow I need this comment, otherwise xsltproc does not generate the rest</xsl:comment>
  <xsl:element name="xsl:apply-templates">
    <xsl:if test="@select">
      <xsl:attribute name="select"><xsl:value-of select="@select"/></xsl:attribute>
    </xsl:if>
    <xsl:if test="ancestor::omdoc:*[@precedence and (local-name() = 'map' or local-name() = 'presentation')]">
      <xsl:element name="xsl:with-param">
	<xsl:attribute name="name"><xsl:text>prec</xsl:text></xsl:attribute>
	<xsl:attribute name="select">
	  <xsl:value-of select="ancestor::omdoc:*[@precedence and (local-name() = 'map' or local-name() = 'presentation')][1]/@precedence"/>
	</xsl:attribute>
      </xsl:element>
    </xsl:if>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
    </xsl:element>
  </xsl:element>
</xsl:template>

<xsl:template match="omdoc:map">
  <xsl:element name="xsl:call-template">
    <xsl:attribute name="name"><xsl:text>with-arg-group</xsl:text></xsl:attribute>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>prefix</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>$prefix</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>prec</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:text>$prec</xsl:text></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>precedence</xsl:text></xsl:attribute>
      <xsl:attribute name="select"><xsl:value-of select="omdoc:precedence-value()"/></xsl:attribute>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>open</xsl:text></xsl:attribute>
      <xsl:value-of select="@lbrack"/>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>close</xsl:text></xsl:attribute>
      <xsl:value-of select="@rbrack"/>
    </xsl:element>
    <xsl:element name="xsl:with-param">
      <xsl:attribute name="name"><xsl:text>content</xsl:text></xsl:attribute>
      <xsl:element name="xsl:for-each">
	<xsl:attribute name="select"><xsl:value-of select="@select"/></xsl:attribute>
	<xsl:apply-templates select="*[local-name()!='separator']"/>
	<xsl:element name="xsl:if">
	  <xsl:attribute name="test"><xsl:text>position()!=last()</xsl:text></xsl:attribute>
	  <xsl:apply-templates select="omdoc:separator/*"/>
	</xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:element>
</xsl:template>

<!-- the next set of functions compute the valid attribute value, taking into account that 
     the attributes on the 'use' element overwrite the ones on the 'presentation' element -->
<func:function name="omdoc:bracket-style">
 <xsl:choose>
  <xsl:when test="@bracket-style"><func:result select="@bracket-style"/></xsl:when>
  <xsl:when test="../@bracket-style"><func:result select="../@bracket-style"/></xsl:when>
  <xsl:otherwise><func:result select="'math'"/></xsl:otherwise>
 </xsl:choose>
</func:function>

<func:function name="omdoc:separator">
 <xsl:choose>
  <xsl:when test="@separator"><func:result select="@separator"/></xsl:when>
  <xsl:when test="../@separator"><func:result select="../@separator"/></xsl:when>
  <xsl:otherwise><func:result select="','"/></xsl:otherwise>
 </xsl:choose>
</func:function>

<func:function name="omdoc:fixity">
 <xsl:choose>
  <xsl:when test="@fixity"><func:result select="@fixity"/></xsl:when>
  <xsl:when test="../@fixity"><func:result select="../@fixity"/></xsl:when>
  <xsl:otherwise><func:result select="'prefix'"/></xsl:otherwise>
 </xsl:choose>
</func:function>

<func:function name="omdoc:crossref-symbol">
 <xsl:choose>
  <xsl:when test="@crossref-symbol"><func:result select="@crossref-symbol"/></xsl:when>
  <xsl:when test="../@crossref-symbol"><func:result select="../@crossref-symbol"/></xsl:when>
  <xsl:otherwise><func:result select="'yes'"/></xsl:otherwise>
 </xsl:choose>
</func:function>

<func:function name="omdoc:format-disjunction">
  <xsl:param name="theformat"/>
  <xsl:choose>
    <xsl:when test="contains($theformat,'|')">
      <func:result>
        <xsl:text>$format='</xsl:text>
        <xsl:value-of select="substring-before($theformat,'|')"/>
        <xsl:text>' or </xsl:text>
        <xsl:value-of select="omdoc:format-disjunction(substring-after($theformat,'|'))"/>
      </func:result>
    </xsl:when>
    <xsl:otherwise>
      <func:result>
        <xsl:text>$format='</xsl:text>
        <xsl:value-of select="$theformat"/>
        <xsl:text>'</xsl:text>
      </func:result>
    </xsl:otherwise>
  </xsl:choose>
</func:function>

</xsl:stylesheet>

<!-- Options for text editors; please don't remove!
vim:sw=2:
-->

