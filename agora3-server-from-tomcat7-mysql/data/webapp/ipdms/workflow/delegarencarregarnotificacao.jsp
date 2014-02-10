<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>

<fmt:message key='ipdms.colaborador.designacaosingular' var='colaborador'/>
<fmt:message key='ipdms.forms.anterior' var='anterior'/>
<fmt:message key='ipdms.forms.anterior.title' var='anteriorTitle'/>
<fmt:message key='ipdms.forms.submit' var='submit'/>
<fmt:message key='ipdms.forms.submit.title' var='submitTitle'/>
<fmt:message key='ipdms.etapa.cancelarPopupTitle' var='cancelarPopupTitle'/>
<fmt:message key='ipdms.etapa.cancelarPopupMsg' var='cancelarPopupMsg'/>
<fmt:message key='webflow.sim' var='sim'/>
<fmt:message key='webflow.nao' var='nao'/>

<script type="text/javascript">
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

	function showOrganicaColaborador() {
		
		var action = "${pageContext.request.contextPath}/ajaxListOrganicaWithColaboradores.do2";
		paramts  = "valuePlaceOlder=idColaboradores";
		paramts += "&descPlaceOlder=colaboradores";
		paramts += "&window=winchoose";

		ExtWindow('${colaborador}',action,paramts,'ext');
	}
	
	var rules = {
		'#backButton' : function(el) {
			el.onclick = function() {
				el.form.action = 'notification.do2?nid='+$F('nid')+'&referer=${urlanterior}';
				el.form.elements['method'].value = 'prepare';
				el.form.elements['page'].value = 0;
				return true;
			}
		}
	};
	Behaviour.register(rules);
</script>

<html:errors/>
<html:form action="/delegarencarregar">
	<html:hidden property="method" value="${funcao}" />
	<html:hidden property="nid" styleId="nid"/>
	<html:hidden property="processType" />
	<html:hidden property="processId" />
	
	<html:hidden property="page" value="1" />
	<html:hidden property="clear" value="no" />
	<input type="hidden" name="servicoONr" value="${servicoONr}"/>
	<input type="hidden" name="urlanterior" value="urlanterior" />
	
	<logic:iterate id="attr" name="delegacaoForm"
		property="respondAttribute">
		<bean:define id="value" name="attr" property="key" />
		<html:hidden property='<%="respondAttribute(" + value + ")"%>' />
	</logic:iterate>
	<logic:present name="etapa">
	<div class="row" style="padding-top:0px; text-align:left;">
		<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
			<tbody>
			  <tr>
			    <td class="titulo1">${fn:toUpperCase(fn:substring(funcao,0,1))}${fn:toLowerCase(fn:substringAfter(funcao,fn:substring(funcao,0,1)))}  : ${etapa.titulo}</td>
			  </tr>
			</tbody>
		</table>					
	</div>
	</logic:present>
	<br />
	<FIELDSET>
		<LEGEND>
			<a href="#"	onclick="showOrganicaColaborador();"><fmt:message key="ipdms.notification.encarregar.escolherColaborador"/></a>
		</LEGEND> <html:hidden property="colaborador" styleId="idColaboradores" />
	<div class="formlabel" id="colaboradores"></div>
	</FIELDSET>
	<div class="buttonRow">
		<input id="condition" type="hidden" class="cancel"/>
		<html:submit value="${anterior}" styleClass="btForm" styleId="backButton" title="${anteriorTitle}" />
		<html:submit value="${submit}" styleClass="btForm" title="${submitTitle}" />
		<input type="button"  value="<fmt:message key='ipdms.forms.cancelar'/>" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao, '${sim}','${nao}');" title="<fmt:message key='ipdms.forms.cancelar.title'/>" />
	</div>
</html:form>