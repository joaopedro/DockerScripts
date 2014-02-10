<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.modules.processinstance.atencao" var="atencao" />

<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="error.default.exception.title" />';	 
</script>

<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="error.default.exception.title" />!</td>
		  </tr>
		</tbody>
	</table>					
</div>

<div class="row formlabel_sf" >
	 <div class="mensagenCaixa">
		<div style="float:left; width:2%;">
			<img src="${pageContext.request.contextPath}/images/icon/icon-atencao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}" />
		</div>
		<div style="float:right; width:95%; vertical-align:middle; margin-top:4px; ">
			<div class="info">
				<fmt:message key="error.default.exception.message"/>
				<c:if test="${!noReturnLink}">
					<fmt:message key="error.default.exception.returnlink">
						<fmt:param>${pageContext.request.contextPath}/homepage.do2</fmt:param>
					</fmt:message>
				</c:if>
			</div>
		</div>
	<div style="clear:both"></div>
	</div>
</div>