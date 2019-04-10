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
	<xsl:element name="firstname">
		<xsl:text>firstname</xsl:text>
	</xsl:element>
	<xsl:element name="lastname">
		<xsl:text>lastname</xsl:text>
	</xsl:element>
	<xsl:element name="nickname">
		<xsl:text>nickname</xsl:text>
	</xsl:element>
	<xsl:element name="warehouse_zugeordnet">
		<xsl:attribute name="warehouse_id">
			<xsl:text>1</xsl:text>
		</xsl:attribute>
		<xsl:element name="warehousename">
			<xsl:text>Warehousename</xsl:text>
		</xsl:element>
		<xsl:element name="printers">
			<xsl:for-each select="//Printer">
				<xsl:element name="printer">
					<xsl:attribute name="printer_id">
						<xsl:value-of select="@SerialNo"/>
					</xsl:attribute>
					<xsl:element name="printer_info">
						<xsl:element name="name">
							<xsl:text>printername</xsl:text>
						</xsl:element>
						<xsl:element name="weight">
							<xsl:text>20</xsl:text>
						</xsl:element>
						<xsl:element name="measurements">
							<xsl:element name="print_width">
								<xsl:text>11</xsl:text>
							</xsl:element>
							<xsl:element name="print_depth">
								<xsl:text>11</xsl:text>
							</xsl:element>
							<xsl:element name="print_height">
								<xsl:text>11</xsl:text>
							</xsl:element>
						</xsl:element>
					</xsl:element>
					<extruder_type>
						<!--<xsl:value-of select="@Type"/>--> <!--darf nur bestimmte werte annehmen, die mein kollege nicht gesetzt hat(Direct, Hotend, Bowden, oder leer)-->
					</extruder_type>
					<price>100</price>
					
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:element>  
</xsl:element>
</xsl:element>
</xsl:template>
</xsl:stylesheet>


