<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="tilesTituloWizard">
	<tiles:getAsString name='titulo-wizard' />
</c:set>

<c:set var="tilesTituloEcra">
	<tiles:getAsString name='titulo-ecra' />
</c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="${tilesTituloWizard}" var="tituloWizard"/>
<fmt:message key="${tilesTituloEcra}" var="tituloEcra"/>

<tiles:insert definition="guichetelectronico.base">
  <tiles:put name="main-body" direct="true">

	<LINK href='${pageContext.request.contextPath}/ipdms/themes/forms.css' type="text/css" rel="stylesheet">
	<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax.js' type="text/javascript"></script>
	<SCRIPT src="${pageContext.request.contextPath}/ipdms/js/morada.js" type="text/javascript"></script>
<script type="text/javascript">	
	document.title = '${productName} - ${tituloWizard}: ${tituloVariante}';	 
</script>
	<div id="ajaxlayout" style="margin-left: 8px;">
		<table border="0" cellpadding="0" cellspacing="0" width="100%" >
			<tbody>
			<!-- TÍTULOS -->
			<tr>
				<td>
					<table border="0" cellpadding="0" cellspacing="0" class="headings">
						<tbody>
						  <tr>
						    <td class="titulo1">${tituloWizard}: ${tituloVariante}</td>
						  </tr>
						  <tr>
						    <td class="titulo2">${tituloEcra}</td>
						  </tr>
						</tbody>
					</table>					
				</td>
			</tr>
			<tr>
				<td>
					<tiles:get name="body" flush="false" />
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	</tiles:put>
  	<tiles:put name="footer" value="/guichetelectronico/publico/base/footer.jsp"/>
</tiles:insert>