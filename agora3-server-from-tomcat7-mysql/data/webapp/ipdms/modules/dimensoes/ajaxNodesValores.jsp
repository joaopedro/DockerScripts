<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

[<c:forEach var="valor" items="${elements}" varStatus="i">
   {
      text : '${valor.descricao}', 
      id   : '${valor.id.numeroConteudo}'
       <c:if test="${param.multiple == 'true'}">
         ,checkbox : {
            xtype    :'radio',                                                                      
            checked  : false,
            name     : 'val',
            value    : '${valor.descricao}',
            id       : 'check_${valor.id.numeroConteudo}'
         },
         uiProvider :'col'
       </c:if>
   }<c:if test="${!i.last}">,</c:if>
</c:forEach>]
