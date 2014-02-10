<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="no"
		indent="yes" />
	<xsl:param name="versionParam" select="'1.0'" />

	<!-- Styles -->
	<xsl:include href="styles.xsl"/>
	
	<!-- Common Templates -->
	<xsl:include href="documentos_part.xsl"/>
	<xsl:include href="dynamicFormValues_part.xsl" />
	<xsl:include href="servicoonline_general_part.xsl"/>

	<!-- ROOT -->
	<xsl:template match="root">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simpleA4"
					page-height="29.7cm" page-width="21cm" margin-top="2cm"
					margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
					<fo:region-body />
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simpleA4">
				<fo:flow flow-name="xsl-region-body">
				
					<!-- Header Space -->
					<fo:block space-after="4cm"></fo:block>

					<!-- Titulo -->
					<fo:block space-after="1cm" text-align="center"
						font-family="Helvetica" font-weight="bold" font-size="16pt">
						Resumo do processo "
						<xsl:value-of select="ServicoOnlineElement/idProcessoEntidade" />
						"
						(
						<xsl:value-of select="ServicoOnlineElement/processo" />
						)
					</fo:block>

					<!-- Processo Info -->
					<xsl:apply-templates select="ServicoOnlineElement" />

					<!-- Informacao Instrucao -->
					<xsl:apply-templates select="FormInstanceElement" />
					
					<xsl:apply-templates select="FormInstrucao" />

					<!-- Documentos -->
					<xsl:if test="ServicoOnlineElement/documentos/DocumentoElement">
						<fo:block xsl:use-attribute-sets="titulo-att"
							space-before="1cm" space-after="5mm">Documentos:</fo:block>
						<xsl:apply-templates select="ServicoOnlineElement/documentos" />
					</xsl:if>
					<xsl:if test="ServicoOnlineElement/pai/documentos/DocumentoElement">
						<fo:block xsl:use-attribute-sets="titulo-att"
							space-before="1cm" space-after="5mm">Documentos Processo Principal:
						</fo:block>
						<xsl:apply-templates select="ServicoOnlineElement/pai/documentos" />
					</xsl:if>

					<!-- Etapas -->
					<xsl:if test="list/LogEntryCollection">
						<xsl:apply-templates select="list" />
					</xsl:if>

				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>

	${xslExtensionPart}
	
</xsl:stylesheet>