<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.new" var="new" bundle="${calendarioBundle}" />
<fmt:message key="ipdms.forms.search" var="search" bundle="${calendarioBundle}" />

<c:set var="viewPrefix" scope="request"><tiles:getAsString name="viewPrefix" /></c:set>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<link href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />
<link href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />

<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/modules/calendario/calendario.js'></script>

<%-- BODY of the ipdms.base layout --%>
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

<br/>
<%-- Button links to create and search --%>
<div>
	<input type="button" class="btForm" value="${new}" title="${new}" onclick="editForm${viewPrefix}();" />
	<input type="button" class="btForm" value="${search}" title="${search}" onclick="search${viewPrefix}();" />
</div>
<br/>
<%-- edit form div --%>
<div id="${viewPrefix}EditFormDiv" style="display: none;">
</div>

<%-- search form div --%>
<div id="${viewPrefix}SearchFormDiv" style="display: none;">
	<tiles:insert attribute="searchForm" flush="false"/>
</div>

<%-- list of elements --%>
<div id="${viewPrefix}ListDiv"></div>

<tiles:insert attribute="scriptpart" />
