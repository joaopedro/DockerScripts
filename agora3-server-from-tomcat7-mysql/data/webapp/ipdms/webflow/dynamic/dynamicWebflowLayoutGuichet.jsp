<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

<c:set var="tilesTituloEcra">
	<tiles:getAsString name="titulo-ecra" />
</c:set>

<c:if test="${not empty tilesTituloEcra}">
	<fmt:message key="${tilesTituloEcra}" var="tituloEcra" />
</c:if>
<tiles:insert definition="guichetelectronico.base">
<tiles:put name="main-body" direct="true">

	<LINK href='${pageContext.request.contextPath}/ipdms/themes/forms.css' type="text/css" rel="stylesheet">
	<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>
	<SCRIPT src="${pageContext.request.contextPath}/ipdms/js/morada.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/IPDMSTreePanel.js" type="text/javascript"></script>

	<c:set var="title">${dynamic.formTemplate.title}</c:set>
<%-- 	<c:set var="subtitle">${tituloEcra}</c:set> --%>
<%-- 	<c:if test="${empty subtitle}"> --%>
<%-- 		<c:set var="subtitle">${dynamic.formTemplate.subtitle}</c:set> --%>
<%-- 	</c:if> --%>
	
	<script type="text/javascript">	
		document.title = '${productName} - ${title}';	 
	</script>
	
	<div id="ajaxlayout" style="padding-left: 8px;">
		<table style="border:none;" cellpadding="0" cellspacing="0" width="100%" >
			<tbody>
			<tr><td>
				<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
					  <tr><td class="titulo1">${title}</td></tr>
					  <c:if test="${not empty tituloEcra}">
					  	<tr><td class="titulo2">${tituloEcra}</td></tr>
					  </c:if>
					</tbody>
				</table>					
			</td></tr>
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
