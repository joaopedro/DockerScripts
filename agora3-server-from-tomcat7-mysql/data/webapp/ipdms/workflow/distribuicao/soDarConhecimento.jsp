<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.submit" var="submit" />
<fmt:message key="ipdms.forms.submit.title" var="submitTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupTitle" var="cancelarPopupTitle" />
<fmt:message key="ipdms.etapa.cancelarPopupMsg" var="cancelarPopupMsg" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript">

	//funcao chamada pelo handler da messagebox do ext para executor as funcoes de acordo com o botao seleccionado	
	function decisao1(btn) {
		if (btn == 'yes') {
			$('condition').setAttribute("name",
					"org.apache.struts.taglib.html.CANCEL");
			$('condition').setAttribute("value", "Cancelar");
			document.forms[0].submit();
		} else {
			return false;
		}
	}

</script>

<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<bean:define id="formpath" name="mapping" property="path" />
<html:form action="<%=formpath.toString()%>">
	<html:hidden property="method" value="conhecimentoFinal" />	
	<input type="hidden" name="servicoO" value='${servicoO}'/> <%-- Notificao Simples --%>
	<input type="hidden" name="soIds" value='${soIds}'/> <%-- Multiplas notificacoes --%>

	<jsp:include page="darconhecimentodist.jsp"></jsp:include>	
	<input id="condition" type="hidden" class="cancel"/>	
	<html:submit value="${submit}" styleClass="btForm" title="${submitTitle}" />
	<input type="button" value="${cancelar}" class="btFormEscuro" onclick="cancelar(event,'${cancelarPopupTitle}','${cancelarPopupMsg}',decisao,'${sim}','${nao}')" title="${cancelarTitle}"/>
</html:form>