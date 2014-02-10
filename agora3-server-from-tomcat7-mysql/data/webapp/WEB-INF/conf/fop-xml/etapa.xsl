<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <xsl:param name="versionParam" select="'1.0'"/> 
  
  <!-- Styles -->
  <xsl:include href="common/styles.xsl"/>

  <!-- Common Xsls -->
  <xsl:include href="common/documentos_part.xsl" />
  <xsl:include href="common/dynamicFormValues_part.xsl" />
  
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
				<fo:block space-after="1cm" text-align="center" font-family="Helvetica" font-weight="bold" font-size="16pt">
					Resumo da etapa "<xsl:value-of select="SoLogElement/tituloEtapa" />"
				</fo:block>
				
				<!-- Processo Info -->
				<xsl:apply-templates select="ServicoOnlineElement" />
				
				<!-- Etapa Info -->
				<xsl:apply-templates select="SoLogElement" />
			
				<!-- Documentos  -->
				<xsl:if test="ServicoOnlineElement/documentos/DocumentoElement">
					<fo:block xsl:use-attribute-sets="titulo-att" space-before="1cm" space-after="5mm">Documentos:</fo:block>
					<xsl:apply-templates select="ServicoOnlineElement/documentos" />
				</xsl:if>
				<xsl:if test="ServicoOnlineElement/pai/documentos/DocumentoElement">
					<fo:block xsl:use-attribute-sets="titulo-att" space-before="1cm" space-after="5mm">Documentos Processo Principal:</fo:block>
					<xsl:apply-templates select="ServicoOnlineElement/pai/documentos" />
				</xsl:if>
			
				<xsl:apply-templates select="FormInstanceElement" />
				
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
  </xsl:template>

	<xsl:template match="ServicoOnlineElement">
							
		<!-- Common Attributes -->
		<fo:block space-after="5mm" xsl:use-attribute-sets="titulo-att">Informação sobre o processo:</fo:block>
		
		<xsl:choose>
			<xsl:when test="pai">
				<xsl:call-template name="servicoPai" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="servico" />
			</xsl:otherwise>
		</xsl:choose>
		
		<!-- Entidade Info -->
		<xsl:if test="entidade">
			<fo:block space-before="5mm" xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">Nome Entidade:</fo:inline> 
				<xsl:value-of select="entidade/nome" />
			</fo:block>
			<fo:block xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">NIF Entidade:</fo:inline> 
				<xsl:value-of select="entidade/nif" />
			</fo:block>
			<fo:block xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">BI Entidade:</fo:inline> 
				<xsl:value-of select="entidade/bi" />
			</fo:block>			
		</xsl:if>
		<!--  
		<xsl:if test="not(servico/entidade)">
			<fo:block>Sem Entidade Principal</fo:block>
		</xsl:if>-->
	</xsl:template>
	
	<xsl:template match="SoLogElement">
		 Etapa Atributes -
		<fo:block space-after="1cm" />
		<fo:block space-after="5mm" xsl:use-attribute-sets="titulo-att">Informação sobre a etapa:</fo:block>
		
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Data Entrada: </fo:inline> 
			<xsl:value-of select="beginDate" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Data Fim: </fo:inline> 
			<xsl:choose>
				<xsl:when test="endDate">
					<xsl:value-of select="endDate" />
				</xsl:when>
				<xsl:otherwise>Etapa ainda Decorrer</xsl:otherwise>
			</xsl:choose>
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att">Utilizadores Assignados:</fo:inline> 
			<xsl:for-each select="assignedUser/string">
				<xsl:value-of select="." />
				 <xsl:if test="position()!=last()">, </xsl:if>
			</xsl:for-each>
		</fo:block>
		<!-- Pergunta e Resposta -->
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att">Pergunta: </fo:inline> 
			<xsl:value-of select="pergunta" />
		</fo:block>		
		<xsl:if test="result">
			<fo:block xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">Resposta: </fo:inline> 
				<xsl:value-of select="result" />
			</fo:block>
			<fo:block xsl:use-attribute-sets="text-att">
				<fo:inline xsl:use-attribute-sets="label-att">Respondido por: </fo:inline> 
				<xsl:value-of select="responseUser" />
			</fo:block>		
		</xsl:if>
		<xsl:if test="certificateSubjectName">
			<fo:block xsl:use-attribute-sets="text-att">
				Etapa submetida de forma segura pelo certificado do tipo 
				<fo:inline xsl:use-attribute-sets="label-att"><xsl:value-of select="certificateIssuerName" /></fo:inline> de 
				<fo:inline xsl:use-attribute-sets="label-att"><xsl:value-of select="certificateSubjectName" /></fo:inline>
			</fo:block>
		</xsl:if>		
	</xsl:template>

	<xsl:template match="FormInstanceElement">
		<fo:block space-before="1cm" space-after="5mm" xsl:use-attribute-sets="titulo-att">Valores do Formulário Dinâmico</fo:block>
		<xsl:choose>
			<xsl:when test="values">
				<xsl:apply-templates select="values" />
			</xsl:when>
			<xsl:otherwise>
				<fo:block xsl:use-attribute-sets="label-att">Nenhum valor a apresentar</fo:block>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="servico">
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Nº. Processo: </fo:inline> 
			<xsl:value-of select="idProcessoEntidade" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Tipo Processo: </fo:inline> 
			<xsl:value-of select="processo" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Data de entrada: </fo:inline> 
			<xsl:value-of select="dataPreenchimento" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Assunto: </fo:inline> 
			<xsl:value-of select="assunto" />
		</fo:block>
	</xsl:template>
	
	<xsl:template name="servicoPai">
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Nº. Processo *: </fo:inline> 
			<xsl:value-of select="pai/idProcessoEntidade" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Tipo Processo *: </fo:inline> 
			<xsl:value-of select="pai/processo" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Data de entrada *: </fo:inline> 
			<xsl:value-of select="pai/dataPreenchimento" />
		</fo:block>
		<fo:block xsl:use-attribute-sets="text-att">
			<fo:inline xsl:use-attribute-sets="label-att"> Assunto *: </fo:inline> 
			<xsl:value-of select="pai/assunto" />
		</fo:block>
		<fo:block font-size="8" font-style="italic">* - Informação do Processo Principal</fo:block>
	</xsl:template>
</xsl:stylesheet>