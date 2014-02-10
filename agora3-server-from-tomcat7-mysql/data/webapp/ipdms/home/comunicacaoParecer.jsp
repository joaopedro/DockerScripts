<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.titulo" var="titulo" />
<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta" var="alerta" />
<fmt:message key="ipdms.tarefas.assinar.consultarFicheiro" var="consultarFicheiro" />
<fmt:message key="ipdms.forms.gravar" var="gravar" />
<fmt:message key="ipdms.etapa.darConhecimento" var="darConhecimento" />
<fmt:message key="ipdms.forms.fechar" var="fechar" />

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
		    <td class="titulo2">${titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>


<c:choose>
<c:when test="${comunicParecerDetail.tipo != 'C'}">
	<c:choose>
		<c:when test="${comunicParecerDetail.resposta != true}">
		<div id="tabelaResumo" class="resumo" style="height:370px">
			<div class="mensagenCaixa" >
				<img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png" class="cursor" alt="${alerta}" title="${alerta}" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
				<span class="info"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta1" /> 
					${comunicParecerDetail.servicoOnline.idProcessoEntidade} 
					<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta2" /> ${timeElapsed} 
					<fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.alerta3" />
				</span>
			</div>
		</c:when>
		<c:otherwise>
			<div id="tabelaResumo" class="resumo" style="height:310px">
		</c:otherwise>
	</c:choose>
</c:when>

<c:otherwise>
	<div id="tabelaResumo" class="resumo" style="height:250px">
</c:otherwise>
</c:choose>



	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.origem' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.origem" />:</span>
		</div>

		<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.origem' />">
			${comunicParecerDetail.autor.organicaPrincipal.sigla}
		</div>
		<div class="label" style="width: 59%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.origem' />">
			${comunicParecerDetail.servicoOnline.idProcessoEntidade}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.criadoPor' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.criadoPor" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.criadoPor' />">
			${comunicParecerDetail.autor.login} - ${comunicParecerDetail.autor.titulo}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.destinatario' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.destinatario" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.destinatario' />">
		
		<c:forEach items="${comunicParecerDetail.destinatarios}" var="destinatarios">  
  			<c:out value="${destinatarios.titulo}"/><br />
  		</c:forEach>  
		&nbsp;
		
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.numProcesso' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.numProcesso" />:</span>
		</div>
		<div class="label" style="width: 15%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.numProcesso' />">
			${comunicParecerDetail.servicoOnline.idProcessoEntidade}
		</div>
		
		<div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.tipoProcesso' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.tipoProcesso" />:</span>
		</div>
		<div class="label" style="width: 15%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.tipoProcesso' />">
			${comunicParecerDetail.servicoOnline.variante.titulo}
		</div>	
		
		<div class="leftTab label" style="width: 8%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.etapa' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.etapa" />:</span>
		</div>
		<div class="label" style="width: 23%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.etapa' />">
			${comunicParecerDetail.descricaoEtapa}
		</div>		
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.dataEnvio' />">
			<fmt:formatDate type="both" value="${comunicParecerDetail.dataCriacao.time}" pattern="dd-MM-yyyy HH:mm"/>
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.assunto' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.assunto" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.assunto' />">
			${comunicParecerDetail.assunto}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%; height:50px;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.mensagem' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.mensagem" />:</span>
		</div>

		<div class="label" style="width: 79%; height:50px;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.mensagem' />">
			${comunicParecerDetail.mensagem}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 28%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.anexos' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.anexos" />:</span>
		</div>
		<div class="label" style="width: 69%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.anexos' />">
			
			<c:forEach items="${comunicParecerDetail.documentos}" var="documentos">
				${documentos.designacao} 
				<a href="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documentos.numeroConteudo}&vc=${documentos.versaoConteudo}" class="formfield" title="${consultarFicheiro}" target="_blank">
					(${documentos.filename})
				</a>, &nbsp;&nbsp;
  			</c:forEach>
		</div>
	</div>
	<c:if test="${comunicParecerDetail.tipo != 'C'}">
		<div class="row formlabel_sf" style="height: 130px;">
			<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.parecer' />">
				<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.parecer" />:</span>
			</div>
		  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.parecer' />">
		  		<textarea rows="4" style="width: 50%" id="respostaParecer" name="respostaParecer"></textarea>
		  	</div>
		</div>
	</c:if>
</div>

<div style="height:20px; text-align:left;">
	<c:choose>
		<c:when test="${comunicParecerDetail.tipo != 'C'}">
			<input type="button" class="btForm" value="${gravar}" title="${gravar}" onclick="responderComunic(${comunicParecerDetail.id});" />
		</c:when>
		<c:otherwise>
			<input type="button" class="btForm" value="${darConhecimento}" title="${darConhecimento}" onclick="responderComunic(${comunicParecerDetail.id});" />
		</c:otherwise>
	</c:choose>
	<input type="button" class="btFormEscuro" value="${fechar}" title="${fechar}" onclick="Element.update('detailComunicParecerDiv', '' );" />
</div>

<br />
<br />
