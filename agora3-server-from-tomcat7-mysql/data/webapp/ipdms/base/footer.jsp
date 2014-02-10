<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.info.produtos" var="infoProdutos"/>

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/Window_Iframe.js"></script>

<script type="text/javascript">
function showProductInfo(){
	ExtWindow('${infoProdutos}','${pageContext.request.contextPath}/public/ipdmsProductInfo.do2','','html');
}
</script>

<div class="left" style="margin-left: 0.63em; margin-top: 0.63em;">
	<div id="footer">${rodape}</div>
</div>

<div class="right">
	<a href="#" onclick="showProductInfo();" title="${infoProdutos}">
	<br />
	<img
	src="${pageContext.request.contextPath}/images/icon/icon-info.png"
	class="cursorMao" alt="${infoProdutos}" title="${infoProdutos}" /> 
	</a>
</div>
