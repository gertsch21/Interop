<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	
	<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns="http://www.example.org/">
		
		<xsl:for-each select="//worker">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/workers/', @svnr)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/worker"/>
				<hasFirstname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/firstnames/', first_name)" />
					</xsl:attribute>
				</hasFirstname>
				<hasLastname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/lastnames/', last_name)" />
					</xsl:attribute>
				</hasLastname>
				<hasNickname>
					<xsl:attribute name="rdf:resource">
						<xsl:value-of select="concat('http://www.example.org/nicknames/', nickname)" />
					</xsl:attribute>
				</hasNickname>
				
			</rdf:Description>			
		</xsl:for-each>
		
		
		<xsl:for-each select="//item">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/items/', @item_id)" />
				</xsl:attribute>
				<rdf:type rdf:resource="http://www.example.org/item"/>
				<is_finished>
					<xsl:value-of select="concat('http://www.example.org/is_finished/', @is_finished)" />
				</is_finished>
				<hasName>
					<xsl:value-of select="concat('http://www.example.org/item_names/', ./item_info/buying_info/name)" />
				</hasName>
				<hasSellerSuggestion>
					<xsl:value-of select="concat('http://www.example.org/seller_suggestion/', ./item_info/buying_info/seller_suggestion)" />
				</hasSellerSuggestion>
				<hasAdditionalInfo>
					<xsl:value-of select="./item_info/additional_info" />
				</hasAdditionalInfo>
				<hasDueDate>
					<xsl:value-of select="due_date" />
				</hasDueDate>
				<hasListEntryDate>
					<xsl:value-of select="list_entry_date" />
				</hasListEntryDate>
			</rdf:Description>			
		</xsl:for-each>
		
		
		<xsl:for-each select="//plan">
			<rdf:Description>
				<xsl:attribute name="rdf:about">
					<xsl:value-of select="concat('http://www.example.org/plans/', @plan_id)" />
				</xsl:attribute>
				
				<rdf:type rdf:resource="http://www.example.org/plan"/>
				
				
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
				
			</rdf:Description>
			
		</xsl:for-each>
		
		
	</rdf:RDF>
</xsl:template>

</xsl:stylesheet>
