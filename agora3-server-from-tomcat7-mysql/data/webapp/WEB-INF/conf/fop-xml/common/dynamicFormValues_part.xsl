<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">

	<xsl:template match="values">
		<xsl:apply-templates select="child::*" />
	</xsl:template>

	<xsl:template match="values" mode="nested">
		<xsl:apply-templates select="child::*" mode="nested"/>
	</xsl:template>
	
	<xsl:template match="com.sinfic.ipdms.tramitacao.pdf.xml.pojo.dynamic.SimpleFieldInstance">
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"><xsl:value-of select="label" />: </fo:inline>
			<xsl:value-of select="value" />
		</fo:block>
	</xsl:template>

	<xsl:template match="com.sinfic.ipdms.tramitacao.pdf.xml.pojo.dynamic.SimpleFieldInstance" mode="nested">
		<fo:block xsl:use-attribute-sets="small-text-att">
			<fo:inline xsl:use-attribute-sets="small-label-att"><xsl:value-of select="label" />: </fo:inline>
			<xsl:value-of select="value" />
		</fo:block>
	</xsl:template>

	
	<xsl:template match="com.sinfic.ipdms.tramitacao.pdf.xml.pojo.dynamic.TableFieldInstance">
		<fo:block xsl:use-attribute-sets="label-att">
			<xsl:value-of select="label" />:
		</fo:block>
		<fo:block>
			<fo:table>
				<xsl:for-each select="headers/TableCell">
					<fo:table-column  />		
				</xsl:for-each>
				
				<fo:table-header>
					<fo:table-row>
					<xsl:for-each select="headers/TableCell">
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="label-att">
								<xsl:value-of select="value" />
							</fo:block>
						</fo:table-cell>	
					</xsl:for-each>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="rows/TableRow">
					<fo:table-row>
						<xsl:for-each select="rowValues/*">	
							<fo:table-cell xsl:use-attribute-sets="table-cell-att">
								<fo:block xsl:use-attribute-sets="text-att">
									<xsl:choose>
										<xsl:when test="value">
											<xsl:value-of select="value" />&#160;
										</xsl:when>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
						</xsl:for-each>
					</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
</xsl:stylesheet>