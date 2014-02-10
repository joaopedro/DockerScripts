<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/sinfic-workflow.tld" prefix="wf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.processo.designacaosingular" var="processoDes" />
<fmt:message key="ipdms.modules.processinstance.motivo" var="motivo" />
<fmt:message key="ipdms.multipleNotification.processosTramitar" var="processosTramitar" />
<fmt:message key="ipdms.etapa.encarregar" var="encarregarDes" />
<fmt:message key="ipdms.etapa.delegavel" var="delegavelDes" />
<fmt:message key="ipdms.etapa.encerrar" var="encerrarDes" />
<fmt:message key="ipdms.etapa.suspender" var="suspenderDes" />
<fmt:message key="ipdms.etapa.aguardar" var="aguardarDes" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupTitle" var="cancelarPopupTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupMsg" var="cancelarPopupMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

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
		 document.forms[0].submit();
	} else {
	 	return false;
	}
}


function go_there(varFunc)
{
	var where_to=null;

	Ext.Msg.show({
	   title:varFunc,
	   msg: varFunc+' ${processoDes}?<br> ${motivo}:',
	   buttons: {ok:'Ok', cancel:'Cancelar'},
	   prompt:true,
	   width:300,
	   fn: function(btn,text){
			if(btn=='ok')
	  		where_to=text;
	  		if(where_to!= null){
				if(varFunc=="${suspenderDes}"){
					window.location="${pageContext.request.contextPath}/multipleencerrarsuspender.do2?opcao=suspender&soIds=${soIds}&motivo="+where_to;
				}else if(varFunc=="${encerrarDes}"){
				   	window.location="${pageContext.request.contextPath}/multipleencerrarsuspender.do2?opcao=encerrar&soIds=${soIds}&motivo="+where_to;
				}else if(varFunc=="${aguardarDes}"){
					window.location="${pageContext.request.contextPath}/multipleaguardar.do2?soIds=${soIds}&motivo="+where_to;
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
				el.form.action = 'multipledelegarencarregar.do2?urlanterior=${retorno}';
				el.form.elements['method'].value = 'prepare';
				el.form.page.value = 0;
				return true;
			};
		}
	};

	var rule2 = {
			'#encarregarButton': function (el) {
				el.onclick = function () {
					el.form.action = 'multipledelegarencarregar.do2?funcao=encarregar&urlanterior=${previousurl}';
					el.form.elements['method'].value = 'prepare';
					el.form.page.value = 0;
					return true;
				};
			}
		};
	
	Behaviour.register(rule1);
	Behaviour.register(rule2);


</script>

<%-- Set das propriedades de sessão --%>
<c:set var="notification" value="${mn_firstnotification}" scope="request" />
<c:set var="process" value="${mn_firstprocess}" scope="request" />
<c:set var="etapa" value="${mn_etapa}" />


<bean:define id="mapping" name="<%=org.apache.struts.Globals.MAPPING_KEY%>" />
<bean:define id="path" name="mapping" property="path" />


<%-- Main Body Header --%>
<div class="row" style="text-align:left; padding-top: 0px; width: 100%">
<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
		<tr><td class="titulo1">${etapa.titulo}</td></tr>
	</tbody>
</table>
</div>

<%-- Error Div--%>
<div id="MensagemErro"><html:errors /></div>


<%-- FORMULARIO NOTIFICACAO --%>
<html:form action="multipleNotification" onsubmit="dateFormatCheckonSubmit();">
	<html:hidden property="method" value="process" />
	<html:hidden property="nids" />
	<html:hidden property="page" value="1" />
	
	<input type="hidden" name="soIds" value='${soIds}'/> <%-- para ser utilizado na distribuicao --%>
	
	<bean:define id="retorno">${request.contextPath}/notification.do2?${request.queryString}&clear=no</bean:define>

	<input type="hidden" name="retorno"
		value='<%=session.getAttribute(com.sinfic.ipdms.tramitacao.util.NavigationUtils.REFERER_KEY)%>' />

	<div>
	<br />

	<div id="tabelaResumo" class="resumo" style="min-height: 60px;">
	
		<div class="row formlabel_sf">			
			<div class="leftTab label" style="width: 18%;" title="<fmt:message key='ipdms.notification.header.tipoprocesso' />">
				<span class="textoBold"><fmt:message key="ipdms.notification.header.tipoprocesso" /></span>
			</div>
			<div class="label" style="width: 70%;" title="<fmt:message key='ipdms.notification.header.tipoprocesso' />">
				${process.servicoOnline.variante.titulo}
			</div>
		</div>
		<div class="row formlabel_sf">			
			<div class="leftTab label" style="width: 18%;" title="${processosTramitar}">
				<span class="textoBold">${processosTramitar}:</span>
			</div>
			<div class="label" style="width: 70%;" title="${processosTramitar}">
				<c:forEach var="n" items="${notifications}">
					<b>${n.process.servicoOnline.idProcessoEntidade}</b> 
					(<fmt:formatDate value="${n.process.servicoOnline.dataPreenchimento.time}" pattern="dd/MM/yyyy HH:mm" />)
					<br/>
				</c:forEach>
			</div>
		</div>
	</div>
	<div style="clear:both"><br /></div>

<script>
//Alterar tamanho do div que contem o cabecalho.
if(document.body.clientWidth<=1024) {
	$('tabelaResumo').setStyle({minHeight: '80px'});
} else {
	$('tabelaResumo').setStyle({minHeight: '60px'});
}
</script>

	<div id="tabelaForm"><%-- TABELA COM CAMPOS --%>
	<table cellpadding="0" cellspacing="0" style="border:none;" class="mainMensagem">
		<tbody>
			<tr>
				<td style="height: 100%; width: 1px">
					<img src="${pageContext.request.contextPath}/images/misc/1x1.gif" height="100%" width="1px" alt="imagem decorativa" title="imagem decorativa" />
				</td>
				<td>
					<div class="row"  style="text-align:left; padding-top:0px; ">
						<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
							<tbody>
							  <tr>
							    <td class="titulo2"><tiles:insert beanName="body" /></td>
							  </tr>
							</tbody>
						</table>					
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- mainMensagem -->
	</div>

	<c:set var="notificationForm" value="${multipleNotificationForm}" scope="request" />
	<jsp:include page="../dynamicform.jsp" />

	<div class="footer" id="result-pane">
		<wf:result-pane notificationId="notification">
			<tiles:insert beanName="resultPane" />
		</wf:result-pane>
	</div>

	<div id="accoesMovimento" style="margin-left:0px; margin-top:15px;">
		<wf:result-pane notificationId="notification">
		
			<c:if test="${etapa.encarregar}">
				<html:submit value="${encarregarDes}" styleClass="btForm"
					styleId="encarregarButton" title="${encarregarDes}" />
			</c:if>
			<c:if test="${etapa.delegavel}">
				<html:submit value="${delegavelDes}" styleClass="btForm"
					styleId="delegarButton" title="${delegavelDes}" />
			</c:if>
			<c:if test="${etapa.encerrar}">
				<input class="btForm" onclick="go_there('${encerrarDes}');" type="button" value="${encerrarDes}" title="${encerrarDes}" />
			</c:if>
			<c:if test="${etapa.suspender}">
				<input onclick="go_there('${suspenderDes}');" class="btForm"
					type="button" value="${suspenderDes}" title="${suspenderDes}" />
			</c:if>
			<c:if test="${etapa.aguardar}">
				<input onclick="go_there('${aguardarDes}');" class="btForm"
					type="button" value="${aguardarDes}" title="${aguardarDes}" />
			</c:if>
			<html:submit value="${submit}" title="${submitTitle}" styleClass="btForm" onclick="if( window != parent ) this.form.target = '_parent';" />
	</wf:result-pane> 
	
		<input id="condition" type="hidden" class="cancel"/>
		<input type="button"  value="${cancelar}" title="${cancelarTitle}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao,'${sim}','${nao}');"/>&nbsp;
	</div>

</div>
<div id="innerAction"></div>
</html:form>