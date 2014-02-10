<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.menu.modulos" var="modulos" />
<fmt:message key="ipdms.menu.modulos.modulo" var="modulo" />

<li class="tituloMenu" style="width:100%;" >
 	<span class="tituloMenuTexto" >${modulos}</span>
</li>
<li style="width:100%; margin-top:0.31em;">
	<table width="99%" style="border:none">
		<c:forEach items="${modulos}" var="moduloMenuEntry" varStatus="f">
			<tr class="geral" >
				<td style="width:5%">
					<img src="${iconImgDir}/icon-admin.png"  style="border:none;" alt="${modulo} ${moduloMenuEntry.title}" title="${modulo} ${moduloMenuEntry.title}"/>
				</td>
				<c:choose>
					<c:when test="${empty moduloMenuEntry.subEntries}">
						<td style="width:87%;" class="textoMenu">
							<a href='${pageContext.request.contextPath}${moduloMenuEntry.link}' onclick='javascript: setMenuCookieCurrent(this.id);setMenuCookie();' id="titulo-link-2-1-${f.count}" title="${modulo} ${moduloMenuEntry.title}">
								${moduloMenuEntry.title}
							</a>
						</td>
						<td style="width:4%">&nbsp;</td>					
					</c:when>
					<c:otherwise>
						<%-- TODO a construir--%>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
</li>
