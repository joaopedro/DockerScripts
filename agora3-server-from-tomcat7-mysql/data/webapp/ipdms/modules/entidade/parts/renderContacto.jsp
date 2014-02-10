<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.nome" var="nome" />
<fmt:message key="ipdms.modules.entidade.funcao" var="funcao" />
<fmt:message key="ipdms.modules.entidade.email" var="email" />
<fmt:message key="webflow.requerente.telefone" var="telefone" />
<fmt:message key="ipdms.forms.editar" var="editar" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />

<div id="errorContacto${tabEs}">
</div>

<c:choose>
	<c:when test="${not empty contactoList}">
	<table cellpadding="0" cellspacing="0" class="centro" style="margin-left:5px; margin-bottom:5px;">
			<tr class="hoverTransparente">
				<th class="centro">${nome}</th>
				<th class="centro">${funcao}</th>
				<th class="centro">${email}</th>
				<th class="centro">${telefone}</th>
				<th class="centro" style="width:4%">${editar}</th>
				<th class="centro" style="width:4%">${eliminar}</th>
			</tr>
			<c:forEach items="${contactoList}" var="contacto" varStatus="i">
			<tr class="linhacontacto">
			<td>${contacto.nome}</td>
			<td>${contacto.funcao}</td>	
			<td>${contacto.email}</td>
			<td>${contacto.telefonePreDefinido}</td>
			<td class="alignCenter">
				<img class="imgButton" src="images/icon/icon-editar.png" onclick="editContacto${tabEs}('${morada_index}', '${i.index}');" title="${editar}" alt="${editar}" />
			</td>
			<td class="alignCenter">
				<img class="imgButton" src="images/icon/icon-lixo.png" onclick="removeContacto${tabEs}('${morada_index}', '${i.index}');" title="${eliminar}" alt="${eliminar}" />			
			</td>
			</tr>
			</c:forEach>
		</table>
	</c:when>
	<c:otherwise>
		<p class="linhacontacto"><fmt:message key="ipdms.modules.entidade.semcontactos" /></p>
	</c:otherwise>
</c:choose>
