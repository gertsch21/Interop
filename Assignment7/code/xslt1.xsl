<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	
	<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://www.example.org/">
		
		<xsl:for-each select="//warehouse_zugeordnet">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/warehouses/', @warehouse_id)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/warehouse"/>
				<hasWarehousename>
					<xsl:value-of select="concat('http://www.example.org/warehousenames/', warehousename)" />
				</hasWarehousename>
				
				
				
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
		
		
		<xsl:for-each select="//worker">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/workers/', @svnr)" />
				</xsl:attribute>
				
				<rdf:type rdf:resource="http://www.example.org/person"/>
				
				<inWarehouse>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/warehouses/', warehouse_zugeordnet/@warehouse_id)" />
					</xsl:attribute>
				</inWarehouse>
				
				<hasFirstname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/', firstname)" />
					</xsl:attribute>
				</hasFirstname>
				<hasLastname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/', lastname)" />
					</xsl:attribute>
				</hasLastname>
				<hasNickname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/', nickname)" />
					</xsl:attribute>
				</hasNickname>
				
			</rdf:Description>
			
		</xsl:for-each>
		
		
	</rdf:RDF>
</xsl:template>

</xsl:stylesheet>
