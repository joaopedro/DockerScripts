<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>

<li id="linhamenu-3-${menuidprefix}" style="visibility:hidden; display:none; width:100%; ">
	<c:forEach items="${modulos}" var="menuEntry" varStatus="mStatus">	
	
		<ul style="width:100%">
			<li style="width:100%;"> 
				<table style="border:none; width:99%;">
				<tr class="geral">
					<td style="width:15%;" class="simboloMenu">
						${level}»
					</td>
				<c:choose>
					<%-- Item de Modulo --%>
					<c:when test="${empty menuEntry.subEntries}">
						<td style="width:70%" class="textoMenu">
							<a  id="titulo-link-3-${menuidprefix}-${mStatus.count}"
					 			href="${pageContext.request.contextPath}${menuEntry.link}" onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${menuEntry.title}">${menuEntry.title}
					 		</a>
						</td>
						<td style="width:4%">&nbsp;</td>
					</c:when>
					<%-- Agrupamento de modulo --%>
					<c:otherwise>
						<td style="width:87%; " id="titulo-3-${menuidprefix}-${mStatus.count}" class="textoMenu">
							<a href="javascript:showHideDiv('3-${menuidprefix}', '${mStatus.count}');"  title="${menuEntry.title}">${menuEntry.title}</a>
						</td>
						<td style="width:4%">
							<a href="javascript:showHideDiv('3-${menuidprefix}','${mStatus.count}');">
								<img src="${botaoMais}" class="cursorMao" 
									id="img-3-${menuidprefix}-${mStatus.count}" alt="${expandirColapsar} ${menuEntry.title}" title="${expandirColapsar} ${menuEntry.title}" />
							</a>
						</td>
					</c:otherwise>
				</c:choose>
				</tr>
				</table>							
			</li>
			<c:if test="${not empty menuEntry.subEntries}">
				<c:set var="modulos" value="${menuEntry.subEntries}" scope="request" />
				<c:set var="menuidprefix" value="${menuidprefix}-${mStatus.count}" scope="request" />
				<c:set var="level" scope="request">${level}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:set>
				<c:import url="/ipdms/base/menu/modulosubgroup.jsp"></c:import>
				<c:set var="modulos" value="${modulos}" scope="request" />
			</c:if>
		</ul>	
	</c:forEach>
</li>