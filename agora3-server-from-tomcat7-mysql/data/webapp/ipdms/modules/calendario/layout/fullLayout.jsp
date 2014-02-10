<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:setBundle basename="conf.resources.CalendarioResources" scope="session" var="calendarioBundle"/>

<c:set var="tilesObjectName">
	<tiles:getAsString name="objectName" />
</c:set>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.listing" var="listing" bundle="${calendarioBundle}" />
<fmt:message key="${tilesObjectName}" var="titulo" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.new" var="new" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.forms.search" var="search" bundle="${calendarioBundle}" />

<c:set var="viewName" scope="request"><tiles:getAsString name="viewName" /></c:set>
<c:set var="moduleAction" scope="request"><tiles:getAsString name="rowAction" /></c:set>

<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">

		<%-- BODY of the ipdms.base layout --%>
		<script type="text/javascript">	
			document.title = '${productName} - ${listing} ${titulo}';	 
		</script>
		
		<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/js/behaviour.js'></script>
		
		<script type="text/javascript">	
		
			var rules = {
				'#worklist tbody tr': function(el) {
					el.onmouseover = function(){
						Element.addClassName(this,'active-row');				
					};
					el.onmouseout = function() {
						Element.removeClassName(this, 'active-row');
					};				
				}
				/*,
				'#worklist tbody tr td[class="clickableDisplayColumn"]' : function (el) {
					el.onclick = function(event) {
						var queryString = '';						
						var spanElement = $(this).up().select('span');
						if(spanElement.first()) {
							queryString += spanElement.first().innerHTML.split(',').join('&');
						}
						window.location.href = getUrl('tiles:getAsString name="rowAction" />', 'tiles:getAsString name="rowActionMethod" />', queryString);
					};
				}*/
			};
			Behaviour.register(rules);
		</script>



		<%--PAGE HEADER ROW --%>
		<div class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1" >${listing} ${titulo}</td>
				  </tr>
				</tbody>
			</table>
		</div>
		
		<%-- Button links to create and search --%>
		<div>
			<input type="button" class="btForm" value="${new}" title="${new}" onclick="editForm();" />
			<input type="button" class="btForm" value="${search}" title="${search}" onclick="search();" />
		</div>
		
		<%-- edit form div --%>
		<div id="${viewName}EditFormDiv" style="display: none;">
		</div>
		
		<%-- search form div --%>
		<div id="${viewName}SearchFormDiv" style="display: none;">
			<tiles:insert attribute="searchForm" flush="false"/>
		</div>
		
		<%-- list of elements --%>
		<div id="${viewName}ListDiv"></div>
		
	</tiles:put>
</tiles:insert>

<tiles:insert attribute="scriptpart" />
