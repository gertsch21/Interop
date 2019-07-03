<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	
	<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://www.example.org/">
		
		<xsl:for-each select="//artist">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/artists/', @artist_id)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/artist"/>
				<hasFirstname>
					<xsl:value-of select="concat('http://www.example.org/warehousenames/', first_name)" />
				</hasFirstname>
				<hasLastname>
					<xsl:value-of select="concat('http://www.example.org/warehousenames/', last_name)" />
				</hasLastname>
			</rdf:Description>			
		</xsl:for-each>
		
		
		<xsl:for-each select="//plan">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/plans/', @plan_id)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/plan"/>
				<isEndproduct>
					<xsl:value-of select="concat('http://www.example.org/endproducts/', endproduct_name)" />
				</isEndproduct>
				<hasWorker>
					<xsl:value-of select="concat('http://www.example.org/workers/', involved_worker/@svnr)" />
				</hasWorker>
				<hasArtist>
					<xsl:value-of select="concat('http://www.example.org/artists/', ../../@artist_id)" />
				</hasArtist>
			</rdf:Description>			
		</xsl:for-each>
		
	</rdf:RDF>
</xsl:template>

</xsl:stylesheet>
