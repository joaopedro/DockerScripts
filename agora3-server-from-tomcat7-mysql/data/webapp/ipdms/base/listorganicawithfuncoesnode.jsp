<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


[
<c:forEach items="${elements}" varStatus="i" var="elemento">
{
	
	text       : "${elemento.designacao}",
	id         : ${elemento.id},
	expanded   : false
	<c:if test="${not empty multiple}">
   ,uiProvider :'col'//escolher novo user interface    	
	</c:if>	  
	}
 <c:if test="${!i.last}">,</c:if>
</c:forEach>

<c:if test="${not empty organicaFuncaoList and not empty elements}">,</c:if>


<c:forEach items="${organicaFuncaoList}" var="organicaFuncao" varStatus="j" >
{
		     text      : "<span onmouseover=this.style.textDecoration='underline'; onmouseout=this.style.textDecoration='none'; >${organicaFuncao.funcao.titulo}</span>",
		     id        : ${organicaFuncao.funcao.id},
			 leaf      : true
			<c:if test="${not empty multiple}">
		   	, uiProvider : 'col'
		   	, checkbox   : {
         		        xtype  :'checkbox',         	  	  						          		  
               	        <c:set var="checkedvalue" value="false" />
					    <c:forEach var="selectedid" items="${fn:split(selectedids, ';')}" >
						  <c:if test="${colaborador.numeroConteudo eq selectedid}">
						    <c:set var="checkedvalue" value="true" />
						  </c:if>
					    </c:forEach>   	  	  						          		  
                        checked: ${checkedvalue},
               	        name   : "org",
               	        value  : "${organicaFuncao.funcao.titulo}",
               	        id     : "check_sel" + ${organicaFuncao.funcao.id}
				}
            <c:if test="${darConhecimento}">
          		, checkbox_dconhe : {
	            	xtype    :'checkbox',
	                checked  : false,
	                name     : "dconhe",
	                value    : "${organicaFuncao.funcao.titulo}",
	                id       : "check_darconhec" + ${organicaFuncao.funcao.id}
	            }       		
          	</c:if> 	       
                	       
			</c:if>
		
}
    <c:if test="${!j.last}">,</c:if> 
	</c:forEach>
]

