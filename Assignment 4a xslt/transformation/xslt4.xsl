<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<root> 
<worker svnr="1001201187" entrydate="2017-04-02" unique_feature="moody">
	<first_name>Christopher</first_name>
	<last_name>Washington</last_name>
	<nickname> Piano Red</nickname>
	<plans>
		<xsl:for-each select="//Project">
		<xsl:sort select="@ID"/>
			<plan status="ready to prepare" priority="high">
				<xsl:attribute name="plan_id">
					<xsl:value-of select="@ID"/>
				</xsl:attribute>
				<endproduct_name>The red wine Monitor</endproduct_name>
			</plan>
		</xsl:for-each>
	</plans>
	<shopping_items/>
</worker>
</root>
</xsl:template>
</xsl:stylesheet>


