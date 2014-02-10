<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">

	<xsl:attribute-set name="base-font">
		<xsl:attribute name="font-style">normal</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="titulo-att"
		use-attribute-sets="base-font">
		<xsl:attribute name="text-align">center</xsl:attribute>
		<xsl:attribute name="font-size">12pt</xsl:attribute>
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="text-att"
		use-attribute-sets="base-font">
		<xsl:attribute name="font-size">10pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="label-att"
		use-attribute-sets="text-att">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="small-text-att"
		use-attribute-sets="base-font">
		<xsl:attribute name="font-size">8pt</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="small-label-att"
		use-attribute-sets="small-text-att">
		<xsl:attribute name="font-weight">bold</xsl:attribute>
	</xsl:attribute-set>
	<xsl:attribute-set name="table-cell-att">
		<xsl:attribute name="border">1pt solid gray</xsl:attribute>
	</xsl:attribute-set>

</xsl:stylesheet>