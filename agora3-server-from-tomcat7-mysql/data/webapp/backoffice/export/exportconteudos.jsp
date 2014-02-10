<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<button onclick="javascript: select('all')">Seleccionar Todos</button>&nbsp;<button onclick="select('none')">DeSeleccionar Todos</button><br/>
<c:forEach items="${ tiposcont }" var="cont">
	<input type="checkbox" name="cont" value="${ cont.numeroConteudo }">${ cont.titulo }<br/>
</c:forEach>
<div style="visibility: hidden">
<form id="frmdata" action="exportdatasave.do2">
<input type="text" name="dados" id="dados">
</form>
</div>
<input type="button" value="Seleccionar" onclick="execute()">
