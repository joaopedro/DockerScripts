<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="errors.situacaoErro.title" var="title" />
<fmt:message key="errors.situacaoErro.description" var="description" />
<fmt:message key="errors.situacaoErro.userMsg" var="userMsg" />
<fmt:message key="errors.situacaoErro.adminMsg" var="adminMsg" />

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


<P class="formlabel">${description}:</P>

<div id="MensagemErro">
	<html:errors  />
</div>

<P class="formlabel">
	<logic:present name="blame">
		<logic:equal name="blame" value="user">${userMsg}</logic:equal>
		<logic:equal name="blame" value="admin">${adminMsg}</logic:equal>
	</logic:present>
</P>

<DIV style="text-align:center;">
<logic:notPresent name="retorno">
	<logic:present parameter="retorno">
	<bean:parameter id="retorno" name="retorno" />
	</logic:present>
</logic:notPresent>
<logic:present name="retorno">
	<bean:define id="retorno" name="retorno" type="java.lang.String"/>
	<form action="${pageContext.request.contextPath}<%= java.net.URLDecoder.decode(retorno, "UTF-8") %>" method="post">
	<logic:present name="anteriores">
		<input type="hidden" name="anteriores" value="<bean:write name="anteriores"/>">
	</logic:present>
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />" />
	</form>
</logic:present>
</DIV>