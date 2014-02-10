<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

[
<c:forEach items="${menus}" varStatus="i" var="menuguichet">
	<c:if test="${menuguichet.id != null}">
		{
			title   : "${menuguichet.titulo}",
			id      : ${menuguichet.id},
			checkbox: {
		                    checked : false,
		        		    name    : "menu",
		        		    value   : ${menuguichet.id},
		        		    id      : ${menuguichet.id}
		                   },
			expanded   : false,
			uiProvider : 'col',
		    cls        : 'master-task',
			leaf       : false
		},		
	</c:if>
	
</c:forEach>
]
