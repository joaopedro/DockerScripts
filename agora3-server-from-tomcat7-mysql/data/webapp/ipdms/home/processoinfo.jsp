<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processo.designacaosingular" var="processo" />

<c:set var="servicoOnline" value="${SoProcesso.servicoOnline}" />
<script type="text/javascript">	
	document.title = '${productName} - ${processo} ${servicoOnline.idProcessoEntidade}';	

	//funcao para ir buscar listas de processos/processos a conhecimento
	function loadDisplaySO(url,div){
		
		new Ajax.Updater( {success: div}, url, 
		   		  {method: 'get'
			   		  , evalScripts: true
			   		  ,onFailure: function(transport){
			   			 console.log('Server side Error : ' + transport.status); 
			   		  }} );
	}
	
</script>


<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${processo} ${servicoOnline.idProcessoEntidade}</td>
		  </tr>
		</tbody>
	</table>					
</div>
<br />
<form action="/visualizaprocesso" method="post" Class="form">

	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.numprocesso' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.numprocesso" /></span>		
		</div>
	
		<div class="textoCinza" style="width: 65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.numprocesso' />">
			${servicoOnline.idProcessoEntidade}
	    </div>
	</div>	
	<br />
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.variante' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.variante" /></span>
		</div>
		<div class="textoCinza" style="width: 65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.variante' />">
			${servicoOnline.variante.titulo}
		</div>
	</div>	
	<br />
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.etapa' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.etapa" /></span>
		</div>
		<div class="textoCinza" style="width: 65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.etapa' />">
			${SoProcesso.etapa.titulo}
		</div>
	</div>	
	<br />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.conhecdadopor' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.conhecdadopor" /></span>
		</div>
		<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.conhecdadopor' />">
			${SoProcesso.colaboradorEmitente.titulo}
		</div>
	</div>	
	<br />
	<fmt:formatDate var="data" value="${SoProcesso.dataEnvio.time}"	pattern="dd-MM-yyyy" />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.dataenvioparaconhec' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.dataenvioparaconhec" /></span>
		</div>
	
		<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.dataenvioparaconhec' />">
			${data}
		</div>
	</div>	
	<br />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.assunto' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.assunto" /></span>
		</div>
		<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.assunto' />">
			${servicoOnline.assunto}
		</div>
	</div>	
	<br />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.entidade' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.entidade" /></span>
		</div>
		<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.entidade' />">
			<c:forEach var="soEntidade" items="${servicoOnline.entidades}">
					${soEntidade.id.entidade.nome}			
				</c:forEach>
		</div>
	</div>	
	<br />
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.observacoes' />">
			<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.observacoes" /></span>
		</div>
		<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.observacoes' />">
			${SoProcesso.observacoes}
		</div>
	</div>
		
	<br />
	<br />
	<table>
		<tr><!-- 
			<td style="width:5%">
				<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${servicoOnline.numeroConteudo}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-consultarDoc.png" 
						alt="<fmt:message key="ipdms.myprocesses.darconhecimento.consultarprocesso"/>" 
						title="<fmt:message key="ipdms.myprocesses.darconhecimento.consultarprocesso"/>" 
						class="cursorMao" />
				</a>
			</td>
			<td style="width:25%;">
				<div class="texto">
					<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${servicoOnline.numeroConteudo}">
						<fmt:message key="ipdms.myprocesses.darconhecimento.consultarprocesso"/>						
					</a>
				</div>
			</td>-->
			<td style="width:5%">
				<a href="${pageContext.request.contextPath}/darconhecim.do2?id=${id}&urlAnterior=${urlAnterior}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-docVisto.png" 
						alt="<fmt:message key="ipdms.etapa.darConhecimento"/>" 
						title="<fmt:message key="ipdms.etapa.darConhecimento"/>" 
						class="cursorMao"/>
				</a>
			</td>
			<td style="width:25%;">
				<div class="texto">
					<a href="${pageContext.request.contextPath}/darconhecim.do2?id=${id}&urlAnterior=${urlAnterior}">
						<fmt:message key="ipdms.etapa.darConhecimento"/>
					</a>
				</div>
			</td>
			<td style="width:5%">
				<a href="${pageContext.request.contextPath}/darconhecimento.do2?method=prepare$id=${id}">
					<img src="${pageContext.request.contextPath}/images/icon/icon-docVisto.png" 
						alt="<fmt:message key="ipdms.myprocesses.darconhecimento"/>" 
						title="<fmt:message key="ipdms.myprocesses.darconhecimento"/>" 
						class="cursorMao"/>
				</a>
			</td>
			<td style="width:25%;">
				<div class="texto">
					<a href="${pageContext.request.contextPath}/darconhecimento.do2?method=prepare&id=${id}">
						<fmt:message key="ipdms.myprocesses.darconhecimento"/>
					</a>
				</div>
			</td>
		</tr>
	</table>
		
	<div style="clear:both"></div>
	<div class="buttonRow">
		<input onclick="setActionAndSubmit(this.form,'${urlAnterior}');" class="btForm" type="button" value="<fmt:message key='ipdms.forms.anterior'/>" title="<fmt:message key='ipdms.forms.anterior.title'/>" />
	</div>	
		
</form>

<div id="displaySO">
	<span class='formfield'>
		<img src="ipdms/js/ext/resources/images/default/grid/loading.gif" style='width:16px; height:16px; vertical-align:top;' title="<fmt:message key='ipdms.loading' />" alt="<fmt:message key='ipdms.loading' />"/>
		&nbsp;<fmt:message key="ipdms.loading" />
	</span>
</div>


<script type="text/javascript">
<!--
var action = '${pageContext.request.contextPath}'+'/displayconteudoAjax.do2?buttonAnterior=true&numero='+'${servicoOnline.numeroConteudo}';
loadDisplaySO(action, 'displaySO');
//-->
</script>
