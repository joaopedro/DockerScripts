<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.organica.designacaoplural" var="organicaDes" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradorDes" />
<fmt:message key="ipdms.grupo.designacaoplural" var="grupoDes" />
<fmt:message key="ipdms.funcao.designacaoplural" var="funcaoDes" />
<fmt:message key="ipdms.forms.select.default" var="default" />
<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupTitle" var="cancelarPopupTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupMsg" var="cancelarPopupMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script  type="text/javascript">
	
	//funcao chamada pelo handler da messagebox do ext para executor as funcoes de acordo com o botao seleccionado
	function decisao(btn) {
		if (btn == 'yes') {
			$('condition').setAttribute("name", "org.apache.struts.taglib.html.CANCEL");
			$('condition').setAttribute("value", "Cancelar");
			document.forms[0].submit();
		} else {
			return false;
		}
	}
			
</script>

<script  type="text/javascript">

	function showOrganicaMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idOrganicas" + version;
		paramts += "&descPlaceOlder=organicas" + version;
		paramts += "&window=winchoose&multiple=true";

		winOrg = ExtWindow('${organicaDes}', action, paramts, 'ext');
		
	}

	function showOrganicaColaboradoresMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts = "valuePlaceOlder=idColaboradores" + version;
		paramts += "&descPlaceOlder=colaboradores" + version;
		paramts += "&window=winchoose&multiple=true";

		winCol = ExtWindow('${colaboradorDes}', action, paramts, 'ext');
		
	}

	function showGruposMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListGrupos.do2";
		paramts = "valuePlaceOlder=idGrupos" + version;
		paramts += "&descPlaceOlder=grupos" + version;
		paramts += "&window=winchoose&multiple=true";

		winGrp = ExtWindow('${grupoDes}', action, paramts, 'ext');
		
	}

	function showOrganicaFuncoesMultiple(version) {
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithFuncoes.do2";
		paramts = "valuePlaceOlder=idFuncoes" + version;
		paramts += "&descPlaceOlder=funcoes" + version;
		paramts += "&window=winchoose&multiple=true";

		winFunc = ExtWindow('${funcaoDes}', action, paramts, 'ext');
		
	}
		
</script>



<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<bean:define id="formpath" name="mapping" property="path" />

<html:form action="<%=formpath.toString()%>">
	<html:hidden property="method" value="distribuirQuemRespondeuEtapa" />
	<html:hidden property="nid" />
	<html:hidden property="processType" />
	<html:hidden property="processId" />
	<html:hidden property="activityName"/>	
	<input type="hidden" name="servicoO" value='${servicoO}'/> <%-- Notificao Simples --%>
	<input type="hidden" name="soIds" value='${soIds}'/> <%-- Multiplas notificacoes --%>
		
	<%-- If etapa is distribuivel --%>
	<div id='distribuicao' style="width: 50%; float: left">

		<logic:present name="etapa">
			<script type="text/javascript">	
				document.title = '${productName} - <bean:write name="etapa" property="titulo" />';	 
			</script>
			<div class="row" style="padding-top:0px; text-align:left;">
				<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
							<td class="titulo1"><bean:write name="etapa" property="titulo" /></td>
						</tr>
					</tbody>
				</table>
			</div>
						
			<div class="row" style="padding-top:0px; text-align:left;">
				<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
							<td class="titulo2">
								<fmt:message key="ipdms.tramitacao.distribuicao.respondeuetapa.mensagem" arg0="${etapa.titulo}"/>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
		</logic:present>
		
		<html:errors />
	
		<logic:present name="etapa">
	
			<c:if test="${etapa.distribuivel}">
				<div style="padding-top:10px; padding-bottom: 10px; text-align:left;">
					<select name="qRespondeuEtapa" id="qRespondeuEtapa">
						<option value="">${default}</option>	
						<c:forEach items="${etapas}" var="etapa">
							<c:set var="valor" value="${etapa.value}"/>
							<c:set var="label" value="${etapa.key.titulo} (${valor})"/>
							<c:if test="${empty valor}">
								<c:set var="valor" value="user_emsessao"/>
								<c:set var="label" value="${etapa.key.titulo}"/>
							</c:if>
							<option value="${valor}">${label}</option>
						</c:forEach>
					</select>
				</div>	
										
			</c:if>		
		</logic:present>
	
	</div>
	
	
	<%-- If etapaActual.darConhecimento is active --%>
	<c:if test="${etapaActual.darConhecimento}">
		<div style="width: 50%; float: left">
			<jsp:include page="darconhecimentodist.jsp" />
		</div>	
	</c:if>
	<c:if test="${!etapaActual.darConhecimento}">
		<script type="text/javascript">
			$('distribuicao').setStyle({width: '100%'});
		</script>
	</c:if>
	
	
	<div class="row formlabel_sf">
		<html:submit value="${submit}" styleClass="btForm" title="${submitTitle}"/>
		<input id="condition" type="hidden" class="cancel"/>
		<input type="button" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao,'${sim}','${nao}')" title="${cancelarTitle}"/>
	</div>
</html:form>