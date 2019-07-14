<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	
	<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://www.example.org/">
		
		<xsl:for-each select="//warehouse">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/warehouses/', @warehouse_id)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/warehouse"/>
				<hasWarehousename>
					<xsl:value-of select="concat('http://www.example.org/warehousenames/', warehousename)" />
				</hasWarehousename>
				<hasGLA>
					<xsl:value-of select="gla" />
				</hasGLA>
				
			</rdf:Description>			
		</xsl:for-each>
		
		
		<xsl:for-each select="//printer">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/printers/', @printer_id)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/printer"/>
				<hasPrintername>
					<xsl:value-of select="concat('http://www.example.org/printernames/', printer_info/name)" />
				</hasPrintername>
				<inWarehouse>
						<xsl:value-of select="concat('http://www.example.org/warehouses/', ../../@warehouse_id)" />
				</inWarehouse>
			</rdf:Description>			
		</xsl:for-each>
		
		
		<xsl:for-each select="//plan">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/plans/', @plan_id)" />
				</xsl:attribute>
				
				<rdf:type rdf:resource="http://www.example.org/plan"/>
				
				<fromPrinter>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/printer/', ../../@printer_id)" />
					</xsl:attribute>
				</fromPrinter>
				<status>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/status/', @status)" />
					</xsl:attribute>
				</status>
				<priority>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/priority/', @priority)" />
					</xsl:attribute>
				</priority>
				
				<hasEndproductname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/endproducts/', ./endproduct_name)" />
					</xsl:attribute>
				</hasEndproductname>
				<hasInstruction>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="basic_instruction" />
					</xsl:attribute>
				</hasInstruction>
				
			</rdf:Description>
			
		</xsl:for-each>
		
		
	</rdf:RDF>
</xsl:template>

</xsl:stylesheet>
