<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
                
<xsl:template match="/">
	<html><head><title>OMdoc localized elements</title></head>
		<body>
		<blockquote>
		<table border="0" cellpadding="3">
			<xsl:apply-templates/>
		</table>
		</blockquote>
		</body>
		</html>
</xsl:template>
                
<xsl:template match="key">
		<tr>
			<td><h3>&lt;<xsl:value-of select="@name"/>&gt;</h3></td>
			<xsl:apply-templates/>
		</tr>
</xsl:template>

<xsl:template match="value">
		<td><xsl:apply-templates/></td>
</xsl:template>

</xsl:stylesheet>
