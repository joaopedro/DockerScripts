<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="title">${dynamic.formTemplate.title}</c:set>
<c:if test="${empty subtitle}">
	<c:set var="subtitle">${dynamic.formTemplate.subtitle}</c:set>
</c:if>

<c:set var="tilesTituloEcra">
	<tiles:getAsString name='titulo-ecra' />
</c:set>

<c:if test="${not empty tilesTituloEcra}">
 <fmt:message key="${tilesTituloEcra}" var="tituloEcra" />
</c:if>

<fmt:message key="ipdms.product.name" var="productName"/>

<script type="text/javascript">	
	document.title = '${productName} - ${title}';	 
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<c:set var="body"><tiles:insertAttribute name="body"/></c:set>

<div id="ajaxlayout" >
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
                    ${body}
			</td>
		</tr>
	</tbody>
	</table>
</div>