<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>

<%@page import="com.sinfic.ipdms.comum.wrapper.documento.TipoDocumento"%>

<c:set var="tipoitemvalue"><%= TipoDocumento.INSTRUCAO %></c:set>
<c:set var="tipoTemplateValue"><%= TipoDocumento.TEMPLATE %></c:set>
<c:set var="tipoAssociadoInstrucaoValue"><%= TipoDocumento.ASSOCIADO %></c:set>

<fmt:message key="guichetelectronico.processo.detail.consultar" bundle="${guichetBundle}" var="consultar"/>

	<div class="barraTitulo">
		<div class="textoTitulo"><fmt:message key="guichetelectronico.processo.detail.titulo" bundle="${guichetBundle}"/></div>
	</div>

	<html:form action="/secure/notificationdetail" method="post" enctype="multipart/form-data">
		
		<div id="areaCentral">
		<c:if test="${notificationGuichetForm.colaborador.entidadeAssociada != null}">
			<div class="barraSubTitulo">
				<div class="textoSubTitulo"><fmt:message key="guichetelectronico.processo.detail.dadosentidade" bundle="${guichetBundle}"/></div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.designacaosocial' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.processo.detail.designacaosocial" bundle="${guichetBundle}"/>:
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.designacaosocial' bundle='${guichetBundle}'/>">					
						${notificationGuichetForm.colaborador.entidadeAssociada.nome}
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.numfiscal' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.processo.detail.numfiscal" bundle="${guichetBundle}"/>:
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.numfiscal' bundle='${guichetBundle}'/>">
					${notificationGuichetForm.colaborador.entidadeAssociada.nif}				
				</div>
			</div>
			<div style="clear:both"></div><br />
			
		</c:if>
			<div class="barraSubTitulo">
				<div class="textoSubTitulo"><fmt:message key="guichetelectronico.processo.detail.processo" bundle="${guichetBundle}"/></div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.numprocesso' bundle='${guichetBundle}'/>">
					<label for="numProcesso"><fmt:message key="guichetelectronico.processo.detail.numprocesso" bundle="${guichetBundle}"/>:</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.numprocesso' bundle='${guichetBundle}'/>">
					${notificationGuichetForm.servicoOnline.idProcessoEntidade}					
				</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.tipoprocesso' bundle='${guichetBundle}'/>">
					<label for="tipoProcesso"><fmt:message key="guichetelectronico.processo.detail.tipoprocesso" bundle="${guichetBundle}"/>:</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.tipoprocesso' bundle='${guichetBundle}'/>">
				${notificationGuichetForm.servicoOnline.variante.titulo}						
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.datasubmissao' bundle='${guichetBundle}'/>">
					<label for="dataSubmissao"><fmt:message key="guichetelectronico.processo.detail.datasubmissao" bundle="${guichetBundle}"/>:</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.datasubmissao' bundle='${guichetBundle}'/>">
										
					<c:if test="${not empty notificationGuichetForm.servicoOnline.dataPreenchimento}">
						<fmt:formatDate value="${notificationGuichetForm.servicoOnline.dataPreenchimento.time}" pattern="yyyy/MM/dd HH:mm"/>
					</c:if>					
				</div>
			</div>
			
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.descricao' bundle='${guichetBundle}'/>">
					<label for="descricao"><fmt:message key="guichetelectronico.processo.detail.descricao" bundle="${guichetBundle}"/>:</label>
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.descricao' bundle='${guichetBundle}'/>">
					${notificationGuichetForm.servicoOnline.assunto}									
				</div>
			</div>
			
			<c:if test="${notificationGuichetForm.colaborador.numeroConteudo == notificationGuichetForm.servicoOnline.creator.numeroConteudo}">
				<div class="row formlabel_sf" >
					<c:set var="variante" value="${notificationGuichetForm.servicoOnline.variante}" />
					<ipdms:set-latest-variante var="v" conteudo="variante" />
					<c:if test="${v.visivelExterior}">
						<div class="row formlabel_sf" >
							<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.detail.pdfinstrucao' bundle='${guichetBundle}'/>">
								<label for="pdf"><fmt:message key="guichetelectronico.processo.detail.pdfinstrucao" bundle="${guichetBundle}"/>:</label>
							</div>

							<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.detail.pdfinstrucao' bundle='${guichetBundle}'/>">
								<a href="file/getPdfInstrucaoGuichet.do2?nc=${notificationGuichetForm.servicoOnline.numeroConteudo}" target="_blank" title="<fmt:message key='ipdms.documentos.documento.instrucao.titulo' />">
									<img src="${pageContext.request.contextPath}/images/icon/icon-PDF.png" style="border:none" title="<fmt:message key='guichetelectronico.processo.detail.pdfinstrucao' bundle='${guichetBundle}'/>" alt="<fmt:message key='guichetelectronico.processo.detail.pdfinstrucao' bundle='${guichetBundle}'/>" />
								</a>									
							</div>
						</div>
					</c:if>
				</div>
			</c:if>
						
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 22%; " title="<fmt:message key='guichetelectronico.processo.detail.tramitacao' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.processo.detail.tramitacao" bundle="${guichetBundle}"/>:
				</div>

				<div class="label" style="width: 74%;" title="<fmt:message key='guichetelectronico.processo.detail.tramitacao' bundle='${guichetBundle}'/>">
				
					<table border="0" cellpadding="0" cellspacing="1" id="centro" style="width:100%;" summary="Tramitação">
						<tr>	
							<th class="centro"><fmt:message key="guichetelectronico.processo.detail.etapa" bundle="${guichetBundle}"/></th>
							<th class="centro"><fmt:message key="guichetelectronico.processo.detail.tipoaccao" bundle="${guichetBundle}"/></th>
							<th class="centro">Data</th>
						</tr>
						<c:forEach items="${notificationGuichetForm.logEntries}" var="entry">
							<c:set var="solog" value="${entry.solog}" />
							<tr>
								<td class="centro">${entry.descricaoEtapa}</td>
								<td class="centro">${solog.tipomovimento.descricao}</td>
								<td class="centro" style="width:25%"><fmt:formatDate value="${solog.enddate.time}" pattern="dd-MM-yyyy HH'h'mm'm'"/></td>
							</tr>														
						</c:forEach>
					</table>

				</div>
			</div>	
			
			<div style="clear:both"></div><br />
			
			<div class="row formlabel_sf" >
				<div class="label textoBold" style="width: 22%; " title="<fmt:message key='guichetelectronico.processo.detail.anexos' bundle='${guichetBundle}'/>">
					<fmt:message key="guichetelectronico.processo.detail.anexos" bundle="${guichetBundle}"/>:
				</div>

				<div class="label" style="width: 74%;" title="<fmt:message key='guichetelectronico.processo.detail.anexos' bundle='${guichetBundle}'/>">
					<table id="centro" border="0" cellspacing="1" cellpadding="0">
						<tr>
							<th style="width: 43%;" class="centro"><fmt:message key="guichetelectronico.processo.detail.nomeficheiro" bundle="${guichetBundle}"/></th>
							<th style="width: 43%;" class="centro"><fmt:message key="guichetelectronico.processo.detail.ficheiro" bundle="${guichetBundle}"/></th>
 							<th style="width: 14%;" class="centro"><fmt:message key="guichetelectronico.processo.detail.download" bundle="${guichetBundle}"/></th>
						</tr>
								<c:forEach items="${notificationGuichetForm.documentos}" var="documento">
									<tr class="hoverTransparente">
										<td class="centro">
											<c:choose>
												<c:when test="${documento.document.tipoDocumento.value==tipoTemplateValue}">${documento.documentTemplate.titulo}</c:when>
												<c:when test="${documento.document.tipoDocumento.value==tipoAssociadoInstrucaoValue}">${documento.document.tipoDocumentoAnexado.descricao}</c:when>
												<c:otherwise>${documento.document.designacao}</c:otherwise>
											</c:choose>	
										</td>
										<td class="centro" align="center">
											${documento.document.filename}
										</td>
 										<td class="centro" align="center" style="text-align:center;">
 											<a href="file/getDocumentoInstrucao.do2?nc=${documento.document.id.numeroConteudo}">
 											<img src="${pageContext.request.contextPath}/images/guichet/icons/icon-consultarDoc.png"
 											class="cursorMao" alt="${consultar}" title="${consultar}" style="border:none;" /></a>
 										</td>
									</tr>
								</c:forEach>
					</table>
				</div>
			</div>
			<div style="clear:both"></div><br />
			
			<div class="buttonRow">
				<input type="button" class="btFormEscuro" value="<fmt:message key='guichetelectronico.forms.anterior' bundle='${guichetBundle}'/>" title="<fmt:message key='guichetelectronico.forms.anterior.title' bundle='${guichetBundle}'/>" onclick="setActionAndSubmit(this.form,'${pageContext.request.contextPath}/guichetelectronico/secure/listprocessesguichet.do2');" id="anterior">
			</div>
		</div>
	</html:form>