<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<xsl:element name="root"> 
<xsl:element name="worker">
	<xsl:attribute name="svnr">
		<xsl:text>1001201187</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="entrydate">
		<xsl:text>2017-04-02</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="unique_feature">
		<xsl:text>moody</xsl:text>
	</xsl:attribute>
	<xsl:element name="first_name">
		<xsl:text>Ann</xsl:text>
	</xsl:element>
	<xsl:element name="last_name">
		<xsl:text>Gates</xsl:text>
	</xsl:element>
	<xsl:element name="nickname">
		<xsl:text>Piano Red</xsl:text>
	</xsl:element>
	<xsl:element name="plans">
		<xsl:for-each select="//Project">
		<xsl:sort select="@ID"/>
		<xsl:element name="plan">
			<xsl:attribute name="plan_id">
				<xsl:value-of select="@ID"/>
			</xsl:attribute>
			<xsl:attribute name="status">
				<xsl:text>ready to prepare</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="priority">
				<xsl:text>high</xsl:text>
			</xsl:attribute>
			<xsl:element name="endproduct_name">
				<xsl:text>The red wine Monitor</xsl:text>
			</xsl:element>
		</xsl:element>
		</xsl:for-each>
	</xsl:element>
	<shopping_items/>
</xsl:element>
</xsl:element>
</xsl:template>
</xsl:stylesheet>


