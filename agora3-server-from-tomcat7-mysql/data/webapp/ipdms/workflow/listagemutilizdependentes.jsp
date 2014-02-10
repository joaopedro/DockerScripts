<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="accao" value="${pageContext.request.contextPath}/listaprocessospendentesajax.do2" />
<c:if test="${suspender}">
	<c:set var="accao" value="${pageContext.request.contextPath}/listaprocessosreabrirajax.do2" />
</c:if>


<%-- the first time the dependent users are loaded --%>
<input type="hidden" id="firstTimeLoaded" name="firstTimeLoaded" value="true">

<%-- Se existirem utilizadores dependentes --%>
<logic:notEmpty name="colDependentes">  
    
    <div>
        <span class="formlabel_select">
            <fmt:message key="ipdms.seleccionar"/>
            <a href="#" onclick="loadListprocessWithParameters('processos','${accao}','user=todos');" class="formlabel_select">
                <fmt:message key="ipdms.todos"/>
            </a>
        </span>     
    </div>  
    <br/>
        
    
    <div id="lista-util">
        <table cellpadding="0" cellspacing="0" class="centro">
            <tbody>                             
                <logic:iterate id="col" name="colDependentes">
                    <nested:root name="col">
                        <tr>
                            <td class="centro">
                                <a href="#" onclick="loadListprocessWithParameters('processos','${accao}','user=${col.id.numeroConteudo}');">
                                    <nested:write name="col" property="login" />
                                </a>
                            </td>
                        </tr>
                    </nested:root>              
                </logic:iterate>                        
            </tbody>                            
        </table>                                            
    </div>      

</logic:notEmpty>
<%-- Se existirem utilizadores dependentes --%>
        
        
<%-- Se não existirem utilizadores dependentes --%>
<logic:empty name="colDependentes">
    <span class='formfield'>
        <fmt:message key="ipdms.processos.naoexistemutildependentes"/>
    </span>
</logic:empty>

