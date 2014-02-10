<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.pesquisa.porentidade.titulo" var="titulo" />
<fmt:message key="ipdms.pesquisa.porentidade.id" var="id" />
<fmt:message key="ipdms.pesquisa.porentidade.processo" var="processo" />
<fmt:message key="ipdms.pesquisa.porentidade.variante" var="variante" />
<fmt:message key="ipdms.pesquisa.porentidade.dataEntrada" var="dataEntrada" />
<fmt:message key="ipdms.pesquisa.porentidade.papel" var="papel" />
<fmt:message key="ipdms.pesquisa.porentidade.assunto" var="assunto" />
<fmt:message key="ipdms.pesquisa.porentidade.estadoActual" var="estadoActual" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle"/>

<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">
		<bean:define id="referer"><bean:write name="mapping" property="path" />.do2?${urlAnterior}</bean:define>
	
		<script type="text/javascript">
			//var urlAnterior = '<%= org.apache.struts.util.RequestUtils.encodeURL(referer.toString()) %>';
			var rules = {
				'#worklist tbody tr': function(el) {
					el.onmouseover = function(){
						Element.addClassName(this,'active-row')				
					};
					el.onclick = function(event) {
						var childNodes = this.childNodes;
						var queryString = '';
						for (var i = 0 ; i < childNodes.length; i++){
							var child = childNodes[i];
							if (child.nodeType == 1 && child.tagName.toUpperCase() == 'TD'){
								var childNodes2 = child.childNodes;
								for (var j = 0 ; j < childNodes2.length; j++){
									var child2 = childNodes2[j];
									if (child2.nodeType == 1 && child2.tagName.toUpperCase() == 'SPAN') {
										queryString += child2.innerHTML.split(',').join('&');
									}
								} 
							}
						}

						//queryString += "&urlAnterior=" + urlAnterior;
						window.location.href = '<tiles:getAsString name="rowAction" />' + '?' + queryString;
					};
					el.onmouseout = function() {
						Element.removeClassName(this, 'active-row');
					};
				}
			};
			Behaviour.register(rules);
		</script>
		<script type="text/javascript">	
			document.title = '${productName} - ${titulo}';	 
		</script>
		<div class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1">${titulo}</td>
				  </tr>
				</tbody>
			</table>					
		</div>			

		<%-- 
			NOTA: o original mapping desta pagina esta a ser guardado pois no caso de o pesquisa form adicionado
			ser o da pesquica avançada, o original mapping é sobreposto por um valor incorrecto. Isto acontece
			pois o jsp do form da pesquisa avançada invoca uma chamada ao controlador de stusts (para obter a lista
			de etapas dinamimacamente) e o valor do original mapping é sobreposto pelo valor do selectatapas
		--%>
		<c:set var="originalMapping" value="${requestScope['org.apache.struts.action.mapping.instance'].path}"></c:set>

		<logic:notPresent name="paginatedList">
			<div class="row formlabel_sf" >
				<div class="mensagenCaixa">
					<div style="float:left; width:3%;">
						<img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="<fmt:message key='ipdms.instrucao.pedido.info.title' />" title="<fmt:message key='ipdms.instrucao.pedido.info.title' />"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; ">
						<div class="info"><fmt:message key="ipdms.pesquisa.porentidade.norecordsfound" /></div>
					</div>
					<div style="clear:both"></div>
				</div>
			</div>
		</logic:notPresent>
		<logic:present name="paginatedList">
			<%-- E' colocado o request URI fixo pela razao descrita acima. Ver comentario. --%>
			<display:table id="soEntidade" name="${paginatedList}" htmlId="worklist" pagesize="10" requestURI="${originalMapping}.do2">
				<c:set var="servicoOnline" value="${soEntidade.servicoOnline}" />
				<display:column title="${id}" class="realce" media="html">
			 		<span style="display: none" >numero=${servicoOnline.numeroConteudo}</span>
					${servicoOnline.idProcessoEntidade}				
				</display:column>
				<display:column title="${processo}" class="realce" sortable="true">
					${servicoOnline.variante.processo.titulo}
				</display:column>
				<display:column title="${variante}" class="realce" media="html">
					${servicoOnline.variante.titulo}
				</display:column>
				<display:column title="${dataEntrada}" class="realce" sortable="true">
					<c:if test="${not empty servicoOnline.dataPreenchimento}">
						<fmt:formatDate type="both" value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
					</c:if>
				</display:column>
				<display:column title="${papel}" class="realce" sortable="true">
					${soEntidade.id.role.descricao}
				</display:column>
				<display:column title="${assunto}" class="realce" sortable="true">
					${servicoOnline.assunto}
				</display:column>
				<display:column title="${estadoActual}" class="realce" sortable="true">
					<c:if test="${servicoOnline.dataTerminus != null}">
						<fmt:message key="ipdms.pesquisa.porentidade.processofechado" />
					</c:if>
					<c:if test="${servicoOnline.dataTerminus == null}">
						${servicoOnline.nomeEtapaActual}
					</c:if>					
				</display:column>
			</display:table> 
		</logic:present>
		<br/>
		<html:button styleId="back" property="back" onclick="window.location.href = '${urlAnterior}';" styleClass="btForm" title="${anteriorTitle}"><fmt:message key="ipdms.forms.anterior" /></html:button>
	</tiles:put>
</tiles:insert>