<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

[<c:if test="${element != null}">
   {
      text : '${element.designacao}', 
      id   : '${element.id.numeroConteudo}'
       <c:if test="${param.multiple == 'true'}">
         ,checkbox : {
            xtype    :'radio',                                                                      
            checked  : false,
            name     : 'val',
            value    : '${element.designacao}',
            id       : 'check_${element.id.numeroConteudo}'
         },
         uiProvider :'col'
       </c:if>
   }
</c:if>]
