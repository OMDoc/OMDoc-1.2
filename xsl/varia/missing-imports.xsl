<?xml version="1.0" encoding="utf-8"?>

<!-- An XSL style sheet that generates import elements for theories that
     are referenced by some OMS/@cd attributes but not imported.
     The output is ready to be pasted into the input file.
     Copyright (c) 2006 Christoph Lange
     This style sheet is released under the GNU General Public License
     Initial version 2006-04-09 by Christoph Lange, 
     send bug-reports, patches, suggestions to developers@omdoc.org
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:omdoc="http://www.mathweb.org/omdoc" 
  xmlns:om="http://www.openmath.org/OpenMath"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  version="2.0">

    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="node()|@*">
	<xsl:copy>
	    <xsl:apply-templates select="node()|@*"/>
	</xsl:copy>
    </xsl:template>

    <xsl:template match="omdoc:theory">
	<xsl:copy>
	    <xsl:apply-templates select="@xml:id"/>
	    <xsl:variable name="theory" select="if (ends-with(@xml:id, '.theory'))
		then substring-before(@xml:id, '.theory') else @xml:id"/>
	    <xsl:variable name="focus" select="."/>
	    <xsl:for-each-group select="descendant::om:OMS[ancestor::omdoc:theory[1] is $focus]" group-by="@cd">
		<xsl:sort select="@cd"/>
		<xsl:variable name="cd" select="@cd"/>
		<xsl:if test="not($focus/omdoc:imports[starts-with(@from, $cd)] or $theory eq $cd)">
		    <xsl:element name="omdoc:imports">
			<xsl:attribute name="xml:id" select="concat($theory, '-imports-', $cd)"/>
			<xsl:attribute name="from" select="concat($cd, '.omdoc#', $cd)"/>
		    </xsl:element>
		</xsl:if>
	    </xsl:for-each-group>
	    <xsl:apply-templates select="omdoc:theory"/>
	</xsl:copy>
    </xsl:template>

    <xsl:template match="omdoc:omdoc">
	<xsl:copy>
	    <xsl:apply-templates select="omdoc:theory"/>
	</xsl:copy>
    </xsl:template>

    <xsl:template match="/">
	<xsl:apply-templates select="omdoc:omdoc"/>
    </xsl:template>

</xsl:stylesheet>
