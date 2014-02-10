<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>

<li style="width:100%; margin-top:0.31em;">
	<table style="border:none; width:99%;">
		<tr class="geral">
			<td style="width:5%"><a href="javascript:showHideDiv('2', '1');" ><img src="${iconImgDir}/icon-IntroPedidos.png" id="icon-2-1"  style="border:none;"  alt="<fmt:message key='ipdms.menu.processos.intPedidos'/>" title="<fmt:message key='ipdms.menu.processos.intPedidos'/>" /></a></td>
			<td style="width:87%; line-height:1.38em;" id="titulo-2-1" class="textoMenu"><a href="javascript:showHideDiv('2', '1');" title="<fmt:message key='ipdms.menu.processos.intPedidos'/>" ><fmt:message key='ipdms.menu.processos.intPedidos'/></a></td>
			<td style="width:4%"><a href="javascript:showHideDiv('2', '1');" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-1" alt="${expandirColapsar} <fmt:message key='ipdms.menu.processos.intPedidos'/>" title="${expandirColapsar} <fmt:message key='ipdms.menu.processos.intPedidos'/>" /></a></td>
		</tr>
	</table>
</li>

<li id="linhamenu-2-1" style="visibility:hidden; display:none; width:100%; ">
	<ul style="width:100%">
	<c:forEach items="${areasInstrucao}" var="area" varStatus="areaStatus">
		<li style="width:100%;"> 
			<table style="border:none; width:99%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:77%" id="titulo-2-1-${areaStatus.count }" class="textoMenu"><a href="javascript:showHideDiv('2-1', '${areaStatus.count }');" title="${area.title}" >${area.title}</a></td>
					<td style="width:6%"><a href="javascript:showHideDiv('2-1', '${areaStatus.count }');" title="abrir/fechar menu" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-1-${areaStatus.count }" alt="${expandirColapsar} ${area.title}" title="${expandirColapsar} ${area.title}" /></a></td>
				</tr>
			</table>
		</li>
		<li id="linhamenu-2-1-${areaStatus.count }" style="visibility:hidden; display:none; width:100%; ">
			<ul style="width:100%">
				<li style="width:100%;">
				<c:forEach items="${area.subEntries}" var="processo" varStatus="i"> 
					<table style="border:none; width:100%;">
						<tr>
							<td style="width:17%;" class="simboloMenu">» </td>
							<td style="width:60%;" class="textoMenu">
								<a id="titulo-link-2-1-${areaStatus.count }-${i.count}" onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" href="${pageContext.request.contextPath}/listarvariantes.do2?proc=${processo.id}" title="${processo.title}">
									${processo.title}
								</a>
							</td>
							<td style="width:6%;">&nbsp;</td>
						</tr>
					</table>
				</c:forEach>
				</li>
			</ul>
		</li>
	</c:forEach>
	</ul>
</li>
