<!-- An XSL style sheet for transforming content MathML into 
     OpenMath objects it implements
     http://www.nag.co.uk/projects/OpenMath/final/reports/ommml.pdf

     Initial version, David Carlisle 
     updated 20020531 Michael Kohlhase
     send bug-reports, patches, suggestions to om@openmath.org

     Copyright (c) 2001 - 2002 David Carlisle, Michael Kohlhase

     Use and distribution of this code are permitted under the terms 
     of the <a href="http://www.w3.org/Consortium/Legal/copyright-software-19980720"
     >W3C Software Notice and License</a>.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:m="http://www.w3.org/1998/Math/MathML"
                xmlns="http://www.openmath.org/OpenMath"
                xmlns:omdoc="http://www.mathweb.org/omdoc"
                version="1.0"
                exclude-result-prefixes="m omdoc">

<xsl:output method="xml" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:param name="dtd"/>

<xsl:template match="/">
 <xsl:if test="$dtd!=''">
  <xsl:text disable-output-escaping="yes">&#xA;&lt;!DOCTYPE omdoc SYSTEM "</xsl:text>
  <xsl:value-of select="$dtd"/>
  <xsl:text disable-output-escaping="yes">" []&gt;&#xA;&#xA;</xsl:text>
 </xsl:if>
 <xsl:apply-templates/>
</xsl:template>

<!-- the default behavior is to copy -->
<xsl:template match="*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<!-- math -->
<xsl:template match="m:math">
 <OMOBJ><xsl:apply-templates/></OMOBJ>
</xsl:template>

<!-- apply, reln -->
<xsl:template match="m:apply|m:reln">
 <OMA><xsl:apply-templates/></OMA>
</xsl:template>

<!-- cn; ** do bigfloatCD, if not IEEE float; support type="e-notation" -->
<xsl:template match="m:cn[@type='integer']" >
 <OMI><xsl:value-of select="."/></OMI>
</xsl:template>

<xsl:template match="m:cn[@type='integer' and @base=16]">
 <OMI>
  <xsl:variable name="x" select="normalize-space(.)"/>
  <xsl:choose>
   <xsl:when test="starts-with($x,'-')">-x<xsl:value-of select="substring-after($x,'-')"/>
  </xsl:when>
  <xsl:otherwise>x<xsl:value-of select="$x"/>
 </xsl:otherwise>
</xsl:choose>
</OMI>
</xsl:template>


<xsl:template match="cn[@type='integer' and not(@base=16)]">
 <OMA>
  <OMS cd="nums1" name="based_integer"/>
  <OMI><xsl:value-of select="@base"/></OMI>
  <OMSTR><xsl:value-of select="."/></OMSTR>
 </OMA>
</xsl:template>

<xsl:template match="m:cn[@type='real']">
 <OMF dec="{.}"/>
</xsl:template>

<xsl:template match="m:cn"><OMF dec="{.}"/></xsl:template>

<xsl:template match="m:cn[@type='rational']" >
 <OMA>
  <OMS cd="nums1" name="rational"/>
  <OMI><xsl:value-of select="text()[1]"/></OMI>
  <OMI><xsl:value-of select="text()[2]"/></OMI>
 </OMA>
</xsl:template>

<xsl:template match="m:cn[@type='complex-cartesian']" >
 <OMA>
  <OMS cd="complex1" name="complex_cartesian"/>
  <OMI><xsl:value-of select="text()[1]"/></OMI>
  <OMI><xsl:value-of select="text()[2]"/></OMI>
 </OMA>
</xsl:template>

<xsl:template match="m:cn[@type='complex-polar']" >
 <OMA>
  <OMS cd="complex1" name="complex_polar"/>
  <OMI><xsl:value-of select="text()[1]"/></OMI>
  <OMI><xsl:value-of select="text()[2]"/></OMI>
 </OMA>
</xsl:template>

<!-- ci ********** for OMDoc here ************* -->
<!--*************** cheating with m:mo here *****************  -->
<xsl:template match="m:ci|m:mo|m:mi">
  <xsl:variable name="varname" select="normalize-space(.)"/>
  <xsl:choose>
    <!-- if there is markup in the body, we need to annotate this  -->
    <xsl:when test="* or @type">
      <OMATTR>
        <OMATP>
          <xsl:if test="*">
            <OMS cd="notation" name="pmml"/>
            <OMDATA encoding="application/mathml+xml">
              <xsl:copy-of select="node()|text()"/>
            </OMDATA>
          </xsl:if>
          <xsl:if test="@type">
            <OMS cd="mathmltypes" name="type"/>
            <OMS cd="mathmltypes" name="{@type}_type"/>
          </xsl:if>
        </OMATP>
        <OMV name="{$varname}"/>
      </OMATTR>
    </xsl:when>
    <xsl:otherwise><OMV name="{$varname}"/></xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- csymbol pointing to OpenMath-->
<xsl:template match="m:csymbol[@encoding='OpenMath']">
 <OMS cd="{@definitionURL}"  name="{normalize-space(.)}"/>
</xsl:template>

<!-- ** try to dereference CD or OMDoc, find theory there.
     maybe make this conditional on a parameter -->
<xsl:template match="m:csymbol">
 <OMV  name="{normalize-space(.)}"/>
</xsl:template>

<!-- fn is ignored in OM; it is deprecated in MathML2 -->
<xsl:template match="m:fn"><xsl:apply-templates/></xsl:template>

<!-- interval -->
<xsl:template match="m:interval[not(@type) or @type='closed']">
 <OMS cd="interval1" name="interval_cc"/>
</xsl:template>

<xsl:template match="m:interval[@type='open']">
 <OMS cd="interval1" name="interval_oo"/>
</xsl:template>

<xsl:template match="m:interval[@type='closed-open']">
 <OMS cd="interval1" name="interval_co"/>
</xsl:template>

<xsl:template match="m:interval[@type='open-closed']">
 <OMS cd="interval1" name="interval_oc"/>
</xsl:template>

<!-- declare; ** add attribuitions for MathMLtypes to all subsequent variables -->
<xsl:template match="declare"/>

<!-- lambda -->
<xsl:template match="m:apply[*[1][self::m:lambda]]">
 <OMBIND>
  <OMS cd="fns1" name="lambda"/>
  <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
  <xsl:apply-templates select="*[last()]"/>
 </OMBIND>
</xsl:template>

<!-- compose -->
<xsl:template match="m:compose"><OMS cd="fns1" name="left_compose"/></xsl:template>
<!-- ident -->
<xsl:template match="m:ident"><OMS cd="fns1" name="identity"/></xsl:template>

<!-- domain -->
<xsl:template match="m:domain|m:domainofapplication|m:inverse">
 <OMS cd="fns1" name="{local-name(.)}"/>
</xsl:template>

<!-- codomain -->
<xsl:template match="m:codomain"><OMS cd="fns1" name="image"/></xsl:template>

<!-- quotient, factorial -->
<xsl:template match="m:quotient|m:factorial|m:factorof">
 <OMS cd="integer1" name="{local-name(.)}"/>
</xsl:template>


<!-- max, min; ** fix this  -->
<xsl:template match="m:apply[*[1]
                     [self::m:max or self::m:min] and not(m:bvar)]">
 <OMA>
  <OMS cd="minmax1" name="{local-name(*[1])}"/>
  <OMS cd="set1" name="set"/>
   <xsl:apply-templates select="*[position() &gt; 1]"/>
  </OMA>
</xsl:template>

<!-- max, min ** fix this -->
<xsl:template match="m:apply[*[1][self::m:max or self::m:min]]">
  <xsl:choose>
    <xsl:when test="m:bvar and m:condition">
      <OMA>
        <OMS cd="minmax1" name="{local-name(*[1])}"/>
        <OMA>
          <OMS cd="set1" name="suchthat"/>
          <OMS cd="missing" name="dummyset"/>
          <OMBIND>
            <OMS cd="fns1" name="lambda"/>
            <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
            <xsl:apply-templates select="m:condition/*"/>
          </OMBIND>
          <xsl:apply-templates select="*[position() &gt; 1]"/>
        </OMA>
      </OMA>
    </xsl:when>
    <xsl:when test="not(m:bvar or m:condition)">
      <OMA>
        <OMS cd="minmax1" name="{local-name(*[1])}"/>
        <OMA>
          <OMS cd="set1" name="set"/>
          <xsl:apply-templates select="*[position()&gt;1]"/>
        </OMA>
      </OMA>
    </xsl:when>
    <xsl:otherwise>
      <xsl:message>m:min and m:max must have both m:bvar and m:condition</xsl:message>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- minus; ***  the setdiff version needs a type checker -->
<xsl:template match="m:minus"><OMS cd="arith1" name="minus"/></xsl:template>
<xsl:template match="m:apply/*[self::m:minus and position()=1 and last() = 2]">
 <OMS cd="arith1" name="unary_minus"/>
</xsl:template>

<!-- plus; ***  the union version would need a type checker-->
<xsl:template match="m:plus"><OMS cd="arith1" name="plus"/></xsl:template>
<xsl:template match="m:apply[*[self::m:plus and last()=1 ]]" >
 <OMS cd="alg1" name="zero"/>
</xsl:template>

<!-- times, power, abs, lcm, gcd, divide -->
<xsl:template match="m:power|m:times|m:abs|m:lcm|m:gcd|m:divide">
 <OMS cd="arith1" name="{local-name(.)}"/>
</xsl:template>

<!-- real, imaginary, conjugate -->
<xsl:template match="m:real|m:imaginary|m:conjugate">
 <OMS cd="complex1" name="{local-name(.)}"/>
</xsl:template>

<!-- rem -->
<xsl:template match="m:rem">
 <OMS cd="integer1" name="remainder"/>
</xsl:template>

<!-- root; ** type real is not supported in OpenMath 
           ** do something about principal_branch -->
<xsl:template match="m:apply[*[self::m:root]]">
 <OMA>
  <OMS cd="arith1" name="root"/>
  <xsl:apply-templates select="*[last()]"/>
  <xsl:choose>
   <xsl:when test="m:degree"><xsl:apply-templates select="m:degree/*"/></xsl:when>
   <xsl:otherwise><OMI>2</OMI></xsl:otherwise>
  </xsl:choose>
 </OMA>
</xsl:template>


<!-- and, or, xor, not, implies -->
<xsl:template match="m:and|m:or|m:xor|m:not|m:implies">
 <OMS cd="logic1" name="{local-name(.)}"/>
</xsl:template>

<!--  forall, exists -->
<xsl:template match="m:apply[*[1][local-name()='forall' or local-name()='exists']]">
 <OMBIND>
  <OMS cd="quant1" name="{local-name(*[1])}"/>
  <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
  <xsl:choose>
   <xsl:when test="m:condition">
    <OMA>
     <OMS cd="logic1" name="implies"/>
     <xsl:apply-templates select="condition"/>
     <xsl:apply-templates select="*[last()]"/>
    </OMA>
   </xsl:when>
   <xsl:otherwise>
    <xsl:apply-templates select="*[last()]"/>
   </xsl:otherwise>
  </xsl:choose>
 </OMBIND>
</xsl:template>


<!-- arg  -->
<xsl:template match="m:arg"><OMS cd="complex1" name="argument"/></xsl:template>

<!-- floor, ceiling -->
<xsl:template match="m:floor|m:ceiling">
 <OMS cd="rounding1" name="{local-name(.)}"/>
</xsl:template>

<!-- eq -->
<xsl:template match="m:apply[*[1][self::m:eq]]">
 <xsl:call-template name="narry"/>
</xsl:template>

<xsl:template name="narry">
 <xsl:param name="x" select="*[position() &gt; 1]"/>
 <xsl:param name="r" select="'eq'"/>
 <OMA>
  <xsl:choose>
   <xsl:when test="count($x) &lt;3">
    <OMS cd="relation1" name="{$r}"/>
    <xsl:apply-templates select="$x[1]"/>
    <xsl:apply-templates select="$x[2]"/>
   </xsl:when>
   <xsl:otherwise>
    <OMS cd="logic1" name="and"/>
    <OMA>
     <OMS cd="relation1" name="{$r}"/>
     <xsl:apply-templates select="$x[1]"/>
     <xsl:apply-templates select="$x[2]"/>
    </OMA>
    <xsl:call-template name="narry">
     <xsl:with-param name="x" select="$x[position()&gt;1]"/>
     <xsl:with-param name="r" select="$r"/>
    </xsl:call-template>
   </xsl:otherwise>
  </xsl:choose>
 </OMA>
</xsl:template>

<!-- neq -->
<xsl:template match="m:neq"><OMS cd="relation1" name="neq"/></xsl:template>

<!-- lt, gt, leq, geq -->
<xsl:template match="m:apply[*[1][self::m:lt or self::m:gt or self::m:leq or self::m:geq]]">
 <xsl:call-template name="narry">
  <xsl:with-param name="r" select="local-name(*[1])"/>
 </xsl:call-template>
</xsl:template>


<!-- equivalent; ** follow chapter 4 (not appendix C) -->
<xsl:template match="m:equivalent"><OMS cd="logic1" name="equivalent"/></xsl:template>

<!-- approx -->
<xsl:template match="m:approx">
 <xsl:call-template name="narry">
  <xsl:with-param name="r" select="'approx'"/>
 </xsl:call-template>
</xsl:template>


<!-- int,sum,product + interval  -->
<xsl:template match="m:apply[*[self::m:int or self::m:sum or self::m:product]
                                  and m:interval and m:bvar]">
 <OMA>
  <xsl:choose>
   <xsl:when test="m:int"><OMS cd="calculus1" name="defint"/></xsl:when>
   <xsl:when test="m:sum"><OMS cd="arith1" name="sum"/></xsl:when>
   <xsl:when test="m:product"><OMS cd="arith1" name="product"/></xsl:when>
  </xsl:choose>
  <OMA>
   <OMS cd="interval1" name="interval"/>
   <xsl:apply-templates select="m:interval/*"/>
  </OMA>
  <OMBIND>
   <OMS  cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>


<xsl:template match="m:apply[*[1][self::m:tendsto]]">
  <OMA>
    <xsl:choose>
      <xsl:when test="@type='above'"><OMS cd="tendsto" name="from-above"/></xsl:when>
      <xsl:when test="@type='below'"><OMS cd="tendsto" name="from-below"/></xsl:when>
      <xsl:when test="@type='both-sides'"><OMS cd="tendsto" name="two-sided"/></xsl:when>
      <xsl:when test="not(@type)"><OMS cd="tendsto" name="two-sided"/></xsl:when>
      <xsl:otherwise><xsl:message>unrecognized tendsto type</xsl:message></xsl:otherwise>
    </xsl:choose>
    <xsl:apply-templates select="*[position() &gt; 1]"/>
  </OMA>
</xsl:template>

<!-- int,sum,product + condition  -->
<xsl:template match="m:apply[*[1][self::m:int or 
                                  self::m:sum or 
                                  self::m:product]
                                 and m:condition and m:bvar]">
 <OMA>
  <xsl:choose>
   <xsl:when test="m:int"><OMS cd="calculus1" name="defint"/></xsl:when>
   <xsl:when test="m:sum"><OMS cd="arith1" name="sum"/></xsl:when>
   <xsl:when test="m:product"><OMS cd="arith1" name="product"/></xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="m:condition/*"/>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>


<!-- int,sum,product + limits   -->
<xsl:template match="m:apply[*[1][self::m:int or 
                                  self::m:sum or 
                                  self::m:product]
                                  and m:lowlimit and m:bvar]">
 <OMA>
  <xsl:choose>
   <xsl:when test="m:int"><OMS cd="calculus1" name="defint"/></xsl:when>
   <xsl:when test="m:sum"><OMS cd="arith1" name="sum"/></xsl:when>
   <xsl:when test="m:product"><OMS cd="arith1" name="product"/></xsl:when>
  </xsl:choose>
  <OMA>
   <OMS cd="interval1" name="interval"/>
   <xsl:apply-templates select="m:lowlimit/*"/>
   <xsl:apply-templates select="m:uplimit/*"/>
  </OMA>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>

<xsl:template match="m:apply[*[1][self::m:int or 
                                  self::m:sum or 
                                  self::m:product]
                                  and m:domainofapplication and m:bvar]">
 <OMA>
  <xsl:choose>
   <xsl:when test="m:int"><OMS cd="calculus1" name="defint"/></xsl:when>
   <xsl:when test="m:sum"><OMS cd="arith1" name="sum"/></xsl:when>
   <xsl:when test="m:product"><OMS cd="arith1" name="product"/></xsl:when>
  </xsl:choose>
  <xsl:apply-templates select="m:domainofapplication/*"/>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>

<!-- limit -->
<xsl:template match="m:apply[*[1][self::m:limit]]">
 <xsl:variable name="bvar">
  <xsl:choose>
   <xsl:when test="m:bvar"><xsl:apply-templates select="m:bvar/*"/></xsl:when>
   <xsl:otherwise><xsl:apply-templates select="m:condition/m:tendsto/*[1]"/></xsl:otherwise>
  </xsl:choose>
 </xsl:variable>
 <OMA>
  <OMS cd="limit1" name="limit"/>
  <xsl:apply-templates select="m:lowlimit/*"/>
  <xsl:choose>
   <xsl:when test="m:condition">
    <OMS cd="limit1" name="{m:condition/m:tendsto/@type}"/>    
   </xsl:when>
   <xsl:otherwise><OMS cd="limit1" name="both_sides"/></xsl:otherwise>
  </xsl:choose>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:copy-of select="$bvar"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>




<!-- indefinite int -->
<xsl:template match="m:apply[*[1][self::m:int] and m:bvar and 
                     not(m:lowlimit or m:uplimit or m:condition or m:interval)]">
 <OMA>
  <OMS cd="calculus1" name="int"/>
  <OMBIND>
   <OMS  cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>

<xsl:template match="m:apply[*[1][self::m:int] and not(m:bvar)]">
 <OMA>
  <OMS cd="calculus1" name="int"/>
  <xsl:apply-templates select="*[last()]"/>
 </OMA>
</xsl:template>

<!-- diff ; ** take into account degree -->
<xsl:template match="m:diff"><OMS cd="calculus1" name="diff"/></xsl:template>
<xsl:template match="m:apply[*[1][self::m:diff] and m:bvar]">
 <OMA>
  <OMS cd="calculus1" name="diff"/>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="*[self::m:bvar]/m:ci"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>

<!-- partialdiff -->
<xsl:template match="m:partialdiff"><OMS cd="calculus1" name="partialdiff"/></xsl:template>
<xsl:template match="m:apply[*[1][self::m:partialdiff] and m:bvar]">
 <OMA>
  <OMS cd="calculus1" name="partialdiff"/>
  <OMA>
   <OMS cd="list1" name="list"/>
   <xsl:apply-templates select="*[self::m:bvar]/m:degree/*"/>    
  </OMA>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="*[self::m:bvar]/m:ci"/></OMBVAR>
   <xsl:apply-templates select="*[last()]"/>
  </OMBIND>
 </OMA>
</xsl:template>

<!-- divergence -->
<xsl:template match="m:divergence"><OMS cd="veccalc1" name="divergence"/></xsl:template>

<!-- grad -->
<xsl:template match="m:grad"><OMS cd="veccalc1" name="grad"/></xsl:template>

<!-- curl; ** build a lambda expression -->
<xsl:template match="m:curl"><OMS cd="veccalc1" name="curl"/></xsl:template>

<!-- laplacian -->
<xsl:template match="m:laplacian"><OMS cd="veccalc1" name="Laplacian"/></xsl:template>

<!-- set; ** do something about 'bvar' and 'condition' -->
<xsl:template match="m:set">
 <OMS cd="set1" name="set"/>
</xsl:template>

<xsl:template match="m:set[@type='multiset']">
 <OMS cd="multiset1" name="set"/>
</xsl:template>

<!-- list -->
<xsl:template match="m:list[not(m:condition)]">
 <OMA>
  <OMS cd="list1" name="list"/>
  <xsl:apply-templates/>
 </OMA>
</xsl:template>

<xsl:template match="m:list[m:condition and m:bvar]">
 <OMA>
  <OMS cd="list1" name="suchthat"/>
  <OMS cd="dummies" name="dummyset"/>
  <OMBIND>
   <OMS cd="fns1" name="lambda"/>
   <OMBVAR><xsl:apply-templates select="m:bvar/*"/></OMBVAR>
   <xsl:apply-templates select="m:condition/*"/>
  </OMBIND>
 </OMA>
</xsl:template>

<!-- set operators; ** do something definitionURL -->
<xsl:template match="m:emptyset|m:union|m:intersect|m:in|m:notin|m:setdiff
                    |m:subset|m:prsubset|m:notsubset|m:notprsubset">
 <OMS cd="set1" name="{local-name(.)}"/>
</xsl:template>

<!-- card; ** do something definitionURL -->
<xsl:template match="m:card">
 <OMS cd="set1" name="size"/>
</xsl:template>

<!-- cartesianproduct; ** do something definitionURL -->
<xsl:template match="m:cartesianproduct">
 <OMS cd="set1" name="cartesian_product"/>
</xsl:template>


<!-- log; ** fix not logbase -->
<xsl:template match="m:log">
 <OMS cd="arith1" name="minus"/>
</xsl:template>
<xsl:template match="m:apply[*[1][self::m:log]]">
 <OMA>
  <OMS cd="transc1" name="log"/>
  <xsl:choose>
   <xsl:when test="m:logbase">
    <xsl:apply-templates select="m:logbase/*"/>
    <xsl:apply-templates select="*[not(local-name()='logbase')]"/>
   </xsl:when>
   <xsl:otherwise>
    <OMI>10</OMI>
    <xsl:apply-templates select="*[2]"/>
   </xsl:otherwise>
  </xsl:choose>
 </OMA>
</xsl:template>

<!-- other transcendentals  -->
<xsl:template match="m:exp|m:ln|m:sin|m:cos|m:tan|m:sec|m:csc|m:cot|m:sinh
                    |m:cosh|m:tanh|m:sech|m:csch|m:coth|m:arcsin|m:arccos
                    |m:arctan|m:arcsec|m:arccsc|m:arccot|m:arcsinh|m:arccosh
                    |m:arctanh|m:arcsech|m:arccsch|m:arccoth">
 <OMS cd="transc1" name="{local-name(.)}"/>
</xsl:template>


<!-- sdev, variance, median, mode, mean-->
<xsl:template match="m:sdev|m:variance|m:median|m:mode|m:mean">
 <OMS cd="s_data1" name="{local-name(.)}"/>
</xsl:template>
<xsl:template match="m:apply[*[1][self::m:sdev or 
                                  self::m:variance or
                                  self::m:median or 
                                  self::m:mode or
                                  self::m:mean]
                             and last()=2]">
 <OMA>
  <OMS cd="s_dist1" name="{local-name(.)}"/>
  <xsl:apply-templates select="last()"/>
 </OMA>
</xsl:template>

<!-- moment, momentabout; ** fix this, when the spec is clear, 
                          ** do the  distinction between s_data and s_dist-->

<xsl:template match="m:apply[*[1][self::m:moment]]">
 <OMA>
  <OMS cd="s_dist1" name="{local-name(.)}"/>
  <xsl:choose>
   <xsl:when test="m:degree">
    <xsl:apply-templates select="m:degree/*"/>
   </xsl:when>
   <xsl:otherwise>
    <xsl:message>warning: no degree specified in moment(taking 0)!</xsl:message>
    <OMI>0</OMI>
   </xsl:otherwise>
  </xsl:choose>
  <xsl:choose>
   <xsl:when test="m:momentabout"><xsl:apply-templates select="m:momentabout/*"/></xsl:when>
   <xsl:otherwise><OMI>0</OMI></xsl:otherwise>
  </xsl:choose>
  <xsl:apply-templates select="*[last()]"/>
 </OMA>
</xsl:template>

<!-- vector; ** we are following chapter 4 not appendix C -->
<xsl:template match="m:vector">
 <OMA>
  <OMS cd="linalg3" name="vector"/>
  <xsl:apply-templates/>
 </OMA>
</xsl:template>

<!-- matrix, matrixrow -->
<xsl:template match="m:matrix|m:matrixrow">
 <OMA>
  <OMS cd="linalg2" name="{local-name(.)}"/>
  <xsl:apply-templates select="*[position() &gt; 1]"/>
 </OMA>
</xsl:template>

<!-- matrix, matrixrow -->
<xsl:template match="m:determinant|m:transpose">
 <OMS cd="linalg3" name="{local-name(.)}"/>
</xsl:template>

<!-- selector; ** fix this, the description seems underdefined  -->
<xsl:template match="m:selector">
 <OMS cd="linalg2" name="matrix_selector"/>
</xsl:template>

<!-- vectorproduct, scalarproduct, outerproduct -->
<xsl:template match="m:vectorproduct|m:scalarproduct|m:outerproduct">
 <OMS cd="linalg1" name="{local-name(.)}"/>
</xsl:template>

<!-- setnames -->
<xsl:template match="m:integers"><OMS cd="setname1" name="Z"/></xsl:template>
<xsl:template match="m:reals"><OMS cd="setname1" name="R"/></xsl:template>
<xsl:template match="m:rationals"><OMS cd="setname1" name="Q"/></xsl:template>
<xsl:template match="m:naturalnumbers"><OMS cd="setname1" name="N"/></xsl:template>
<xsl:template match="m:complexes"><OMS cd="setname1" name="C"/></xsl:template>
<xsl:template match="m:primes"><OMS cd="setname1" name="P"/></xsl:template>
<!-- special numbers -->
<xsl:template match="m:exponentiale"><OMS cd="nums1" name="e"/></xsl:template>
<xsl:template match="m:imaginaryi"><OMS cd="nums1" name="i"/></xsl:template>
<xsl:template match="m:pi"><OMS cd="nums1" name="pi"/></xsl:template>
<xsl:template match="m:eulergamma"><OMS cd="nums1" name="gamma"/></xsl:template>
<xsl:template match="m:notanumber"><OMS cd="nums1" name="NaN"/></xsl:template>
<xsl:template match="m:infinity"><OMS cd="nums1" name="infinity"/></xsl:template>
<xsl:template match="m:infinity[@type='complex']">
 <OMATTR>
  <OMATP>
   <OMS cd="mathmltypes" name="type"/>
   <OMS cd="mathmltypes" name="complex_type"/>
  </OMATP>
  <OMS cd="nums1" name="infinity"/>
</OMATTR>
</xsl:template>
<!-- truth values -->

<xsl:template match="m:true|m:false"><OMS cd="logic1" name="{local-name(.)}"/></xsl:template>

<!-- piecewise, piece, otherwise -->
<xsl:template match="m:piecewise|m:piece|m:otherwise">
  <OMA>
    <OMS cd="piece1" name="{local-name(.)}"/>
    <xsl:apply-templates/>
  </OMA>
</xsl:template>

<!-- todo:
     - fix all the ** (problem here)
     - should we issue warnings for the non-supported stuff that is silently dropped? 
     - what to do about m:cn without type?
  -->

</xsl:stylesheet>

