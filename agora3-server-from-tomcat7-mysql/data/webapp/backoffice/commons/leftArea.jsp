<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${ logged == 'true' }">
<div style="font-size: 0.8em" id="leftareabanner" style="display: none">
<ul id="DHTMLSuite_tree2" class="DHTMLSuite_tree">
	<li id="rootexplorer"><a href="#">KCMS</a>
		<ul>
			<logic:present name="tipificacoesNaoStandard">
			<li noDrag='true'><a href="#"><bean:message key="kcms.backoffice.tipificaoesNaoStandard" /></a>
				${tipificacoesNaoStandard}
			</li>
			</logic:present>
			<logic:present name="tipificacoesStandard">
			<li noDrag='true'><a href="#"><bean:message key="kcms.backoffice.tipificacoesStandard" /></a>
				<ul>
					<c:forEach var="conteudo" items="${tipificacoesStandard}">
						<li noDrag="true"><a href="javascript: startLinkGeneric( 'listConteudos.do2', 'codTipo=${ conteudo.numeroConteudo }', 'mainbody' )">${conteudo.titulo}</a></li>
					</c:forEach>
				</ul>
			</li>
			</logic:present>
			<logic:present name="aplicacoesc">
			<li noDrag='true'><a href="#"><kcms:i18n conteudo="aplicacoesc" property="titulo"/></a>
				<logic:present name="aplicacoes">
					<ul>
					<c:forEach var="conteudo" items="${aplicacoes}">
						<logic:notEmpty name="conteudo" property="linkEspecifico">
							<li noDrag="true"><a href="javascript: startLinkGeneric( '${ conteudo.linkEspecifico }', 'appnumber=${ conteudo.numeroConteudo }', 'mainbody' )">${conteudo.titulo}</a></li>
						</logic:notEmpty>
					</c:forEach>
					</ul>
				</logic:present>
			</li>
			</logic:present>			
			<li noDrag='true'><a href="#"><bean:message key="kcms.backoffice.tipologia" /></a>
				<ul>
					<bean:define id="codTipoCon"><kcms:configuracao configEntry="CODTIPOCON"/></bean:define>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'listConteudos.do2', 'codTipo=${ codTipoCon }', 'mainbody' )"><bean:message key="kcms.backoffice.listarTipificacoes" /></a></li>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'listEstruturas.do2', '', 'mainbody' );">Listar Estruturas</a></li>
				</ul>
			</li>
			<li noDrag='true'><a href="#"><bean:message key="kcms.backoffice.controlPanel" /></a>
				<ul>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'listMenus.do2', '', 'mainbody' )"><bean:message key="kcms.backoffice.gestaoMenus"/></a></li>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'configs.do2', '', 'mainbody' );"><bean:message key="kcms.backoffice.gestaoConfiguracao"/></a></li>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'listGraphs.do2', '', 'mainbody' )"><bean:message key="kcms.backoffice.gestaoGrafos"/></a></li>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'statistics.do2', '', 'mainbody' );"><bean:message key="kcms.backoffice.visualizaEstatisticas"/></a></li>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'estrutura.do2', '', 'mainbody' )"><bean:message key="kcms.backoffice.estrutura"/></a></li>
					<li noDrag="true"><a href="javascript: startLinkGeneric( 'aprovacoes.do2', '', 'mainbody' )"><bean:message key="kcms.backoffice.aprovacoes"/></a></li>
				</ul>
			</li>
		</ul>
	</li>
</ul>
</div>
</c:if>	
