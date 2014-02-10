<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.processos.tramitacao' var='tramitacao'/>

<c:if test="${pageContext.request.superUser}">
	<%-- Tramitação --%>
    <li style="width:100%; ">
		<table style="border:none; width:99%">
			<tr class="geral">
				<td style="width:5%"><a href="javascript:showHideDiv('2', '3');"><img src="${iconImgDir}/icon-tramitacao.png" id="icon-2-3"  style="border:none;"  alt="${tramitacao}" title="${tramitacao}" /></a></td>
				<td style="width:87%; line-height:1.38em;" id="titulo-2-3" class="textoMenu"><a href="javascript:showHideDiv('2', '3');" title="${tramitacao}">${tramitacao}</a></td>
				<td style="width:4%"><a href="javascript:showHideDiv('2', '3');"><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-3" alt="${expandirColapsar} ${tramitacao}" title="${expandirColapsar} ${tramitacao}" /></a></td>
			</tr>
		</table>
  	</li>
 		<li id="linhamenu-2-3" style="visibility:hidden; display:none; width:100%; ">
		<ul style="width:100%">
			<li style="width:100%;"> 
				<table style="border:none; width:95%">
					<c:forEach items="${processosTramitacao}" var="processo" varStatus="i">
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
							<a onclick="javascript:setMenuCookieCurrent(this.id);setMenuCookie();" id="titulo-link-2-3-${i.count}"
									href="${pageContext.request.contextPath}/listaretapas.do2?tipo=${processo.id}" title="${processo.title}">
								${processo.title}
							</a>
						</td>
					</tr>					
					</c:forEach>
				</table>
			</li>
		</ul>
	</li>
</c:if>