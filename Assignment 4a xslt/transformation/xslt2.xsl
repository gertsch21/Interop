<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<xsl:element name="root"> 

<xsl:element name="warehouse">
	<xsl:attribute name="warehouse_id">
		<xsl:text>1</xsl:text>
	</xsl:attribute>
	<xsl:attribute name="country">
		<xsl:text>Austria</xsl:text>
	</xsl:attribute>
	<xsl:element name="warehousename">
		<xsl:text>The green kind warehouse</xsl:text>
	</xsl:element>
	<xsl:element name="gla">
		<xsl:text>100</xsl:text>
	</xsl:element>
	<xsl:element name="printers">
		<xsl:for-each select="//Printer">
			<xsl:element name="printer">
				<xsl:attribute name="printer_id">
					<xsl:value-of select="@SerialNo"/>
				</xsl:attribute>
				<xsl:element name="printer_info">
					<xsl:element name="name">
						<xsl:text>not known</xsl:text>
					</xsl:element>
					<xsl:element name="weight">
						<xsl:text>1</xsl:text>
					</xsl:element>
					<xsl:element name="measurements">
						<xsl:element name="print_width">
							<xsl:text>1</xsl:text>
						</xsl:element>
						<xsl:element name="print_depth">
							<xsl:text>1</xsl:text>
						</xsl:element>
						<xsl:element name="print_height">
							<xsl:text>1</xsl:text>
						</xsl:element>
					</xsl:element>
				</xsl:element>
				<extruder_type>
					<!--<xsl:value-of select="@Type"/>--> <!--darf nur bestimmte werte annehmen, die mein kollege nicht gesetzt hat(Direct, Hotend, Bowden, oder leer)-->
				</extruder_type>
				<xsl:element name="price">
					<xsl:text>1</xsl:text>
				</xsl:element>
				<printed_plans>
					<!-- no information about which printer printed a specific plan -->
				</printed_plans>
			</xsl:element>
		</xsl:for-each>
	</xsl:element>
</xsl:element>
</xsl:element>
</xsl:template>
</xsl:stylesheet>


