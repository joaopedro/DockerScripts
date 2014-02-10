<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="tilesObjectName">
	<tiles:getAsString name='objectName'/>
</c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="${tilesObjectName}" var="objectName" />
<fmt:message key="ipdms.listagem" var="listagem" />

<bean:define id="mapping" name="<%= org.apache.struts.Globals.MAPPING_KEY %>" />
<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">
		<bean:define id="referer"><bean:write name="mapping" property="path" />.do2</bean:define>

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">	

			var urlAnterior = '<%= org.apache.struts.util.RequestUtils.encodeURL(referer.toString()) %>';
			var rules = {
				'#worklist tbody tr': function(el) {
					el.onmouseover = function(){
						Element.addClassName(this,'active-row')				
					};
					el.onmouseout = function() {
						Element.removeClassName(this, 'active-row');
					};				
				},
				'#worklist tbody tr td[class="clickableDisplayColumn"]' : function (el) {
					el.onclick = function(event) {
						var queryString = '';						
						var spanElement = $(this).up().select('span');
						if(spanElement.first()) {
							queryString += spanElement.first().innerHTML.split(',').join('&');
						}
						if(queryString != '') {
							queryString += '&';
						}
						queryString += "&urlAnterior=" + urlAnterior;
						window.location.href = getUrl('<tiles:getAsString name="rowAction" />', '<tiles:getAsString name="rowActionMethod" />', queryString);
					};
				}
			};
			Behaviour.register(rules);
		</script>

	<script type="text/javascript">	
		document.title = '${productName} - ${listagem} ${objectName}';	 
	</script>	

		<div class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1" >${listagem} ${objectName}</td>
				  </tr>
				</tbody>
			</table>					
		</div>	
		<br/>	
		<%-- 
			NOTA: o original mapping desta pagina esta a ser guardado pois no caso de o pesquisa form adicionado
			ser o da pesquica avançada, o original mapping é sobreposto por um valor incorrecto. Isto acontece
			pois o jsp do form da pesquisa avançada invoca uma chamada ao controlador de stusts (para obter a lista
			de etapas dinamimacamente) e o valor do original mapping é sobreposto pelo valor do selectatapas
		--%>
		<c:set var="originalMapping" value="${requestScope['org.apache.struts.action.mapping.instance'].path}" scope="request" />

		<tiles:insert attribute="pesquisaForm" flush="false" />

		<script>

		function decisao(btn){

			if(btn=='yes')
				document.deleteForm.submit(); 
			else
				window.location="${pageContext.request.contextPath}/${originalMapping}.do2";	
	
			}

		</script>

		<c:set var="removeAction" scope="request"><tiles:getAsString name="removeAction" /></c:set>
		
		<logic:present name="paginatedList">
			<c:if test="${not empty removeAction}">
				<html:form styleId="deleteForm" action="/${removeAction}">
					<bean:parameter id="pageParam" name="page" value="1" />
					<c:set var="paramId" scope="request"><tiles:getAsString name="paramId" /></c:set>
					<tiles:insert attribute="displayTagTable" flush="false"></tiles:insert>
				</html:form>
			</c:if>
			<c:if test="${empty removeAction}">
				<bean:parameter id="pageParam" name="page" value="1" />
				<c:set var="paramId" scope="request"><tiles:getAsString name="paramId" /></c:set>
				<tiles:insert attribute="displayTagTable" flush="false"></tiles:insert>
			</c:if>
		</logic:present>
		
	
		<br style="clear:both;" />

		<c:set var="addButton" scope="page"><tiles:getAsString name="addButton" /></c:set>
		<c:if test="${not empty addButton}">
			<p>
					<input type="button" title="<fmt:message key='ipdms.forms.adicionar' />" value="<fmt:message key='ipdms.forms.adicionar' />" onclick="window.location.href='<tiles:getAsString name="rowAction" />';" class="btForm">
					
			</p>
		</c:if>
	</tiles:put>
</tiles:insert>