<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

[
<c:forEach items="${elements}" varStatus="i" var="elemento">
{	
	text       : "<span onmouseover=this.style.textDecoration='underline'; onmouseout=this.style.textDecoration='none'; >${elemento.designacao}</span>",
	id         : ${elemento.id},
	expanded   : false
	<c:if test="${not empty multiple}">
		   , uiProvider : 'col'
		   , checkbox   : {
         	           xtype  :'checkbox',
         	           <c:set var="checkedvalue" value="false" />
					   <c:forEach var="selectedid" items="${fn:split(selectedids, ';')}" >
						  <c:if test="${elemento.id eq selectedid}">
						    <c:set var="checkedvalue" value="true" />
						  </c:if>
					   </c:forEach>         	  	  						          		  
                       checked: ${checkedvalue},
                       name   : "org",
                       value  : "${elemento.designacao}",
                       id     : "check_sel" + ${elemento.id}
                       }
          	<c:if test="${darConhecimento}">
          		, checkbox_dconhe : {
	            	xtype    :'checkbox',
	                checked  : false,
	                name     : "dconhe",
	                value    : "${elemento.designacao}",
	                id       : "check_darconhec" + ${elemento.id}
	            }       		
          	</c:if>
    </c:if>
	}
 <c:if test="${!i.last}">,</c:if>
</c:forEach>
]

