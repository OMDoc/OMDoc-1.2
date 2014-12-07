<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:omdoc="http://www.mathweb.org/omdoc"
				xmlns:oso="http://www.mathweb.org/omdoc/system−ontology#"
				xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
				exclude-result-prefixes="omdoc oso"
				>


<!-- matches any theory -->
<xsl:template match="omdoc:theory">
		<rdf:Description rdf:about="{concat('#',@xml:id)}">
			<rdf:type rdf:resource="oso:Theory"/>
		</rdf:Description>
</xsl:template>

<!-- matches any symboll -->
<xsl:template match="omdoc:symbol">
		<rdf:Description rdf:about="{concat('#',@xml:id)}">
			<rdf:type rdf:resource="oso:Symbol"/>
		</rdf:Description>
</xsl:template>

<!-- matches any example -->
<xsl:template match="omdoc:example">
	<rdf:Description rdf:about="{concat('#',@xml:id)}">
		<rdf:type rdf:resource="oso:Example"/>
		<oso:exemplifies rdf:resource="@xml:id"/>
	</rdf:Description>
</xsl:template>

<xsl:template match="omdoc:omdoc">
	<xsl:document href="out.rdf" indent="yes">
	<rdf:RDF>
		<xsl:apply-templates select="//omdoc:theory"/>
		<xsl:apply-templates select="//omdoc:symbol"/>
		<xsl:apply-templates select="//omdoc:example"/>
	</rdf:RDF>
	</xsl:document>
</xsl:template>

</xsl:stylesheet>