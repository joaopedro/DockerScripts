<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript">
deleteQuestion = function (btn){
   if(btn=='yes') {
      removeComentarioPessoal();
   }
};

Checkboxes = function (state) {
    $$('input[type="checkbox"][name^="removeRow_"]').each(function filter(item) { item.checked=state; });
};   
</script>

<%-- List --%>
<c:choose>
	<c:when test="${not empty comentariospessoais}">
		&nbsp; 
		<span class="formlabel_select">
			<fmt:message key="ipdms.seleccionar" /> <a href="#" onclick="Checkboxes(true);"><fmt:message key="ipdms.todos" /></a>,
				 		  <a href="#" onclick="Checkboxes(false);"><fmt:message key="ipdms.nenhum" /></a>
		</span><br/><br/>
		<form id="deleteComentarioForm">
		<table class="centro" width="80%" cellspacing="1">
			<tr class="listHeader">
				<th class="centro"><fmt:message key="ipdms.comentariopessoal.comentario" /></th>
				<th class="centro" style="width:3%;"><fmt:message key='ipdms.forms.eliminar' /></th>
			</tr>
			<c:forEach var="cp" items="${comentariospessoais}">
			<tr>
				<td class="centro" onclick="editComentarioPessoal(${cp.id});">${cp.comentario}</td>
				<td class="centro" style="text-align: center;">
					<input type="checkbox" id="removeRow_${cp.id}" name="removeRow_${cp.id}" value="checked" class="radion" />
				</td>
			</tr>
			</c:forEach>
		</table>
		<div id="alignRight">
				<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
					onclick="cancelar(event,'<fmt:message key="ipdms.comentariopessoal.titulo" />','<fmt:message key="ipdms.comentariopessoal.removerquestion" />',deleteQuestion,'<fmt:message key="webflow.sim" />','<fmt:message key="webflow.nao" />');" 
					class="cursorMao" alt="<fmt:message key='ipdms.forms.eliminar' />" title="<fmt:message key='ipdms.forms.eliminar' />" />
		</div>				
		</form>	
	</c:when>
	<c:otherwise>
		<span class="formlabel" style="padding-left: 20px;"> 
			<fmt:message key="ipdms.comentariopessoal.empty" />
		</span>
	</c:otherwise>
</c:choose>
