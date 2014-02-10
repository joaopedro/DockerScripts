<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.adminSistemas' var='adminSistemas'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.adminSistemas.limparCache' var='limparCache'/>

<c:if test="${pageContext.request.interno && not empty aplicacoes}">
	<li style="width:100%;">
		<table style="border:none; width:99%" summary="Gestão de Administração de Sistemas">
			<tr class="geral">
				<td style="width:5%; vertical-align:top;"><a href="javascript:showHideDiv('1', '2');" title="abrir/fechar menu" ><img src="${iconImgDir}/icon-adminSistemas.png" id="icon-1-2"  style="border:none;"  alt="${adminSistemas}" title="${adminSistemas}" /></a></td>
				<td style="width:87%; line-height:1.38em;" id="titulo-1-2" class="textoMenu"><a href="javascript:showHideDiv('1', '2');" title="${adminSistemas}">${adminSistemas}</a></td>
				<td style="width:4%"><a href="javascript:showHideDiv('1', '2');" title="abrir/fechar menu" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-1-2" alt="${expandirColapsar} ${adminSistemas}" title="${expandirColapsar} ${adminSistemas}" /></a></td>
			</tr>
		</table>
	</li>
	<li id="linhamenu-1-2" style="visibility:hidden; display:none; width:100%; ">
		<ul style="width:100%">
			<li style="width:100%;"> 
				<table style="border:none; width:95%;" summary="Opções para gestão de Administração de Sistemas">
					<c:forEach items="${aplicacoes}" var="aplicacao" varStatus="i">
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
							<a onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" id="titulo-link-1-2-${i.count}"
								href="${pageContext.request.contextPath}/${aplicacao.link}" title="${aplicacao.title}">${aplicacao.title}
							</a>
						</td>
					</tr>   
					</c:forEach>
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
							<a onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" id="titulo-link-1-2-${i.count}"
								href="${pageContext.request.contextPath}/cleanCache.do2?method=prepare" title="${limparCache}">${limparCache}
							</a>
						</td>
					</tr>   					
				</table>
			</li>
		</ul>
	</li>
</c:if>	