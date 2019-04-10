<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<root> 
<warehouse>
	<gla></gla>
	<printers>
		<xsl:for-each select="//Printer[not(@SerialNo = preceding::Printer/@SerialNo)]">
		<xsl:sort select="@SerialNo"/>
			<plan>
				<xsl:attribute name="printer_id">
					<xsl:value-of select="@SerialNo"/></xsl:attribute>
			</plan>
		</xsl:for-each>
	</printers>
</warehouse>
</root>
</xsl:template>
</xsl:stylesheet>


