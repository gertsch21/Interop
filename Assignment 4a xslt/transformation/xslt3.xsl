<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">

<xsl:element name="root"> 
<xsl:for-each select="//Artist[not(FirstName = preceding::Artist/FirstName and LastName = preceding::Artist/LastName)]">
<xsl:sort select="LastName"/>
<xsl:element name="artist">
	<xsl:attribute name="artist_id">
		<xsl:text>0</xsl:text>
	</xsl:attribute>
	<xsl:element name="first_name">
		<xsl:value-of select="FirstName"/>
	</xsl:element>
	<xsl:element name="last_name">
		<xsl:value-of select="LastName"/>
	</xsl:element>
    <xsl:element name="plans">
	
		<!--<time><xsl:value-of select="FirstName/../../EndTimestamp"/></time> --> <!-- would be to get the project data-->
		<xsl:element name="plan">
			<!-- <xsl:attribute name="plan_id"> -->
				<!-- <xsl:text>0</xsl:text> -->
			<!-- </xsl:attribute> -->
			<!-- <xsl:attribute name="status"> -->
				<!-- <xsl:text>not known</xsl:text> -->
			<!-- </xsl:attribute> -->
			<!-- <xsl:attribute name="priority"> -->
				<!-- <xsl:text>not known</xsl:text> -->
			<!-- </xsl:attribute> -->
			<!-- <xsl:element name="endproduct_name"> -->
				<!-- <xsl:text>The cyan terrible Box</xsl:text>			 -->
			<!-- </xsl:element> -->
			<!-- <xsl:element name="basic_instruction"> -->
				<!-- <xsl:text>Please design me a Box</xsl:text> -->
			<!-- </xsl:element> -->
			<!-- <xsl:element name="involved_worker"> -->
				<!-- <xsl:attribute name="svnr"> -->
					<!-- <xsl:text>5501261178</xsl:text> -->
				<!-- </xsl:attribute> -->
				<!-- <xsl:attribute name="entrydate"> -->
					<!-- <xsl:text>2013-08-18</xsl:text> -->
				<!-- </xsl:attribute> -->
				<!-- <xsl:attribute name="unique_feature"> -->
					<!-- <xsl:text>self-confident</xsl:text> -->
				<!-- </xsl:attribute> -->
				<!-- <xsl:element name="first_name"> -->
					<!-- <xsl:text>Ann</xsl:text> -->
				<!-- </xsl:element> -->
				<!-- <xsl:element name="last_name"> -->
					<!-- <xsl:text>Gates</xsl:text> -->
				<!-- </xsl:element> -->
			<!-- </xsl:element> -->
		</xsl:element>
	</xsl:element>
</xsl:element>
</xsl:for-each>
</xsl:element>
</xsl:template>
</xsl:stylesheet>


