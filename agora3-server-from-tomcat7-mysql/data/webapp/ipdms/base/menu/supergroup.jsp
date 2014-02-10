<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral' var='geral'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.homepage' var='homepage'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.infGeral' var='infGeral'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.alterarDadosPessoais' var='alterarDadosPessoais'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.exportImport.title' var='exportImportTitle'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.exportImport' var='exportImport'/>
<fmt:message key='ipdms.menu.aplicacoesInternas.geral.logout' var='logout'/>

<li style="width:100%; margin-top:0.31em;">
	<table width="99%" style="border:none">
			<tr class="geral">
				<td style="width:5%"><a href="javascript:showHideDiv('1', '1');" ><img src="${iconImgDir}/icon-geral.png" id="icon-1-1"  style="border:none;" alt="${geral}" title="${geral}" /></a></td>
			<td style="width:87%;" id="titulo-1-1" class="textoMenu"><a href="javascript:showHideDiv('1', '1');" title="${geral}">${geral}</a></td>
			<td style="width:4%"><a href="javascript:showHideDiv('1', '1');" ><img src="${botaoMais}" style=" border:none; text-decoration:none;" id="img-1-1" alt="${expandirColapsar} ${geral}" title="${expandirColapsar} ${geral}" /></a></td>
		</tr>
	</table>
</li>
<li id="linhamenu-1-1" style="visibility:hidden; display:none; width:100%; ">
	<ul style="width:100%">
		<li style="width:100%;"> 
			<table style="border:none; width:95%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2"  class="textoMenu"><html:link action="/homepage" module="config" styleId="titulo-link-1-1-1"  onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" title="${homepage}">${homepage}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu" ><html:link action="/informacoes.do2" module="config" styleId="titulo-link-1-1-2"  onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" title="${infGeral}">${infGeral}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/editDadosPessoais" module="config" styleId="titulo-link-1-1-3"  onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" title="${alterarDadosPessoais}">${alterarDadosPessoais}</html:link></td>
				</tr>
				<c:if test="${pageContext.request.interno && pageContext.request.superUser}">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
						<html:link action="/admin/exportimporthomepage" module="config" styleId="titulo-link-1-1-4"  
							onclick="javascript: setMenuCookieCurrent(this.id),setMenuCookie();" title="${exportImportTitle}">
							${exportImport}
						</html:link>
					</td>
				</tr>
				</c:if>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%" colspan="2" class="textoMenu"><a href="${pageContext.request.contextPath}/j_acegi_logout" title="${logout}">${logout}</a></td>
				</tr>
			</table>
		</li>
	</ul>
</li>