<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.processo.designacaosingular" var="processoDes" />

<script type="text/javascript">	
	document.title = '${productName} - ${processoDes} ${servico.variante.titulo} (${servico.idProcessoEntidade})';	 
</script>
<div class="row" style="padding-top:0px; text-align:left; padding-bottom:0px;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${processoDes} ${servico.variante.titulo} (${servico.idProcessoEntidade})</td>
		  </tr>
		</tbody>
	</table>					
</div>

<jsp:include page="listdocumentos.jsp"></jsp:include>
<form action="" method="post">
<br/>
<div class="buttonRow">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
				onclick="this.form.action='${pageContext.request.contextPath}${sessionScope.urlAnterior}';">
</div>
</form>