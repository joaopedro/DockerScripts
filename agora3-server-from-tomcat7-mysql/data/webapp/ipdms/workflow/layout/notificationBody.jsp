<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/sinfic-workflow.tld" prefix="wf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processo.designacaosingular" var="processoDesignacao"/>
<fmt:message key="ipdms.listetapas.motivo" var="motivo"/>
<fmt:message key="ipdms.forms.cancelar" var="formCancel"/>
<fmt:message key="webflow.sim" var="sim"/>
<fmt:message key="webflow.nao" var="nao"/>
<fmt:message key="ipdms.loading" var="loading"/>
<fmt:message key="error.workflow.closed.notification" var="closedNotification"/>
<fmt:message key="ipdms.notification.notRecipient" var="notRecipient"/>
<fmt:message key="ipdms.notification.exportDocument.title" var="noDocumentTitle"/>
<fmt:message key="ipdms.notification.exportDocument.message" var="noDocumentMsg"/>
<fmt:message key="ipdms.notification.mostrar" var="mostrar"/>
<fmt:message key="ipdms.notification.mostrarAccao" var="mostrarAccao"/>
<fmt:message key="ipdms.notification.esconder" var="esconder"/>
<fmt:message key="ipdms.notification.esconderAccao" var="esconderAccao"/>
<fmt:message key="processo.priority.running" var="running"/>
<fmt:message key="processo.priority.errorTilte" var="errorTilte"/>
<fmt:message key="processo.priority.errorMsg" var="errorMsg"/>
<fmt:message key="ipdms.processo.pai" var="processoPai"/>	
<fmt:message key="ipdms.etapa.devolver" var="devolver"/>
<fmt:message key="ipdms.etapa.encarregar" var="encarregar"/>
<fmt:message key="ipdms.etapa.delegavel" var="delegavel"/>
<fmt:message key="ipdms.etapa.encerrar" var="encerrar"/>
<fmt:message key='ipdms.etapa.suspender' var="suspender"/>
<fmt:message key='ipdms.etapa.aguardar' var="aguardar"/>
<fmt:message key="ipdms.etapa.submeter" var="submeter"/>
<fmt:message key="ipdms.etapa.submeterTitle" var="submeterTitle"/>
<fmt:message key="ipdms.etapa.submeterContinuar" var="submeterContinuar"/>
<fmt:message key="ipdms.etapa.submeterContinuarTitle" var="submeterContinuarTitle"/>
<fmt:message key="ipdms.etapa.cancelar" var="cancelar"/>
<fmt:message key="ipdms.etapa.cancelarTitle" var="cancelarTitle"/>
<fmt:message key="ipdms.etapa.cancelarPopupTitle" var="cancelarPopupTitle"/>
<fmt:message key="ipdms.etapa.cancelarPopupMsg" var="cancelarPopupMsg"/>

<SCRIPT src="${pageContext.request.contextPath}/ipdms/js/comentario.js"
	language="javascript1.2" type="text/javascript"></script>

<script type="text/javascript" src='${JS_DIR}/jquery/jquery-1.7.2.js' ></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src='${JS_DIR}/dynamicFormFunctions.js' ></script>

<script type="text/javascript">

//ao carregar pagina por formatos nas datas caso nao tenham valor
Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

//funcao chamada pelo handler da messagebox do ext para executor as funcoes de acordo com o botao seleccionado
function decisao(btn){
	if(btn=='yes'){
		 $('condition').setAttribute("name","org.apache.struts.taglib.html.CANCEL");
		 $('condition').setAttribute("value","Cancelar");
		 document.forms['notificationForm'].submit();
	} else{
		return false;
	}
}


function go_there(varFunc)
{
	var where_to=null;

	Ext.Msg.show({
	   title:varFunc,
	   msg: varFunc+' ${processoDesignacao}?<br /> ${motivo}:',
	   buttons: {ok:'Ok', cancel:'${formCancel}'},
	   prompt:true,
	   width:300,
	   fn: function(btn,text){
		if(btn=='ok') {
	  		where_to=text;
		}

	  	if(where_to!= null){
			if(varFunc=="${suspender}"){
				window.location="${pageContext.request.contextPath}/encerrarsuspender.do2?opcao=suspender&servicoONr=${process.servicoOnline.numeroConteudo}&etapa=${etapa.numeroConteudo}&servicoOVs=${process.servicoOnline.versaoConteudo}&urlanterior=${previousurl}&motivo="+where_to;
			}else if(varFunc=="${encerrar}"){
			   	window.location="${pageContext.request.contextPath}/encerrarsuspender.do2?opcao=encerrar&servicoONr=${process.servicoOnline.numeroConteudo}&etapa=${etapa.numeroConteudo}&servicoOVs=${process.servicoOnline.versaoConteudo}&urlanterior=${previousurl}&motivo="+where_to;
			}else if(varFunc=="${aguardar}"){
				window.location="${pageContext.request.contextPath}/aguardar.do2?servicoONr=${process.servicoOnline.numeroConteudo}&etapa=${etapa.numeroConteudo}&servicoOVs=${process.servicoOnline.versaoConteudo}&urlanterior=${previousurl}&motivo="+where_to;
			}		 
		 }
	  	},
	   animEl: 'elId',
	   icon: Ext.MessageBox.QUESTION
	});
}


	var rule1 = {
		'#delegarButton': function (el) {
			el.onclick = function () {
				el.form.action = 'delegarencarregar.do2?urlanterior=${retorno}';
				el.form.elements['method'].value = 'prepare';
				el.form.page.value = 0;
				return true;
			};
		}
	};

	var rule2 = {
			'#encarregarButton': function (el) {
				el.onclick = function () {
					el.form.action = 'delegarencarregar.do2?funcao=encarregar&servicoONr=${process.servicoOnline.numeroConteudo}&servicoOVs=${process.servicoOnline.versaoConteudo}&urlanterior=${previousurl}';
					el.form.elements['method'].value = 'prepare';
					el.form.page.value = 0;
					return true;
				};
			}
		};


	var rule3= {'#devolverButton': function (el) {
		el.onclick = function () {
			el.form.action = 'delegarencarregar.do2?nid=${ProcEncarregue.nid}';
			el.form.elements['method'].value = 'devolver';
			el.form.page.value = 0;
			return true;
		};
	}};
	
	Behaviour.register(rule1);
	Behaviour.register(rule2);
	Behaviour.register(rule3);
	
</script>

<bean:define id="mapping"
	name="<%=org.apache.struts.Globals.MAPPING_KEY%>" />
<bean:define id="path" name="mapping" property="path" />

<script language="javascript" type="text/javascript">

	var contextPath = '${request.contextPath}';
	function submitForm(link) {inf
	    var form = document.forms['notificationForm'];
		form.action = '?method=accao&accaoLink=' + link;
		form.page.value = 0;
		form.submit();
		return true;
	}
	function accao(numTarefa, tipoTarefa) {
	    var form = document.forms['notificationForm'];
	    var previousAction = form.action;
		form.action = '?method=accao&numTarefa='+numTarefa+'&tipoTarefa='+tipoTarefa;
		form.page.value = 0;
		form.submit();
		form.action = previousAction;
		return true;
	}
	
	function accaoNovaJanela(numTarefa, tipoTarefa){
	    var form = document.forms['notificationForm'];
	    var url = '${pageContext.request.contextPath}/notification.do2';
		url = "?method=accao";
 		url += "&numTarefa=" + numTarefa;
 		url += "&tipoTarefa=" + tipoTarefa;
 		url += "&nid=" + ${param.nid};
 		url += "&org.apache.struts.taglib.html.TOKEN=${sessionScope['org.apache.struts.action.TOKEN']}";
		var result = window.showModalDialog(url);
		return false;
	}	
	
	function accaoAjax(numTarefa, tipoTarefa, titulo) {
		
		$('innerAction_close').show();
		$('innerAction_open').hide();
		$('innerAction').show();
		$('showAccao').update("<img src='images/icon/seta_seccao_fecha.png' alt='${mostrarAccao}' title='${mostrarAccao}'/> ${mostrar} "+ titulo); 
		$('hideAccao').update("<img src='images/icon/seta_seccao_abre.png' alt='${esconderAccao}' title='${esconderAccao}'/> ${esconder} "+ titulo); 
		$('innerAction').innerHTML="<br><span class='formfield'><img src='${JS_DIR}/ext/resources/images/default/grid/loading.gif' style='width:16px; height:16px; vertical-align:top;' alt='${loading}' title='${loading}' />${loading}</span> </div>";
	
		var ajaxAction = '${pageContext.request.contextPath}/notification.do2';
		var params = "?method=accao";
 		params += "&numTarefa=" + numTarefa;
 		params += "&tipoTarefa=" + tipoTarefa;
 		params += "&nid=" + ${param.nid};
 		params += "&org.apache.struts.taglib.html.TOKEN=${sessionScope['org.apache.struts.action.TOKEN']}";
		var divToSubmit = "dynformdiv";
		var divToUpdate = "innerAction";
		
		submitDiv(divToSubmit, ajaxAction + params, divToUpdate, true);		

	}	

	function scrollBottom(){
		var objDiv = $("DHTMLSuite_paneContentcenter");
		objDiv.scrollTop = objDiv.scrollHeight;
	}
	
	<c:if test="${!canPerform}">
		function inform(){
			<c:choose>
		        <c:when test='${isRecipient}'>
					alert("${closedNotification}");								       
				</c:when>
		        <c:otherwise>
					alert("${notRecipient}");						
				</c:otherwise>
		    </c:choose>
		}
	</c:if>

	<c:if test="${not empty canBeSubmitted}">
	function informRejected(){
		var mensagem = "<fmt:message key="ipdms.notification.validationMessage.${canBeSubmitted}" />";
		alert(mensagem);						
	}
	</c:if>
	
	 downloadBundle = function(btn) {
		 if(btn=='yes'){
			 var p = $('exportForm').serialize();
			 if(p == '') {
				 //no documents selected
				 Ext.MessageBox.show({
			            title: '${noDocumentTitle}',
			            msg: '${noDocumentMsg}',
			            buttons: Ext.MessageBox.OK });
			 } else {
				 var url = $('exportForm').action + '?' + p;
				 $('exportForm').action = url;
				 $('exportForm').submit();
			 }
		 }
	 };
	 
 toggleAccao = function () {
		$('innerAction_close').toggle(); 
		$('innerAction_open').toggle();
		$('innerAction').toggle();
	};
</script>


<script type="text/javascript">	
	document.title = '${productName} - ${etapa.titulo} (${process.servicoOnline.idProcessoEntidade}) (${process.servicoOnline.versaoConteudo})';	 
</script>


<script type="text/javascript">
//loads an image, showing it in a window Ext
function carregaImagem(title, action){
	var titulo = 'Imagem workflow para o processo ' + title;
    ExtWindowSizeParam(titulo,action,'','html',850,600);    
}
</script>

<script>
	<%-- Codigo para gestao de prioridade--%>
	function changePriority(urlaction) {
		var myMask = new Ext.LoadMask(Ext.getBody(), {
			msg : '${running}'
		});
		Ext.Ajax.on('beforerequest', myMask.show, myMask);
		Ext.Ajax.on('requestcomplete', myMask.hide, myMask);
		Ext.Ajax.on('requestexception', myMask.hide, myMask);
	
		Ext.Ajax.request( {
			url : urlaction,
			method : 'GET',
			success : function(response) {
				$('priority_div').innerHTML = response.responseText;
			},
			failure : function(response) {
				Ext.MessageBox.show({
		            title: '${errorTilte}',
		            msg: '${errorMsg}',
		            buttons: Ext.MessageBox.OK
		       });
			}
		});
	}
	
</script>

<script type="text/javascript">

	function gravarInfo() {	
		var form = document.forms['notificationForm'];
		form.action = '?method=gravarInformacao';
		form.page.value = 0;
		form.submit();
		return true;
	}
	
	setSubmitMethod = function(value){
		var form = document.forms['notificationForm'];
		var element = form.elements['method'];
		element.value = value;			
	};
	

</script>
	

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; padding-bottom:0px;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${etapa.titulo} (${process.servicoOnline.idProcessoEntidade})
			(${process.servicoOnline.versaoConteudo})</td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="MensagemErro"><html:errors /></div>
<!-- Inicio do FORMULARIO NOTIFICACAO -->
	<div id="notificationLeft" style="width: 100%;  float: left;">
	<div class="rowAccoes">
	<div class="linkAccoes"><logic:present name="tarefasGerais">
		<logic:iterate id="tarefa" name="tarefasGerais" indexId="index">
            <c:if test="${tarefa.abrirNaPagina && tarefa.autoOpenEtapa}">
                <c:set var="openOnLoad" value="true" />
            	<c:set var="tarefaId" value="${tarefa.id}" />
            	<c:set var="tarefaType" value="G" />
            	<c:set var="tarefaTitulo" value="${tarefa.titulo}" />
            </c:if>
			<bean:define id="linkSubmit">
				<logic:notEqual name="canPerform" value="true">javascript:inform();</logic:notEqual>
				<logic:equal name="canPerform" value="true">
					<c:choose>
						<c:when test="${tarefa.abrirNaPagina}">#" onclick="accaoAjax('${tarefa.id}','G', '${tarefa.titulo}');</c:when>
						<c:when test="${tarefa.novaJanela}">#" onclick="accaoNovaJanela('${tarefa.id}','G', '${tarefa.titulo}');</c:when>
						<c:otherwise>javascript:accao('${tarefa.id}','G');</c:otherwise>
					</c:choose>
				</logic:equal>
			</bean:define>
			<html:link href="${linkSubmit}">${tarefa.titulo}</html:link>
		</logic:iterate>
	</logic:present></div>
	</div>
	<br />
	<bean:define id="retorno">${request.contextPath}/notification.do2?${request.queryString}&clear=no</bean:define>
	<div id="accoesEspecificas" style="margin-left:0;">
		<logic:present name="tarefasEspecificas">
		<logic:iterate id="tarefa" name="tarefasEspecificas" indexId="counter">
			<c:if test="${tarefa.abrirNaPagina && tarefa.autoOpenEtapa}">
                <c:set var="openOnLoad" value="true" />
            	<c:set var="tarefaId" value="${tarefa.id}" />
            	<c:set var="tarefaType" value="E" />
            	<c:set var="tarefaTitulo" value="${tarefa.titulo}" />
            </c:if>
			<bean:define id="linkheader" type="java.lang.String">
				<bean:write name="tarefa" property="link" />
			</bean:define>
			<%
				String separator = (linkheader.indexOf("?") == -1 ? "?" : "&");
			%>
			<bean:define id="link">
				<bean:write name="linkheader" />
					<%=separator%>retorno=<%=retorno.toString()%>&numero=
					<bean:write name="process" property="servicoOnline.numeroConteudo" />
					&servicoOnlineId=
					<bean:write name="process" property="servicoOnline.numeroConteudo" />
					&etapa=${etapa.numeroConteudo}&tarefa=${tarefa.id}
					&etapaId=${etapa.numeroConteudo}&tarefa=${tarefa.id}
			</bean:define>
			<bean:define id="script">
				<logic:equal name="canPerform" value="true">
					<c:choose>
						<c:when test="${tarefa.abrirNaPagina}">accaoAjax('${tarefa.id}','E', '${tarefa.titulo}');</c:when>
						<c:when test="${tarefa.novaJanela}">accaoNovaJanela('${tarefa.id}','E', '${tarefa.titulo}');</c:when>
						<c:otherwise>javascript:accao('${tarefa.id}','E');</c:otherwise>
					</c:choose>
				</logic:equal>
				<logic:notEqual name="canPerform" value="true">javascript:inform();</logic:notEqual>
			</bean:define>
			<wf:button property="tarefa" onclick="<%=script%>">
				<bean:write name="tarefa" property="titulo" />
			</wf:button>
		</logic:iterate>
	</logic:present></div>

	<br />


	<div id="innerAction_open" class="titulo2" style="display: none;">
	<a href="#" onclick="toggleAccao();" id="showAccao">
		<img src="images/icon/seta_seccao_fecha.png" alt="${mostrarAccao}" title="${mostrarAccao}"/>
	</a></div>
	<div id="innerAction_close" class="titulo2" style="display: none;">
	<a href="#" onclick="toggleAccao();" id="hideAccao">
		<img src="images/icon/seta_seccao_abre.png" alt="${esconderAccao}" title="${esconderAccao}"/>
	</a></div>
	<div id="innerAction" ></div>
	
	<br/>
	<div id="tabelaResumo" class="resumo" style="height:auto!important;">
		<script type="text/javascript">
				function toggle(divId) {
					var div = document.getElementById(divId);
					if (div.style.display == 'none'){
						div.style.display = 'block';
					}else {
						div.style.display = 'none';
					}
					
					var img = $("imgDetalhes");
					if( img ) img.src = img.src.indexOf("images/icon/icon-mais.png") == -1 ? 
									"images/icon/icon-mais.png" : "images/icon/icon-menos.png";
				}
		</script> <nested:root name="process" >
		
		<div class="row formlabel_sf">
			<nested:present
			property="servicoOnline.processoPai">
			<nested:nest property="servicoOnline.processoPai">
				
				<div class="leftTab label" style="width: 10%;" title="${processoPai}">
				<span class="textoBold">Processo Pai:</span></div>

				<div class="textoCinza" style="width: 12%;" title="${processoPai}">
				<nested:write property="idProcessoEntidade" /> - <nested:write
					property="variante.titulo" /></div>
				
			</nested:nest>
			</nested:present>			

			<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.numprocesso' />">
				<span class="textoBold"><fmt:message key="ipdms.notification.header.numprocesso" /></span>
			</div>

			<div class="label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.numprocesso' />">
				${process.servicoOnline.idProcessoEntidade}&nbsp;
			</div>
			<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.notification.header.tipoprocesso' />">
				<span class="textoBold"><fmt:message key="ipdms.notification.header.tipoprocesso" /></span>
			</div>
			<div class="label" style="width: 23%;" title="<fmt:message key='ipdms.notification.header.tipoprocesso' />">
				${process.servicoOnline.variante.titulo }
			</div>
			<c:if test="${not empty entidade}">			
				<div class="leftTab label" style="width: 10%;" title="<fmt:message key='ipdms.notification.header.entidade' />">
					<span class="textoBold"><fmt:message key="ipdms.notification.header.entidade" /></span>
				</div>
	
				<div class="label" style="width: 8%;" title="<fmt:message key='ipdms.notification.header.entidade' />">
					${entidade.nome}
				</div>			
			</c:if>
		</div>
		
		
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.dataentrada' />">
				<span class="textoBold"><fmt:message key="ipdms.notification.header.dataentrada" /></span>
			</div>
	
			<div class="label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.dataentrada' />">
				<fmt:formatDate
					value="${process.servicoOnline.dataPreenchimento.time}"
					pattern="dd/MM/yyyy HH:mm" />
			</div>
			
<%-- 			<div class="leftTab label" style="width: 17%;" title="Tempo na Etapa">
				<span class="textoBold"><bean:message key="ipdms.notification.header.tempoetapa" locale="locale" /></span>
			</div>

			<div class="label" style="width: 10%;" title="Tempo na Etapa">
					${dataeta} <bean:message key="ipdms.notification.header.dias" locale="locale" />
			</div>
			
			<div class="leftTab label" style="width: 18%;" title="Tempo de Processo">
				<span class="textoBold"><bean:message key="ipdms.notification.header.tempoprocesso" locale="locale" /></span>
			</div>

			<div class="label" style="width: 18%;" title="Tempo de Processo">
				${datapro} <bean:message key="ipdms.notification.header.dias" locale="locale" />
			</div>
 --%>		</div>
		<div class="row formlabel_sf">
			<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.assunto' />">
				<span class="textoBold"><fmt:message key="ipdms.notification.header.assunto" /></span>
			</div>
	
			<div class="label" style="width: 74%;" title="<fmt:message key='ipdms.notification.header.assunto' />">
				${process.servicoOnline.assunto}
			</div>
		</div>
		<div id="priority_div" class="row formlabel_sf">
			<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.notification.header.priority' />">
				<span class="textoBold"><fmt:message key="ipdms.notification.header.priority" /></span>
			</div>
			<div class="label" style="width: 10%;" title="<fmt:message key='ipdms.notification.header.priority' />">
				<bean:message key="${process.servicoOnline.priority.resourceKey}"/>
			</div>
			<div class="label" style="width: 50%;" title="<fmt:message key='ipdms.notification.header.priority' />">
				<c:if test="${process.servicoOnline.priority != 'HIGH'}">
					<c:url var="link" value="servicoOnlinePriority.do2">
						<c:param name="numero" value="${process.servicoOnline.numeroConteudo}" />
						<c:param name="method" value="increase"></c:param>
					</c:url>
					(<a href="#" onclick="changePriority('${link}');" class="texto"><fmt:message key="processo.priority.increase" /></a>)
				</c:if>
				<c:if test="${process.servicoOnline.priority != 'LOW'}">
					<c:url var="link" value="servicoOnlinePriority.do2">
						<c:param name="numero" value="${process.servicoOnline.numeroConteudo}" />
						<c:param name="method" value="decrease"></c:param>
					</c:url>
				    (<a href="#" onclick="changePriority('${link}');" class="texto"><fmt:message key="processo.priority.decrease" /></a>)
				</c:if>
			</div>
		</div>

	</nested:root></div>



<html:form action="<%=path.toString()%>" styleId="dynForm" onsubmit="dateFormatCheckonSubmit();">
<c:set var="notificationForm" value="${notificationForm}" scope="request" />
<div class="row formlabel_sf" > 
	<div class="leftTab label" style="width: 97%;">
		<tiles:insert beanName="body" />
	</div>
</div>

<div id="dynformdiv"><jsp:include page="../dynamicform.jsp" /></div>

	<html:hidden property="method" value="process" />
	<html:hidden property="processId" />
	<html:hidden property="processType" />
	<html:hidden property="nid" />
	<html:hidden property="page" value="1" />

	<input type="hidden" name="geographicObjectHandlerIdElement(id.numeroConteudo)" value="${process.servicoOnline.numeroConteudo}" />
	<input type="hidden" name="geographicObjectHandlerIdElement(id.versaoConteudo)" value="${process.servicoOnline.versaoConteudo}" />
	<input type="hidden" name="geographicObjectHandlerClass" value="${process.servicoOnline['class'].name}" />
	
	<input type="hidden" name="retorno"
		value='<%=session.getAttribute(com.sinfic.ipdms.tramitacao.util.NavigationUtils.REFERER_KEY)%>' />
	<input type="hidden" name="servicoO" value='${process.servicoOnline.numeroConteudo}' />
	<input type="hidden" id="nextNotifications" name="nextNotifications" value='${nextNotifications}' />
	<input type="hidden" id="currentPage" name="currentPage" value='${currentPage}' />
	
	<div id="result-pane"><wf:result-pane
		notificationId="notification">
		<tiles:insert beanName="resultPane" />
	</wf:result-pane></div>

	<div class="buttonRow" id="accoesMovimento"><wf:result-pane
		notificationId="notification">

		<logic:notEqual name="notification" property="closed" value="true">
			<c:choose>
				<c:when test="${Encarregue == 's'}">
					<html:submit value="${devolver}" styleClass="btForm" title="${devolver}"
						styleId="devolverButton" />
				</c:when>
				<c:otherwise>
					<c:if test="${etapa.encarregar}">
						<html:submit value="${encarregar}" styleClass="btForm" title="${encarregar}"
							styleId="encarregarButton" />
					</c:if>
					<c:if test="${etapa.delegavel}">
						<html:submit value="${delegavel}" styleClass="btForm" title="${delegavel}"
							styleId="delegarButton" />
					</c:if>
					<c:if test="${etapa.encerrar}">
						<input class="btForm" onclick="go_there('${encerrar}');" type="button" title="${encerrar}" value="${encerrar}" />
					</c:if>
					<c:if test="${etapa.suspender}">
						<input onclick="go_there('${suspender}');" class="btForm" title="${suspender}"
							type="button" value="${suspender}" />
					</c:if>
					<c:if test="${etapa.aguardar}">
						<input onclick="go_there('${aguardar}');" class="btForm" title="${aguardar}"
							type="button" value="${aguardar}" />
					</c:if>
					<c:choose>
						<c:when test="${not empty canBeSubmitted}">
							<input onclick="informRejected();" class="btForm" title="${submeterTitle}"
							type="button" value="${submeter}" />
						</c:when>
						<c:otherwise>
							<html:submit value="${submeter}" styleClass="btForm" title="${submeterTitle}"
							onclick="if( window != parent ) this.form.target = '_parent';enableAllInputFieds('dynformdiv'); setSubmitMethod('submeter');" />
						</c:otherwise>
					</c:choose>
					
					<html:submit value="${submeterContinuar}" styleClass="btForm" title="${submeterContinuarTitle}"
						onclick="if( window != parent ) this.form.target = '_parent'; enableAllInputFieds('dynformdiv'); setSubmitMethod('submeterContinuar');" />
										
					<input onclick="gravarInfo();" class="btForm" title="<fmt:message key="ipdms.notification.gravar.infoetapa" />"
							type="button" value="<fmt:message key="ipdms.forms.gravar" />" />
					
				</c:otherwise>
			</c:choose>
		</logic:notEqual>
	</wf:result-pane> 
		<input id="condition" type="hidden" class="cancel"/>
		<input type="button"  value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao,'${sim}','${nao}');" title="${cancelarTitle}"/>&nbsp;
	</div>
	
	<br />
	<div id="comentario"><jsp:include page="../comentario.jsp" /></div>
</html:form>	
</div>

	<div id="documentPreviewRight" style="padding-left: 8px; display:none; width: 50%; float: left;" >
		<div id="docdiv" style="border: 1px solid #3A3636;"></div>			
	</div>


<script type="text/javascript">

	//	auto load Tarefa that are configured to open on load the notification
	//	if more than one Tarefa is configurated, load last Tarefa found
	if('${openOnLoad}' === 'true'){
		accaoAjax('${tarefaId}', '${tarefaType}', '${tarefaTitulo}');
	}

</script>


