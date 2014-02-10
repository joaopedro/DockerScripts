<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

	<script type="text/javascript">	
		document.title = '${productName} - <fmt:message key="ipdms.modules.active.alert.list.titulo" />';
	</script>
	
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.modules.active.alert.list.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="errorDivAlert">
	<html:errors />
</div>

<div id="editAlertPane"></div>

<div id="alertDiv"><jsp:include page="renderListActiveAlerts.jsp" /></div>

<script>
	var actionUrl = "${pageContext.request.contextPath}/activeAlertsByUser.do2";
	var listDiv = "alertDiv";
	
	dismissAlertas = function() {
		if(!confirm('<fmt:message key="ipdms.modules.alert.dismiss.confirmation" />')) {
			return;
		}
		submitDiv('alertDiv', actionUrl + '?method=dismiss', listDiv, true);
	}

	editPostponeAlert = function(alertId) {
		new Ajax.Updater( {success: 'editAlertPane'}, actionUrl + '?method=preparePostpone', 
				   		  {method: 'get', parameters: 'alertId=' + alertId, evalScripts: true} );
	}

	postponeAlerta = function() {
		submitDiv('editAlertPane', actionUrl + '?method=postpone', 'errorDivAlert', true);
	}
	
	refreshList = function() {
		new Ajax.Updater( {success: listDiv}, actionUrl + '?method=list',  {method: 'get', evalScripts: true} );
	}
</script>
