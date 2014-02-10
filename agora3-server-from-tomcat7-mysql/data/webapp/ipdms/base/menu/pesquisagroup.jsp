<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.processos.pesquisas' var='pesquisas'/>
<fmt:message key='ipdms.menu.processos.pesquisasTitle' var='pesquisasTitle'/>
<fmt:message key='ipdms.menu.processos.pesquisas.pesquisaAvancada' var='pesquisaAvancada'/>
<fmt:message key='ipdms.menu.processos.pesquisas.porNumProcesso' var='porNumProcesso'/>
<fmt:message key='ipdms.menu.processos.pesquisas.porEntidade' var='porEntidade'/>
<fmt:message key='ipdms.menu.processos.pesquisas.historicoProcessos' var='historicoProcessos'/>
<fmt:message key='ipdms.menu.processos.pesquisas.historicoProcessos.pesquisaAvancada' var='historicoProcessosAvancada'/>
<fmt:message key='ipdms.menu.processos.pesquisas.historicoProcessos.porNumProcesso' var='historicoProcessosNumProcesso'/>
<fmt:message key='ipdms.menu.processos.pesquisas.pesquisaPessoal' var='pesquisaPessoal'/>
<fmt:message key='ipdms.menu.processos.pesquisas.minhasPesquisas' var='minhasPesquisas'/>
<fmt:message key='ipdms.menu.processos.pesquisas.minhasPesquisas.comunicacoesPareceres' var='comunicacoesPareceres'/>
<fmt:message key='ipdms.menu.processos.pesquisas.documentos' var='documentos'/>

<%-- Pesquisa de Processos --%>
<li style="width:100%">
	<table style="border:none; width:99%;">
		<tr class="geral">
			<td style="width:5%"><a href="javascript:showHideDiv('2', '2');"><img src="${iconImgDir}/icon-pesquisa.png" id="icon-2-2"  style="border:none;"  alt="${pesquisasTitle}" title="${pesquisasTitle}"/></a></td>
			<td style="width:87%; line-height:1.38em;" id="titulo-2-2" class="textoMenu"><a href="javascript:showHideDiv('2', '2');" title="${pesquisasTitle}" >${pesquisas}</a></td>
			<td style="width:4%"><a href="javascript:showHideDiv('2', '2');"><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-2" alt="${expandirColapsar} ${pesquisasTitle}" title="${expandirColapsar} ${pesquisasTitle}" /></a></td>
		</tr>
	</table>
</li>
<li id="linhamenu-2-2" style="visibility:hidden; display:none; width:100%; ">
	<ul style="width:100%">
		<li style="width:100%;"> 
			<table style="border:none; width:99%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%" colspan="2" class="textoMenu"><html:link action="/procuraprocessos" module="config" styleId="titulo-link-2-2-1"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${pesquisaAvancada}">${pesquisaAvancada}</html:link></td>
				</tr>					
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%" colspan="2" class="textoMenu"><html:link action="/listnumproc" module="config" styleId="titulo-link-2-2-2"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${porNumProcesso}">${porNumProcesso}</html:link></td>
				</tr>					
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%" colspan="2" class="textoMenu"><html:link action="/searchEntidades" module="config" styleId="titulo-link-2-2-3"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${porEntidade}">${porEntidade}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:70%; line-height:1.38em;" id="titulo-2-2-4" class="textoMenu"><a href="javascript:showHideDiv('2-2', '4');" title="${historicoProcessos}" >${historicoProcessos}</a></td>
					<td style="width:4%"><a href="javascript:showHideDiv('2-2', '4');" title="abrir/fechar menu" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-2-4" alt="${expandirColapsar} ${historicoProcessos}" title="${expandirColapsar} ${historicoProcessos}" /></a></td>
				</tr>
			</table>
		</li>
		<li id="linhamenu-2-2-4" style="visibility:hidden; display:none; width:100%; ">
			<ul style="width:100%">
				<li style="width:100%;"> 
					<table style="border:none; width:100%;">
						<tr>
                            <td style="width:17%;" class="simboloMenu">»</td>
                            <td style="width:60%; line-height:1.38em;" class="textoMenu"><a onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" id="titulo-link-2-2-4-2"
                                href="${pageContext.request.contextPath}/listnumproc.do2?hist=true" title="${historicoProcessosNumProcesso}">${historicoProcessosNumProcesso}</a></td>
                            <td style="width:6%;">&nbsp;</td>
                        </tr>
					</table>
				</li>
			</ul>
		</li>
		<li style="width:100%;"> 
			<table style="border:none; width:99%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%" colspan="2" class="textoMenu"><html:link action="/procuraprocessospessoais" styleId="titulo-link-2-2-5"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${pesquisaPessoal}">${pesquisaPessoal}</html:link></td>
				</tr>						
			</table>
		</li>
		<!-- modulos pesquisa begin -->
		<c:forEach items="${modulosPesquisa}" var="grupoModulos" varStatus="grupoModulosStatus">
		<li style="width:100%;"> 
			<table style="border:none; width:99%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:70%" id="titulo-2-2-${grupoModulosStatus.count + 4}" class="textoMenu"><a href="javascript:showHideDiv('2-2','${grupoModulosStatus.count + 4}');" title="${grupoModulos.title}">${grupoModulos.title}</a></td>
					<td style="width:4%"><a href="javascript:showHideDiv('2-2','${grupoModulosStatus.count + 4}');" title="abrir/fechar menu" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-2-${grupoModulosStatus.count + 4}" alt="${expandirColapsar} ${grupoModulos.title}" title="${expandirColapsar} ${grupoModulos.title}" /></a></td>
				</tr>
			</table>
		</li>
		<li id="linhamenu-2-2-${grupoModulosStatus.count + 4}" style="visibility:hidden; display:none; width:100%; ">
			<ul style="width:100%">
				<li style="width:100%;"> 
					<table style="border:none; width:100%;">
						<c:forEach items="${grupoModulos.subEntries}" var="menuItem" varStatus="i">
							<tr>
								<td style="width:17%;" class="simboloMenu">»</td>
								<td style="width:60%; line-height:1.38em;" class="textoMenu"><a   onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" id="titulo-link-2-2-${grupoModulosStatus.count + 4}-${i.count}"
							 		href="${pageContext.request.contextPath}${menuItem.link}" title="${menuItem.title}">${menuItem.title}</a></td>
								<td style="width:6%;">&nbsp;</td>
							</tr>
			  			</c:forEach>
					</table>
				</li>
			</ul>
		</li>
		</c:forEach>
		<!-- modulos pesquisa end -->
		<li style="width:100%;"> 
			<table style="border:none; width:99%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:70%" id="titulo-2-2-9" class="textoMenu"><a href="javascript:showHideDiv('2-2', '9');" title="${minhasPesquisas}" >${minhasPesquisas}</a></td>
					<td style="width:4%"><a href="javascript:showHideDiv('2-2', '9');" ><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-2-9"  alt="${expandirColapsar} ${minhasPesquisas}" title="${expandirColapsar} ${minhasPesquisas}" /></a></td>
				</tr>
			</table>
		</li>
		<li id="linhamenu-2-2-9" style="visibility:hidden; display:none; width:100%; ">
			<ul style="width:100%">
				<li style="width:100%;"> 
					<table style="border:none; width:100%;">
						<tr>
							<td style="width:17%;" class="simboloMenu">»</td>
							<td style="width:60%; line-height:1.38em;" class="textoMenu"><a onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();"
						 		href="${pageContext.request.contextPath}/procuraComunicPareceres.do2?method=list" id="titulo-link-2-2-9-1" title="${comunicacoesPareceres}">${comunicacoesPareceres}</a></td>
							<td style="width:6%;">&nbsp;</td>
						</tr>
					</table>
				</li>
			</ul>
		</li>
		
		<li style="width:100%;"> 
			<table style="border:none; width:99%;">
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%" colspan="2" class="textoMenu">
						<html:link action="/procuradocumentos" module="config" styleId="titulo-link-2-2-10"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${documentos}">${documentos}</html:link></td>
				</tr>						
			</table>
		</li>
	</ul>
</li>

