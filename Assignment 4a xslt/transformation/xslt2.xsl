<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<root> 
<warehouse warehouse_id="1" country="Austria">
	<warehousename>The green kind warehouse</warehousename>
	<gla>100</gla>
	<printers>
		<xsl:for-each select="//Printer">
			<printer>
				<xsl:attribute name="printer_id">
					<xsl:value-of select="@SerialNo"/>
				</xsl:attribute>
				<printer_info>
					<name>printername</name>
					<weight>20</weight>
					<measurements>
						<print_width>11</print_width>
						<print_depth>11</print_depth>
						<print_height>11</print_height>
					</measurements>
				</printer_info>
				<extruder_type>
					<!--<xsl:value-of select="@Type"/>--> <!--darf nur bestimmte werte annehmen, die mein kollege nicht gesetzt hat(Direct, Hotend, Bowden, oder leer)-->
				</extruder_type>
				<price>100</price>
				<printed_plans>
					<!-- no information about which printer printed a specific plan -->
				</printed_plans>
			</printer>
		</xsl:for-each>
	</printers>
</warehouse>
</root>
</xsl:template>
</xsl:stylesheet>


