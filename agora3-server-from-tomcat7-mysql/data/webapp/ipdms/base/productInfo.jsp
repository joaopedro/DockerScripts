<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div style="background-image:url(${pageContext.request.contextPath}/images/misc/fundoProductInfo.jpg); background-repeat:no-repeat; background-position:bottom right; height:100%">
<div class="titulo1" style="height:25px; font-weight:bold; font-size:10px;"><div style="margin-top:5px;"><fmt:message key="ipdms.info.produtosInstalados"/></div> <img src="${pageContext.request.contextPath}/images/logo/SINFIC.png" 
	  		title="${productInfo.ipdmsCore.description}" alt="${productInfo.ipdmsCore.description}" style="float:right; text-align:right; padding-right:10px; margin-top:-20px;"/></div>
<br />
<div style="background-color:#ece6e6; width:100%; height:15px; padding:10px;">
	<div style="width: 15%; float:left; padding-left:10px; text-align:left;" title="Logo">
	  	<img src="${pageContext.request.contextPath}/${productInfo.ipdmsCore.logoRelativePath}" 
	  		title="${productInfo.ipdmsCore.description}" alt="${productInfo.ipdmsCore.description}"/>
  	</div>
  	<div style="width: 75%; float:right; text-align:right; padding-right:20px; text-transform: uppercase;" class="texto" title="Versão">
  		${productInfo.ipdmsCore.title} &nbsp;<span class="textoBold" style="text-transform: capitalize;">${productInfo.ipdmsCore.version}</span>
  	</div>
</div>
<div style="clear:both; height:5px;"></div>
<c:forEach var="product" items="${productInfo.products}">
<div style="background-color:#ece6e6; width:100%; height:15px; padding:10px;">
	<div style="width: 15%; float:left; padding-left:10px; text-align:left;" title="Logo">
	  	<img src="${pageContext.request.contextPath}/${product.logoRelativePath}" 
	  		title="${product.description}" alt="${product.description}"/>
  	</div>
  	<div style="width: 75%; float:right; text-align:right; padding-right:20px; text-transform: uppercase;" class="texto" title="Versão">
  		${product.title} &nbsp;<span class="textoBold" style="text-transform: capitalize;">${product.version}</span>
  	</div>
</div>
<div style="clear:both; height:5px;"></div>
</c:forEach>

</div>