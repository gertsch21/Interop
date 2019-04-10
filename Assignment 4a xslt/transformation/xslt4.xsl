<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<xsl:element name="root"> 
<xsl:element name="worker">
	<xsl:attribute name="svnr">
		<xsl:text>1111111111</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="entrydate">
		<xsl:text>2000-01-01</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="unique_feature">
		<xsl:text></xsl:text>
	</xsl:attribute>
	<xsl:element name="first_name">
		<xsl:text>firstname</xsl:text>
	</xsl:element>
	<xsl:element name="last_name">
		<xsl:text>lastname</xsl:text>
	</xsl:element>
	<xsl:element name="nickname">
		<xsl:text>nickname</xsl:text>
	</xsl:element>
	<xsl:element name="plans">
		<xsl:for-each select="//Project">
		<xsl:sort select="@ID"/>
		<xsl:element name="plan">
			<xsl:attribute name="plan_id">
				<xsl:value-of select="@ID"/>
			</xsl:attribute>
			<xsl:attribute name="status">
				<xsl:text>not known</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="priority">
				<xsl:text>not known</xsl:text>
			</xsl:attribute>
			<xsl:element name="endproduct_name">
				<xsl:text>not known</xsl:text>
			</xsl:element>
		</xsl:element>
		</xsl:for-each>
	</xsl:element>
	<shopping_items/>
</xsl:element>
</xsl:element>
</xsl:template>
</xsl:stylesheet>


