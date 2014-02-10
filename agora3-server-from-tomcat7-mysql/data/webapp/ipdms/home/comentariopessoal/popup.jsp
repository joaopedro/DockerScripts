<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>
	<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
	<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
	<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />
</head>

<body style="overflow: auto;">
	<br>
	<table class="centro" width="80%" cellspacing="1">			
		<tr class="listHeader">
			<th class="centro"><fmt:message key="ipdms.comentariopessoal.comentario" /></th>
		</tr>
		<c:forEach var="cp" items="${comentariospessoais}">
		<tr onclick="affectParentComentarioValue('${cp.comentario}');">
			<td class="centro">${cp.comentario}</td>
		</tr>
		</c:forEach>
	</table>

	<div class="buttonRow" align="center">
			<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.fechar" />" 
				onclick="closeComentarioPopup();" title="<fmt:message key='ipdms.forms.fechar.title' />" />
	</div>
</body>

<script>
affectParentComentarioValue = function (comentario) {
	var el = parent.document.getElementById('${valuePlaceId}');
	if(el) {
		el.value = comentario;
	}
	closeComentarioPopup();
};

closeComentarioPopup = function() {
	parent.winchoose.close();
};	
</script>
</html>