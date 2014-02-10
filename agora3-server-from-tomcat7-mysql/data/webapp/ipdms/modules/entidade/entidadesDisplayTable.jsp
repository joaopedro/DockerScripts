<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.modules.entidade.id" var="entidadeId" />
<fmt:message key="ipdms.modules.entidade.nome" var="nome" />
<fmt:message key="ipdms.modules.entidade.nif" var="nif" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.modules.entidade.designacaoplural" var="designacaoplural" />
<fmt:message key="ipdms.modules.entidade.eliminar.confirm" var="confirm" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>


<script type="text/javascript">

function Checkboxes(state) {
    $$('input[type="checkbox"]').each(function filter(item) {
        {
        item.checked=state;
        }
});

}   

</script>
<c:if test="${not empty paginatedList.list}">
<span class="formlabel_select">
	${seleccionar} <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="${todos}">${todos}</a>,
				   <a href="#" onclick="Checkboxes(false);" class="formlabel_select" title="${nenhum}">${nenhum}</a>
</span><br/><br/>
</c:if>

<display:table id="entidades" name="${paginatedList}" htmlId="worklist"  requestURI="${originalMapping}.do2" style="cursor: pointer">
	<display:column title="${entidadeId}" class="clickableDisplayColumn" >
		${entidades.id}<span style="display: none;">${paramId}=${entidades.id}</span>
	</display:column>
	<display:column title="${nome}" sortable="true" sortName="nome" class="clickableDisplayColumn" style="id=${entidades.id}" property="nome"/>
	<display:column title="${nif}" sortable="true" sortName="nif" property="nif" class="clickableDisplayColumn" style="width:15%;"></display:column>
	<c:if test="${not empty removeAction}">
		<c:if test="${!IPDMSInteropReceiver}">
		<display:column style="text-align:center; width:5%" title="${eliminar}">
			<label for="removeRow_${entidades.id}"><input type="checkbox" id="removeRow_${entidades.id}" name="removeRow_${entidades.id}" value="checked" class="radion" style="text-align:center; border:none;"/></label> 	
		</display:column>
		<display:footer>
			<td colspan="3" class="tableFooter">&nbsp;</td>
			<td class="tableFooter alignCenter"><img
				src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
				onclick="cancelar(event,'${designacaoplural}','${confirm}',decisao,'${sim}','${nao}');" class="cursorMao" alt="${eliminar}"
				title="${eliminar}" /></td>
		</display:footer>
		</c:if>
	</c:if>
</display:table>