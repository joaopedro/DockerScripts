<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">

	<xsl:template match="documentos">
		<fo:block>
			<fo:table>
				
				<fo:table-column column-width="33mm" />
				<fo:table-column column-width="23mm" />
				<fo:table-column column-width="30mm" />
				<fo:table-column column-width="43mm" />
				<fo:table-column column-width="42mm" />
				<fo:table-header background-color="#E7E8E9">
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="label-att">Data</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="label-att">N. Documento</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="label-att">Autor</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="label-att">Tipo</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="label-att">Designacao</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="DocumentoElement">
						<fo:table-row>
							<fo:table-cell xsl:use-attribute-sets="table-cell-att">
								<fo:block xsl:use-attribute-sets="text-att">
									<xsl:value-of select="data" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="table-cell-att">
								<fo:block xsl:use-attribute-sets="text-att">
									<xsl:value-of select="numeroDocumento" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="table-cell-att">
								<fo:block xsl:use-attribute-sets="text-att">
									<xsl:value-of select="autor" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="table-cell-att">
								<fo:block xsl:use-attribute-sets="text-att">
									<xsl:value-of select="tipo" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell xsl:use-attribute-sets="table-cell-att">
								<fo:block xsl:use-attribute-sets="text-att">
									<xsl:value-of select="designacao" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

</xsl:stylesheet>