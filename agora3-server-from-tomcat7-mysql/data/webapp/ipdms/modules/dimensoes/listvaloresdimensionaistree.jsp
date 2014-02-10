<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
[
<c:forEach items="${elements}" varStatus="i" var="elemento">
{
	text       : "${elemento.descricao}",
	id         : "${elemento.id.numeroConteudo}",
	levelMax   : "${numNiveisMax}",
	height	   : 23,
	expanded   : false,
	img		   : {
                       xtype    :"img",                                                                       
                       name     : "val",
                       src		: "${pageContext.request.contextPath}/images/icon/icon-criarNovo.png",
                       href		: "${pageContext.request.contextPath}/ajaxEditValorDimensional.do2?method=prepare"
                 },
    checkbox   : {
         	           xtype  :'checkbox',         	  	  						          		  
                       checked: false,
                       name   : "val",
                       value  : "${elemento.descricao}",
                       id     : "check_" + ${elemento.id.numeroConteudo}
                 }
	}
 <c:if test="${!i.last}">,</c:if>
</c:forEach>
]