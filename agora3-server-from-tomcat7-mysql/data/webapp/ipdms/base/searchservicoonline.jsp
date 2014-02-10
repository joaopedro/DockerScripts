<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.soassociacao.activos" var="activos" />
<fmt:message key="ipdms.soassociacao.terminados" var="terminados" />
<fmt:message key="ipdms.ajax.processos.msg" var="loading" />

<LINK href='<kcms:path configEntry="THEMES" />/forms.css' type=text/css rel=stylesheet>
<LINK href='<kcms:path configEntry="THEMES" />/estilos.css' type=text/css rel=stylesheet>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<script src='<kcms:path configEntry="JSDIR"/>/prototype.js' type="text/javascript"></script>
<script src="${JS_DIR}/setInputValues.js" type="text/javascript"></script>

<%-- Ajax tags --%>
<script type="text/javascript" src='${JS_DIR}/scriptaculous.js'></script>
<script type="text/javascript" src='${JS_DIR}/ajax/ajaxtags.js'></script>
<script type="text/javascript" src='${JS_DIR}/ajax/ajaxtags_controls.js'></script>


<script type="text/javascript">

	function affectParent(value, description){
		setInputValue(parent.document.getElementById('${param.valuePlaceOlder}'),value);
        setInputValue(parent.document.getElementById('${param.descPlaceOlder}'),description);
        
		parent.${param.window }.close();
	}
	
	function affectParentMultiple(){
		var idsSelected = '';
		var descSelected = '';
		var elements1 = $$('input[type="checkbox"][id^="check_"]').each(function filter(item) {
			if(item.checked) {
				idsSelected += item.id.sub("check_", "") + ';';
				descSelected += $F(item) + ';';
			}
		});
		affectParent(idsSelected, descSelected);
	}
	
	function resetCheckboxes() {
		$$('input[type="checkbox"][id^="check_"]').invoke('writeAttribute', 'checked', false);
	}

	function listServicoOnline(page,nrprocesso){
		$('listServicoOnline').innerHTML='<span class="formfield"><img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" style="width:16px; height:16px; vertical-align:top;" alt="${loading}" title="${loading}" /> ${loading}</span></div>';
		var action = '${pageContext.request.contextPath}/listServicoOnline.do2';
		action += "?valuePlaceOlder=${param.valuePlaceOlder}";
		action += "&descPlaceOlder=${param.descPlaceOlder}";
		action += "&window=${param.window}";
		action += "&idVariante=${param.idVariante}";
		action += "&entidadeId=${param.entidadeId}";
		action += "&entidadeRoleId=${param.entidadeRoleId}";
		action += "&exclude=${param.exclude}";
		action += "&nrproc="+nrprocesso;
		action += "&historico="+getCheckedValue(document.getElementsByName("historico"));
		action += "&page="+page;//para a paginação da displayTable
		action += "&tipoProc="+$('tipoProc').checked;

		var myajax = new Ajax.Updater( 'listServicoOnline',action,
				{method: 'get'} );
	}

	// return the value of the radio button that is checked
	// return an empty string if none are checked, or
	// there are no radio buttons
	function getCheckedValue(radioObj) {
		if(!radioObj)
			return "";
		var radioLength = radioObj.length;
		if(radioLength == undefined)
			if(radioObj.checked)
				return radioObj.value;
			else
				return "";
		for(var i = 0; i < radioLength; i++) {
			if(radioObj[i].checked) {
				return radioObj[i].value;
			}
		}
		return "";
	}
	
	function clearInput(){
		$('procurarprocessoInput').value='';
	}
</script>
<body style="overflow:auto;">


<div class="row formlabel_sf">
	<div class="label" style="width: 95%;" >
		<c:choose>
			 <c:when test="${param.historico == 's'}" > 
				<input type="radio" name="historico" onclick="listServicoOnline(1);clearInput();" value="n"> ${activos}
				<input type="radio" name="historico" onclick="listServicoOnline(1);clearInput();" value="s" checked="checked"> ${terminados}
			</c:when>
		 	<c:otherwise>
		 		<input type="radio" name="historico" onclick="listServicoOnline(1);clearInput();" value="n" checked="checked"> ${activos}
				<input type="radio" name="historico" onclick="listServicoOnline(1);clearInput();" value="s"> ${terminados}
		 	</c:otherwise>
		</c:choose>		
	</div>
	
	<div class="label" style="width: 65%; margin-left: 5px;" title="<fmt:message key="ipdms.soassociacao.procurapor" />">
		<label><fmt:message key="ipdms.soassociacao.procurapor" /></label>
		<input onkeydown="if(event.keyCode==13){ listServicoOnline(1,this.value);} " id="procurarprocessoInput" type="text" value="${param.nrProc}" name="procurarprocesso" class="nao">
	</div>
	
	<div class="label" style="width:30%;" title="<fmt:message key="ipdms.soassociacao.tipoprocura" />">
		<label for="numExacto"><fmt:message key="ipdms.soassociacao.numeroexacto" /></label>
		<input type="checkbox" style="border:0;" name="tipoProc" id="tipoProc" value=""/>  		
	</div>

</div>

<br />
<br />
<br />

<div class="row" style="text-align:left;">
	
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.servicoonline.nome"/></td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="listServicoOnline"><span class='formfield'><img src="${JS_DIR}/ext/resources/images/default/grid/loading.gif" style="vertical-align:top;" alt="${loading}" title="${loading}" /> ${loading}</span></div>

</body>

<script type="text/javascript">
	listServicoOnline('${param.page}','${param.nrProc}');
</script>