<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row" style="padding-top: 0px; text-align:left;" >
	<table class="headings" style="border:none" cellpadding="0" cellspacing="0">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>


<c:choose>
<c:when test="${comunicParecerDetail.tipo != 'C'}">
<c:choose>
<c:when test="${comunicParecerDetail.resposta != true}">
<div id="tabelaResumo" class="resumo" style="height:420px">
	<div class="mensagenCaixa" >
		<img src="${pageContext.request.contextPath}/images/icon/icon-alerta.png" class="cursor" alt="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.alerta' />" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.alerta' />" style="vertical-align:middle; padding-left:10px; padding-right:8px;"/> 
		<span class="info"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.alerta1" /> ${comunicParecerDetail.servicoOnline.idProcessoEntidade} <fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.alerta2" /> ${timeElapsed} <fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.alerta3" /></span>
	</div>
</c:when>
<c:otherwise>
<div id="tabelaResumo" class="resumo" style="height:350px">
</c:otherwise>
</c:choose>
</c:when>
<c:otherwise>
<div id="tabelaResumo" class="resumo" style="height:270px">
</c:otherwise>
</c:choose>

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.origem' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.origem" />:</span>
		</div>

		<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.origem' />">
			&nbsp;${comunicParecerDetail.autor.organicaPrincipal.sigla}
		</div>
		<div class="label" style="width: 69%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.origem' />">
			&nbsp;${comunicParecerDetail.servicoOnline.idProcessoEntidade}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.criadoPor' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.criadoPor" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.criadoPor' />">
			&nbsp;${comunicParecerDetail.autor.login} - ${comunicParecerDetail.autor.titulo}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.destinatario' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.destinatario" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.destinatario' />">
		
		<c:forEach items="${comunicParecerDetail.destinatarios}" var="destinatarios">  
  			&nbsp;<c:out value="${destinatarios.titulo}"/><br />
  		</c:forEach>  
		&nbsp;
		
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.numProcesso' />"><span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.numProcesso" />:</span></div>
		<div class="label" style="width: 9%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.numProcesso' />">
			&nbsp;${comunicParecerDetail.servicoOnline.idProcessoEntidade}
		</div>
		
		<div class="leftTab label" style="width: 7%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.tipoProcesso' />"><span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.tipoProcesso" />:</span></div>
		<div class="label" style="width: 20%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.tipoProcesso' />">
			&nbsp;${comunicParecerDetail.servicoOnline.variante.titulo}
		</div>	
		
		<div class="leftTab label" style="width: 7%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.etapa' />"><span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.etapa" />:</span></div>
		<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.etapa' />">
			&nbsp;${comunicParecerDetail.descricaoEtapa}
		</div>		
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.dataEnvio' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.dataEnvio" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.dataEnvio' />">
			&nbsp;<fmt:formatDate type="both" value="${comunicParecerDetail.dataCriacao.time}" pattern="dd-MM-yyyy HH:mm"/>
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.assunto' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.assunto" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.assunto' />">
			&nbsp;${comunicParecerDetail.assunto}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.mensagem' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.mensagem" />:</span>
		</div>

		<div class="label" style="width: 79%; height: 50px;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.mensagem' />">
			&nbsp;${comunicParecerDetail.mensagem}
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.anexos' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.anexos" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.anexos' />">
			&nbsp;<c:forEach items="${comunicParecerDetail.documentos}" var="documentos">  
  			&nbsp;<c:out value="${documentos.comentario}"/> / <c:out value="${documentos.nomeImagem}"/><br />
  		</c:forEach>
		</div>
	</div>

	<c:if test="${comunicParecerDetail.tipo != 'C'}">
	<div class="row formlabel_sf" style="height: 75px;">
	<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.parecer' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.parecer" />:</span>
	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.parecer' />">
  		<textarea rows="4" style="width: 50%" readonly="readonly">${comunicParecerDetail.respostaParecer}</textarea>
  	</div>
	</div>
	</c:if>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.dataTomeiConhecimento' />">
			<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.dataTomeiConhecimento" />:</span>
		</div>

		<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.comunicacaoparecer.pesquisa.detalhe.dataTomeiConhecimento' />">
			&nbsp;<fmt:formatDate value="${comunicParecerDetail.dataResposta.time}" pattern="dd-MM-yyyy"/>
		</div>
	</div>
	
</div>
<div class="buttonRow">
	<input type="button" class="btFormEscuro" title="<fmt:message key='ipdms.forms.fechar.title' />" value="<fmt:message key='ipdms.forms.fechar' />" onclick="Element.update('resumoComunicParecerDiv', '' );" />
</div>
<br /><br />
