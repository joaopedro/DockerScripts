<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.titulo" var="titulo" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta" var="alerta" />
<fmt:message key="ipdms.tarefas.assinar.consultarFicheiro" var="consultarFicheiro" />
<fmt:message key="ipdms.accoes.anexar.titulo" var="anexarTitulo" />
<fmt:message key="ipdms.accoes.anexar.ficheiro" var="anexarFicheiro" />

<div id="comunicacaoParecerErrorDiv">
	<html:errors />
</div>

<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>


<div class="row" style="padding-top: 0px; text-align:left;">
	<table class="headings" style="border:none" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr>
		    <td class="titulo2"> ${titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="responderParecer.do2" method="post" enctype="multipart/form-data">
	<input type="hidden" name="method" value="save">
			
	<c:choose>
		<c:when test="${comunicacaoParecerForm.resposta != true}">
			<div id="tabelaResumo" class="resumo" style="height:600px">
				<div class="mensagenCaixa" >
					<img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png" class="cursor" alt="${alerta}" title="${alerta}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
					<span class="info">
						<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta1" /> ${comunicacaoParecerForm.processId} 
						<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta2" /> ${timeElapsed} 
						<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta3" />
					</span>
				</div>
		</c:when>
		<c:otherwise>
			<div id="tabelaResumo" class="resumo" style="height:310px">
		</c:otherwise>
	</c:choose>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.origem' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.origem" />:</span>
		</div>
		
		<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.origem' />">
			${comunicacaoParecerForm.autorOrigem}
		</div>
		
		<div class="label" style="width: 59%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.origem' />">
			${comunicacaoParecerForm.processId}
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.criadoPor' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.criadoPor" />:</span>
		</div>	
		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.criadoPor' />">
			${comunicacaoParecerForm.autor} - ${comunicacaoParecerForm.autorNome}
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.destinatario' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.destinatario" />:</span>
		</div>	
		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.destinatario' />">
			<c:out value="${comunicacaoParecerForm.nomeDestinatarios}"/><br />  		
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.numProcesso' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.numProcesso" />:</span>
		</div>
		<div class="label" style="width: 15%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.numProcesso' />">
			${comunicacaoParecerForm.processId}
		</div>
			
		<div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.tipoProcesso' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.tipoProcesso" />:</span>
		</div>
		<div class="label" style="width: 15%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.tipoProcesso' />">
			${comunicacaoParecerForm.tipoProcesso}
		</div>	
			
		<div class="leftTab label" style="width: 8%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.etapa' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.etapa" />:</span>
		</div>
		<div class="label" style="width: 23%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.etapa' />">
			${comunicacaoParecerForm.etapaActual}
		</div>		
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio" />:</span>
		</div>	
		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio' />">
			${comunicacaoParecerForm.dataCriacao}
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.assunto' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.assunto" />:</span>
		</div>	
		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.assunto' />">
			${comunicacaoParecerForm.assunto}
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; height:50px;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.mensagem' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.mensagem" />:</span>
		</div>	
		<div class="label" style="width: 79%; height:50px;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.mensagem' />">
			${comunicacaoParecerForm.mensagem}
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.anexos' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.anexos" />:</span>
		</div>
		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.anexos' />">
				
			<c:forEach items="${comunicacaoParecerForm.savedDocuments}" var="documento">
				${documento.designacao}
				<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}&vc=${documento.versaoConteudo}" class="formfield" title="${consultarFicheiro}" target="_blank">${documento.filename}</a>
				<br/>
			</c:forEach>
		</div>
	</div>
		
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.parecer' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.parecer" /></span>
		</div>	
	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.parecer' />">
	  		<textarea rows="4" style="width: 50%" id="respostaParecer" name="respostaParecer"></textarea>
	  	</div>
	</div>
					
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.anexos' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.criar.anexos" /></span>								
		</div>
			
		<div class="label" style="width: 70%;">
			<table cellpadding="0" cellspacing="0" class="centro" style="width:500px; ">
				<tr>
					<th width="250" class="centro">${anexarTitulo}</th>
					<th width="250" class="centro">${anexarFicheiro}</th>
				</tr>
				
				<logic:iterate name="comunicacaoParecerForm" property="documentos" id="documentos" indexId="i">
					<nested:root name="documentos">
						<tr class="hoverTransparente">
							<td><nested:text property="description" size="30" maxlength="30" onblur="enableField(this);" indexed="true"/></td>
							<td class="centro"><nested:file property="formFile" size="30" disabled="true" indexed="true"/></td>
						</tr>
					</nested:root>
				</logic:iterate>
				<tr class="hoverTransparente">
					<td colspan="2">&nbsp;</td>
				</tr>
			</table>			
		</div>
	</div>
	
	<%--
	<div class="row formlabel_sf">
	
		<div class="leftTab label" style="width: 18%;">
										
		</div>
		
		<div class="label" style="width: 70%;">		
			<c:if test="${fn:length(comunicacaoParecerForm.antigos) > 0 }">
				<table cellpadding="0" cellspacing="0" class="centro" style="width:500px; border:none;">
					<tr>
						<th width="175" class="centro" style="text-align: left;">Ficheiros Anexados</th>
						<th width="210" class="centro">Formato do ficheiro</th>
						<th width="15" class="centro"><img src="${IMAGE_DIR}/icon-lixo.png" alt="Eliminar" title="Eliminar" /></th>
					</tr>
					<nested:iterate name="comunicacaoParecerForm" property="antigos" id="antigos">
						<nested:root name="antigos">
							<tr>
								<td class="centro">
									<nested:write property="uploadFile.description" />
								</td>
								<td class="alignCenter">
									<c:choose>
										<c:when test="${fn:length(antigos.extension) > 0}">
											<c:out value="${antigos.extension}" />
										</c:when>
										<c:otherwise>
											---
										</c:otherwise>
									</c:choose>
								</td>
								<td class="centro"><nested:checkbox property="uploadFile.selected" indexed="true" style="border:0;" /></td>
							</tr>
						</nested:root>
					</nested:iterate>
				</table>
			</c:if>
				
			<div class="buttonRow">
				<input type="button" class="btForm"
					value="Adicionar +"
					onclick="this.form.action='${pageContext.request.contextPath}/responderParecer.do2'; this.form.method.value='addFiles'; this.form.submit();">
			</div>
		</div>
							
	</div>
	--%>		
			
	</div>
	
	<div style="height:20px; text-align:left;">
		<input type="submit" class="btForm" value="<fmt:message key='ipdms.forms.gravar'/>" title="<fmt:message key='ipdms.forms.gravar'/>" />		
		<input type="button" class="btFormEscuro" value="<fmt:message key='ipdms.forms.fechar'/>" title="<fmt:message key='ipdms.forms.fechar'/>" onclick="Element.update('detailComunicParecerDiv', '' );" />
	</div>
	<br/>
	
</html:form>
