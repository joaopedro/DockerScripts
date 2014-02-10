<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.modulos.modulo' var='modulo'/>

<c:forEach items="${modulosWithLevels}" var="menuEntry" varStatus="mStatus">
<li style="width:100%">
	<table style="border:none; width:99%;">
		<tr class="geral">
			<c:choose>
				<%-- Item de Modulo --%>
				<c:when test="${empty menuEntry.subEntries}">		
					<td style="width:5%">
						<c:choose>
							<c:when test="${not empty menuEntry.iconFilename}">
								<img src="${pageContext.request.contextPath}/${menuEntry.iconFilename}" id="icon-3-${mStatus.count}"  style="border:none;" alt="${modulo} ${menuEntry.title}" title="${modulo} ${menuEntry.title}"/>
							</c:when>
							<c:otherwise>
								<img src="${iconImgDir}/icon-admin.png"  style="border:none;" id="icon-3-${mStatus.count}" alt="${modulo} ${menuEntry.title}" title="${modulo} ${menuEntry.title}"/>						
							</c:otherwise>
						</c:choose>
					</td>
					<td style="width:87%; line-height:1.38em;" id="titulo-3-${mStatus.count}" class="textoMenu">
						<a href='${pageContext.request.contextPath}${menuEntry.link}' onclick='javascript: setMenuCookieCurrent(this.id);setMenuCookie();' id="titulo-link-3-${mStatus.count}" title="${menuEntry.title}">
							${menuEntry.title}
						</a>
					</td>
					<td style="width:4%">&nbsp;</td>
				</c:when>
				<%-- Agrupamento de modulo --%>
				<c:otherwise>
					<td style="width:5%">
						<a href="javascript:showHideDiv('3', '${mStatus.count}');" title="abrir/fechar menu" >
							<c:choose>
							<c:when test="${not empty menuEntry.iconFilename}">
								<img src="${pageContext.request.contextPath}/${menuEntry.iconFilename}"  id="icon-3-${mStatus.count}"  style="border:none;" alt="${modulo} ${menuEntry.title}" title="${modulo} ${menuEntry.title}"/>
							</c:when>
							<c:otherwise>
								<img src="${iconImgDir}/icon-admin.png"  id="icon-3-${mStatus.count}"  style="border:none;" alt="${modulo} ${menuEntry.title}" title="${modulo} ${menuEntry.title}"/>						
							</c:otherwise>
							</c:choose>
						</a>
					</td>
					<td style="width:87%; " id="titulo-3-${mStatus.count}" class="textoMenu">
						<a href="javascript:showHideDiv('3', '${mStatus.count}');" title="${modulo} ${menuEntry.title}" >${menuEntry.title}</a>
					</td>
					<td style="width:4%">
						<a href="javascript:showHideDiv('3','${mStatus.count}');">
							<img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-3-${mStatus.count}" alt="${modulo} ${menuEntry.title}" title="${expandirColapsar} ${menuEntry.title}"/>
						</a>
					</td>
				</c:otherwise>
			</c:choose>			
		</tr>
	</table>
</li>
<c:if test="${not empty menuEntry.subEntries}">
	<c:set var="modulos" value="${menuEntry.subEntries}" scope="request" />
	<c:set var="menuidprefix" value="${mStatus.count}" scope="request" />
	<c:import url="/ipdms/base/menu/modulosubgroup.jsp"></c:import>
</c:if>
</c:forEach>