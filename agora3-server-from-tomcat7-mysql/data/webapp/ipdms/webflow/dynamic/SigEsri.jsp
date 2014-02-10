<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />

<script type="text/javascript">
openDialog = function (form) {
	var url = '${dynamic.webEsriUrl}' +'${dynamic.guidEsri }';
    var result = window.showModalDialog(url);
}
</script>

<logic:notPresent name="_resumo" scope="request">
<html:form action="applicationFlow" method="post" >
	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">
	<br/>
	<fmt:message key='ipdms.webflow.sig.enquadramente'/>
    <br/><br/>
    <input type="button" value="<fmt:message key='ipdms.webflow.sig.esri'/>" title="<fmt:message key='ipdms.webflow.sig.esri'/>" onclick="openDialog(this.form)" />
 
	<div style="clear:both"></div><br />
	<div class="buttonRow">
		<html:submit property="_eventId_back" value="${anterior}" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="${anteriorTitle}"/>
		<html:submit property="_eventId_next" value="${seguinte}" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="${seguinteTitle}"/>
	</div>
	<div style="clear:both"></div>
	<br/>				
	<br/>
</html:form>

