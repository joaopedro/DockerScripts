<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.lancarsubprocesso.title" var="title" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.failMsg" var="failMsg" />
<fmt:message key="ipdms.forms.terminar" var="terminar" />
<fmt:message key="ipdms.forms.terminar.title" var="terminarTitle" />

<html:form action="/tarefas/escolhersubprocesso" method="post">
<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
		  </tr>
		</tbody>
	</table>					
</div> 

<html:errors/>
<table width="100%" cellpadding="1" cellspacing="1" style="border:none;">
	<tr><td>&nbsp;</td></tr>
	<tr>
		<td class="formlabel">		
			${failMsg}			 
		</td>
	</tr>
</table>
<div class="buttonRow">
	<html:submit property="_eventId_next" value="${terminar}" styleClass="btForm" onclick="setActionAndSubmit(this.form, '${pageContext.request.contextPath}${urlAnterior}');" title="${terminarTitle}"/>
</div>
</html:form>