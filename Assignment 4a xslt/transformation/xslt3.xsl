<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<root> 
<xsl:for-each select="//Artist[not(FirstName = preceding::Artist/FirstName and LastName = preceding::Artist/LastName)]">
<xsl:sort select="LastName"/>
<artist  artist_id="122521">
      <first_name><xsl:value-of select="FirstName"/></first_name>
      <last_name><xsl:value-of select="LastName"/></last_name>
      <plans>
		<!--<time><xsl:value-of select="FirstName/../../EndTimestamp"/></time> --> <!-- would be to get the project data-->
			<plan plan_id="356" status="almost finished" priority="very low">
				<endproduct_name>The cyan terrible Box</endproduct_name>
				<basic_instruction>Please design me a Box</basic_instruction>
				<involved_worker svnr="5501261178" entrydate="2013-08-18" unique_feature="self-confident">
					<first_name>Ann</first_name>
					<last_name>Gates</last_name>
				</involved_worker>
			</plan>
      </plans>
</artist>
</xsl:for-each>
</root>
</xsl:template>
</xsl:stylesheet>


