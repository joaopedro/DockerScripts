<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.adminGuichet' var='adminGuichet'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.adminGuichet.gestaoMenus' var='gestaoMenus'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.adminGuichet.gestaoItensMenu' var='gestaoItensMenu'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.adminGuichet.gestaoNoticias' var='gestaoNoticias'/>

<c:if test="${pageContext.request.interno && pageContext.request.superUser}">
	<li style="width:100%;">
		<table style="border:none; width:99%" summary="Gestão da Administração de Guichet">
			<tr class="geral">
				<td style="width:5%; vertical-align:top;"><a href="javascript:showHideDiv('1', '3');"><img src="${iconImgDir}/icon-adminSistemas.png" id="icon-1-3"  style="border:none;"  alt="${adminGuichet}" title="${adminGuichet}" /></a></td>
				<td style="width:87%; line-height:1.38em;" id="titulo-1-3" class="textoMenu"><a href="javascript:showHideDiv('1', '3');" title="${adminGuichet}">${adminGuichet}</a></td>
				<td style="width:4%"><a href="javascript:showHideDiv('1', '3');" title="abrir/fechar menu" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-1-3" alt="${expandirColapsar} ${adminGuichet}" title="${expandirColapsar} ${adminGuichet}" /></a></td>
			</tr>
		</table>
	</li>
	<li id="linhamenu-1-3" style="visibility:hidden; display:none; width:100%; ">
		<ul style="width:100%">
			<li style="width:100%;"> 
				<table style="border:none; width:95%;" summary="Opções para gestão da Administração de Guichet">
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
							<a onclick="javascript:setMenuCookieCurrent(this.id),setMenuCookie();" id="titulo-link-1-3-1"
								href="${pageContext.request.contextPath}/listMenuGuichet.do2" title="${gestaoMenus}">
								${gestaoMenus}
							</a>
						</td>
					</tr> 
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
							<a onclick="javascript:setMenuCookieCurrent(this.id),setMenuCookie();" id="titulo-link-1-3-2"
								href="${pageContext.request.contextPath}/listMenuItemGuichet.do2" title="${gestaoItensMenu}">
								${gestaoItensMenu}
							</a>
						</td>
					</tr>
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
							<a onclick="javascript:setMenuCookieCurrent(this.id),setMenuCookie();" id="titulo-link-1-3-3"
								href="${pageContext.request.contextPath}/listNoticiaGuichet.do2" title="${gestaoNoticias}">
								${gestaoNoticias}
							</a>
						</td>
					</tr>
				</table>
			</li>
		</ul>
	</li>
</c:if>