<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.organica.designacaoplural" var="organicaDes" />
<fmt:message key="ipdms.colaborador.designacaoplural" var="colaboradorDes" />
<fmt:message key="ipdms.grupo.designacaoplural" var="grupoDes" />
<fmt:message key="ipdms.funcao.designacaoplural" var="funcaoDes" />
<fmt:message key="ipdms.estruturaorganica" var="estruturaorganica" />
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
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script type="text/javascript">

//funcao chamada pelo handler da messagebox do ext para executor as funcoes de acordo com o botao seleccionado
	function decisao(btn){
		if(btn=='yes'){
			 $('condition').setAttribute("name","org.apache.struts.taglib.html.CANCEL");
			 $('condition').setAttribute("value","Cancelar");
			 document.forms[0].submit();
			 }
		else{
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
	<html:hidden property="method" value="distribuirNiveisHierarquicos" />
	<html:hidden property="nid" />		
	<html:hidden property="processType" />		
	<html:hidden property="processId" />
	<html:hidden property="activityName" />
	<input type="hidden" name="servicoO" value='${servicoO}'/> <%-- Notificao Simples --%>

	<logic:present name="etapa">
	<script type="text/javascript">	
		document.title = '${productName} - ${etapa.titulo}';	 
	</script>
		<div class="row" style="width:100%; text-align:left;">
			<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1">${etapa.titulo}</td>
				  </tr>
				</tbody>
			</table>					
		</div>
	</logic:present>
	<html:errors />
	<table width="100%">
		<tr>
			<td width="25%">
				<FIELDSET>
				<LEGEND >&nbsp;<a href="#" onclick="showOrganicaMultiple('');">${estruturaorganica}</a>&nbsp;</LEGEND>
					<html:hidden property="idOrganicas" styleId="idOrganicas"/>
					<div id="organicas"></div>
				</FIELDSET>
			</td>
		</tr>
	</table>	
	<br />
	<c:if test="${etapaActual.darConhecimento}">
		<jsp:include page="darconhecimentodist.jsp"></jsp:include>	
	</c:if>

	&nbsp;&nbsp;&nbsp;
	<html:submit value="${submit}" styleClass="btForm" title="${submitTitle}"/>
	<input id="condition" type="hidden" class="cancel"/>
	<input type="button" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}', '${cancelarPopupMsg}',decisao,'${sim}','${nao}');" title="${cancelarTitle}"/>
</html:form>