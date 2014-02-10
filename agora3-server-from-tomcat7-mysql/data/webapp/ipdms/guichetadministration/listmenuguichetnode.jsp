
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

[
<c:forEach items="${menus}" varStatus="i" var="menuguichet">
<c:if test="${not empty menuguichet.id}">
{	
	text       : "<span onmouseover=this.style.textDecoration='underline'; onmouseout=this.style.textDecoration='none'; >${menuguichet.titulo}</span>",
	id         : ${menuguichet.id},
	expanded   : false
	<c:if test="${not empty multiple}">
		   , uiProvider : 'col'
		   , checkbox   : {
         	           xtype  :'checkbox',         	  	  						          		  
                       checked: false,
                       name   : "menu",
                       value  : "${menuguichet.designacao}",
                       id     : "check_" + ${menuguichet.id}
                       }
    </c:if>
	}
 <c:if test="${!i.last}">,</c:if>
 </c:if>
</c:forEach>
]

	