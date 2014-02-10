<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ include file="ecmScriptsThemes.jsp" %>

<c:set var="objectName" scope="request"><tiles:getAsString name="objectName" /></c:set>
<c:set var="viewName" scope="request"><tiles:getAsString name="viewName" /></c:set>
<c:set var="moduleAction" scope="request"><tiles:getAsString name="rowAction" /></c:set>

<fmt:setBundle basename="conf.resources.ECMResources" scope="session" var="ecmBundle"/>

<fmt:message key="${objectName}" var="titulo" bundle="${ecmBundle}" />
<fmt:message key="ipdms.listing" var="listing" bundle="${ecmBundle}" />

<style type="text/css">
	.ecm-dialog .ui-dialog-titlebar, .ecm-form .ui-dialog-titlebar {
		font-size: 0.75em;
	}
	
	.ecm-dialog .ui-dialog-content {
		text-align:center;
		margin: 1em 0px;
		font-size: 0.6em;
	}
	
	.ecm-dialog .ui-dialog-buttonpane button {
		font-size: 0.75em !important;
		float: right;
	}	
</style>

<tiles:insert definition="ipdms.base">
	<tiles:put name="main-body" direct="true">
	
		<script type="text/javascript">	
			document.title = 'IPDMS - ${listing} ${titulo}';	 
		</script>
		
		<%--PAGE HEADER ROW --%>
		<div class="row" style="padding-top:0px; text-align:left;">
			<table style="border:none" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1" >${listing} ${titulo}</td>
				  </tr>
				</tbody>
			</table>
		</div>
		
		<%-- Button links to create and search --%>		
		<div>
			<input id="createBtn" type="button" class="btForm" />
			<input id="searchBtn" type="button" class="btForm" />
		</div>
		
		<%-- edit form div --%>
		<div id="${viewName}EditFormDiv" style="display: none;">
		</div>
		
		<%-- search form div --%>
		<div id="${viewName}SearchFormDiv" style="display: none;">
			<tiles:insert attribute="searchForm" flush="false"/>
		</div>
		
		<%-- list of elements --%>
		<div id="${viewName}ListDiv" style="overflow-y:auto;"></div>	
	</tiles:put>
</tiles:insert>

<tiles:insert attribute="scriptpart" />