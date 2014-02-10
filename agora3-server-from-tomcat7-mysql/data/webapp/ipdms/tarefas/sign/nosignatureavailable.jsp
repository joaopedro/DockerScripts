<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.assinar.title" var="title" />
<fmt:message key="ipdms.tarefas.assinar.signatureImage.empty" var="signatureImageEmpty" />

<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>

<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="${urlAnterior}" method="post">
	<br/>
	<p>${signatureImageEmpty}</p>
	
	<br/>
	<div class="buttonRow">		
		<input type="submit" class="btForm"
			value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</div>	
</html:form>

