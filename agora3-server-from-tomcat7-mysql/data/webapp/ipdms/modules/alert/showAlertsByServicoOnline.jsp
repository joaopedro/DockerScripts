<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>

<script type="text/javascript">	
		document.title = '${productName} - <fmt:message key="ipdms.modules.alert.list.titulo" />';	 
	</script>
	
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.modules.alert.list.titulo" /></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="alertDiv"><jsp:include page="renderListAlertsByServicoOnline.jsp" /></div>

<div id="editAlertPane"></div>

<br/>
<input type="button" onclick="window.location.href='${pageContext.request.contextPath}${urlAnterior}';" class="btForm" value='<fmt:message key="ipdms.forms.anterior" />' title="<fmt:message key='ipdms.forms.anterior.title' />" />

<script>
	var actionUrl = "${pageContext.request.contextPath}/alertsByServicoOnlineAndUser.do2";
	var listDiv = "alertDiv";
	
	updateList = function(numeroProcesso) {
		new Ajax.Updater( {success: listDiv}, actionUrl + '?method=list', 
				   		  {method: 'get', parameters: 'numero=' + numeroProcesso, evalScripts: true} );
	}

	removeAlertas = function() {
		if(!confirm('<fmt:message key="ipdms.modules.alert.remove.confirmation" />')) {
			return;
		}
		submitDiv('alertDiv', actionUrl + '?method=remove', listDiv, true);
	}

	editAlerta = function(numeroProcesso, alertId) {
		var p = 'numero=' + numeroProcesso;
		if(alertId) { p += '&alertId=' + alertId; }
		new Ajax.Updater( {success: 'editAlertPane'}, actionUrl + '?method=edit', 
				   		  {method: 'get', parameters: p, evalScripts: true} );
	}

	saveAlerta = function() {
		submitDiv('editAlertPane', actionUrl + '?method=save', 'errorDivAlert', true);
	}
</script>