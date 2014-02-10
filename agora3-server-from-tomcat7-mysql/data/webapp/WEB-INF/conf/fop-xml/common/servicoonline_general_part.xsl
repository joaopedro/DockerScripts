<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format"
	exclude-result-prefixes="fo">

	<xsl:template match="ServicoOnlineElement">
		<!-- Common Attributes -->
		<fo:block space-after="5mm" xsl:use-attribute-sets="titulo-att">Informação
			sobre o processo:</fo:block>

		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Nº. Processo:
			</fo:inline>
			<xsl:value-of select="idProcessoEntidade" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Tipo Processo:
			</fo:inline>
			<xsl:value-of select="variante" />
			-
			<xsl:value-of select="processo" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Data de entrada:
			</fo:inline>
			<xsl:value-of select="dataPreenchimento" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Utilizador Instrução:
			</fo:inline>
			<xsl:value-of select="colaboradorInstrucao" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Assunto: </fo:inline>
			<xsl:value-of select="assunto" />
		</fo:block>

		<!-- Entidade Info -->
		<xsl:if test="entidade">
			<fo:block space-before="5mm" xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">Nome Entidade:
				</fo:inline>
				<xsl:value-of select="entidade/nome" />
			</fo:block>
			<fo:block xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">NIF Entidade:
				</fo:inline>
				<xsl:value-of select="entidade/nif" />
			</fo:block>
			<fo:block xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">BI Entidade:</fo:inline>
				<xsl:value-of select="entidade/bi" />
			</fo:block>
		</xsl:if>
	</xsl:template>

	<xsl:template match="FormInstanceElement">
		<fo:block space-before="1cm" space-after="5mm"
			xsl:use-attribute-sets="titulo-att">Valores do Formulário Dinâmico</fo:block>
		<xsl:choose>
			<xsl:when test="values">
				<xsl:apply-templates select="values" />
			</xsl:when>
			<xsl:otherwise>
				<fo:block xsl:use-attribute-sets="label-att">Nenhum valor a apresentar
				</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<xsl:template match="LogEntryCollection">
		<fo:block space-before="1cm" space-after="5mm"
			xsl:use-attribute-sets="titulo-att">
			Lista de Etapas
			<xsl:if test="remoteSystem != ''">
				no sistema
				<xsl:value-of select="remoteSystem" />
			</xsl:if>
			para o
			<xsl:choose>
				<xsl:when test="subprocess = 'false'">
					Principal
				</xsl:when>
				<xsl:otherwise>
					Sub-Processo
				</xsl:otherwise>
			</xsl:choose>
			<xsl:value-of select="idprocess" />
		</fo:block>

		<fo:block>
			<fo:table>
				<fo:table-column column-width="20mm" />
				<fo:table-column column-width="13mm" />
				<fo:table-column column-width="26mm" />
				<fo:table-column column-width="26mm" />
				<fo:table-column column-width="25mm" />
				<fo:table-column column-width="25mm" />
				<fo:table-column column-width="20mm" />
				<fo:table-column column-width="20mm" />
				<fo:table-header background-color="#E7E8E9">
					<fo:table-row>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Etapa</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Acção</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Inicio</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Fim</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Respondido Por</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Assignado a</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Resposta</fo:block>
						</fo:table-cell>
						<fo:table-cell xsl:use-attribute-sets="table-cell-att">
							<fo:block xsl:use-attribute-sets="small-label-att">Comentario</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-header>
				<fo:table-body>
					<xsl:for-each select="entries">
						<xsl:apply-templates select="." />
					</xsl:for-each>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>

	<xsl:template
		match="com.sinfic.ipdms.tramitacao.pdf.xml.pojo.processo.SubProcessElement">
		<fo:table-row>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att"
				number-columns-spanned="8">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="variante" />
					-
					<xsl:value-of select="idProcesso" />
					(
					<xsl:value-of select="data" />
					)
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

	<xsl:template
		match="com.sinfic.ipdms.tramitacao.pdf.xml.pojo.processo.LogEntryElement">
		<fo:table-row>
			<!-- Estes choose encadeados servem para determinar o number rows spanned, que poderá
				nenhum, 3, ou 4, dependendo se a etapa tiver sido submitida com certificado ou não e
				se a etapa tem um formulário dinamico associado ou nao -->
			<xsl:choose>
				<xsl:when test="atributosEtapa/values">
					<xsl:choose>
						<xsl:when test="certificateSubjectName">
							<fo:table-cell xsl:use-attribute-sets="table-cell-att" number-rows-spanned="4">
								<fo:block xsl:use-attribute-sets="small-text-att">
									<xsl:value-of select="etapa" />
								</fo:block>
							</fo:table-cell>
						</xsl:when>
						<xsl:otherwise>
							<fo:table-cell xsl:use-attribute-sets="table-cell-att" number-rows-spanned="3">
								<fo:block xsl:use-attribute-sets="small-text-att">
									<xsl:value-of select="etapa" />
								</fo:block>
							</fo:table-cell>
						</xsl:otherwise>
					</xsl:choose>			
				</xsl:when>
				<xsl:otherwise>
					<fo:table-cell xsl:use-attribute-sets="table-cell-att">
						<fo:block xsl:use-attribute-sets="small-text-att">
							<xsl:value-of select="etapa" />
						</fo:block>
					</fo:table-cell>
				</xsl:otherwise>
			</xsl:choose>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="accao" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="inicio" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="fim" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="respondido" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:for-each select="assignado/string">
						<xsl:value-of select="." />
						<xsl:if test="position()!=last()">
							,
						</xsl:if>
					</xsl:for-each>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="resultado" />
				</fo:block>
			</fo:table-cell>
			<fo:table-cell xsl:use-attribute-sets="table-cell-att">
				<fo:block xsl:use-attribute-sets="small-text-att">
					<xsl:value-of select="comentario" />
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
		<xsl:if test="certificateSubjectName">
			<fo:table-row>
				<fo:table-cell number-columns-spanned="7" xsl:use-attribute-sets="table-cell-att">
					<fo:block xsl:use-attribute-sets="small-text-att">
						Etapa submetida de forma segura pelo certificado de 
						<fo:inline xsl:use-attribute-sets="small-label-att">
							<xsl:value-of select="certificateSubjectName" />
						</fo:inline> emitido por 
						<fo:inline xsl:use-attribute-sets="small-label-att">
							<xsl:value-of select="certificateIssuerName" />
						</fo:inline>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
		<xsl:if test="atributosEtapa/values">
			<fo:table-row>
				<fo:table-cell number-columns-spanned="7"
					xsl:use-attribute-sets="table-cell-att">
					<fo:block xsl:use-attribute-sets="small-label-att">Atributos de Etapa</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell number-columns-spanned="7"
					xsl:use-attribute-sets="table-cell-att">
					<fo:block><xsl:apply-templates select="atributosEtapa" mode="nested"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>