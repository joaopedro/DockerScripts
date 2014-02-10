<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key='ipdms.menu.expandirColapsar' var='expandirColapsar'/>
<fmt:message key='ipdms.menu.processos.minhaArea' var='minhaArea'/>
<fmt:message key='ipdms.menu.processos.minhaArea.analisarDados' var='analisarDados'/>
<fmt:message key='ipdms.menu.processos.minhaArea.comunicaçõesPareceres' var='comunicaçõesPareceres'/>
<fmt:message key='ipdms.menu.processos.minhaArea.processosNotificacoes' var='processosNotificacoes'/>
<fmt:message key='ipdms.menu.processos.minhaArea.processosConhecimento' var='processosConhecimento'/>
<fmt:message key='ipdms.menu.processos.minhaArea.etapasNotificacoes' var='etapasNotificacoes'/>
<fmt:message key='ipdms.menu.processos.minhaArea.draftProcessos' var='draftProcessos'/>
<fmt:message key='ipdms.menu.processos.minhaArea.processosReabrir' var='processosReabrir'/>
<fmt:message key='ipdms.menu.processos.minhaArea.processosPendentes' var='processosPendentes'/>
<fmt:message key='ipdms.menu.processos.minhaArea.importBundleDocs' var='importBundleDocs'/>
<fmt:message key='ipdms.menu.processos.minhaArea.comentsPessoais' var='comentsPessoais'/>

<li style="width:100%;">
	<table style="border:none; width:99%">
		<tr class="geral">
			<td style="width:5%"><a href="javascript:showHideDiv('2', '4');"><img src="${iconImgDir}/icon-mhaArea.png" id="icon-2-4"  style="border:none;"  alt="${minhaArea}" title="${minhaArea}" /></a></td>
			<td style="width:87%; line-height:1.38em;" id="titulo-2-4" class="textoMenu"><a href="javascript:showHideDiv('2', '4');" title="${minhaArea}" >${minhaArea}</a></td>
			<td style="width:4%"><a href="javascript:showHideDiv('2', '4');"><img src="${botaoMais}" style="border:none; text-decoration:none;" id="img-2-4" alt="${expandirColapsar} ${minhaArea}" title="${expandirColapsar} ${minhaArea}" /></a></td>
		</tr>
	</table>
</li>
 	<li id="linhamenu-2-4" style="visibility:hidden; display:none; width:100%; padding-bottom:0.31em;">
	<ul style="width:100%">
		<li style="width:100%;"> 
			<table style="border:none; width:95%">
				<c:if test="${analista}">
					<tr>
						<td style="width:15%;" class="simboloMenu">»</td>
						<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/formulariosanalise" module="config" styleId="titulo-link-2-4-1"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${analisarDados}">${analisarDados}</html:link></td>
					</tr>					
				</c:if>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/comunicacoesPareceres.do2?method=show" module="config" styleId="titulo-link-2-4-2"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${comunicaçõesPareceres}">${comunicaçõesPareceres}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/notifsprocesso" module="config" styleId="titulo-link-2-4-3"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${processosNotificacoes}">${processosNotificacoes}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/conheciprocessos" module="config" styleId="titulo-link-2-4-4"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${processosConhecimento}">${processosConhecimento}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/notifsetapa" module="config" styleId="titulo-link-2-4-5"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${etapasNotificacoes}">${etapasNotificacoes}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu"><html:link action="/processossuspensos" module="config" styleId="titulo-link-2-4-6"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${draftProcessos}">${draftProcessos}</html:link></td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
						<html:link action="/listaprocessosreabrir" module="config" styleId="titulo-link-2-4-7"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${processosReabrir}">${processosReabrir}</html:link>
					</td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
						<html:link action="/listaprocessospendentes" module="config" styleId="titulo-link-2-4-8"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${processosPendentes}">${processosPendentes}</html:link>
					</td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
						<html:link action="/bundle/importBundleForm" module="config" styleId="titulo-link-2-4-9"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${importBundleDocs}">${importBundleDocs}</html:link>
					</td>
				</tr>
				<tr>
					<td style="width:15%;" class="simboloMenu">»</td>
					<td style="width:80%; line-height:1.38em;" colspan="2" class="textoMenu">
						<html:link action="/comentarioPessoalAction" module="config" styleId="titulo-link-2-4-10"  onclick="javascript: setMenuCookieCurrent(this.id);setMenuCookie();" title="${comentsPessoais}">${comentsPessoais}</html:link>
					</td>
				</tr>
			</table>
		</li>
	</ul>
</li>