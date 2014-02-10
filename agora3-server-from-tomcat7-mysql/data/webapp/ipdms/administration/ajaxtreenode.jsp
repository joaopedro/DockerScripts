<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
[
<c:forEach items="${listFormBean.elementos}" var="elemento" varStatus="i">
	{
	title   : "${elemento.titulo} <c:if test='${!elemento.active}'> <i>(<fmt:message key='ipdms.forms.inactivo' />)</i></c:if>",
	id      : ${elemento.id},
	checkbox: {
                    checked : false,
        		    name    : "org",
        		    value   : ${elemento.id},
        		    id      : ${elemento.id}
                   },
	expanded   : false,
	uiProvider : 'col',
    cls        : 'master-task',
	leaf       : false
	},
</c:forEach>
]
