<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.comentariopessoal.criar" var="criar" />

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>


<div class="row" style="text-align:left; padding-top:0px;">
    <table border="0" cellpadding="0" cellspacing="0" class="headings">
        <tbody>
          <tr>
            <td class="titulo1"><fmt:message key="ipdms.comentariopessoal.titulo" /></td>
          </tr>
        </tbody>
    </table>					
</div>
<br/>


<%-- Create Header Link --%>
<div class="alignLeft">
	<div class="left" onclick="editComentarioPessoal();">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" class="cursorMao" 
			alt="${criar}" title="${criar}" />
	</div>
	<div class="right" onclick="editComentarioPessoal();">
		<div class="texto"><a href="#">${criar}</a></div>
	</div>
</div>


<div id="editCPDiv"></div>
<br />
<div id="CPDiv">
	<jsp:include page="render-list-part.jsp" />
</div>
<br />
<script type="text/javascript">
	var cpActionUrl = "${pageContext.request.contextPath}/comentarioPessoalAction.do2";
	var cpListDiv = "CPDiv";

	editComentarioPessoal = function(cpId) {
		var p = 'method=edit';
		if(cpId) { 
			p += '&comentarioid=' + cpId; 
		}
		extAjaxRequest(cpActionUrl, p, null, 'editCPDiv');
	};

	saveComentarioPessoal = function(formname) {
		var p = $('comentarioPessoalForm').serialize();
		extAjaxRequest('saveComentarioPessoalAction.do2', 'method=save&'+ p, 'POST', 'editCPDiv');
	};

	removeComentarioPessoal = function() {
		var p = $('deleteComentarioForm').serialize();
		extAjaxRequest(cpActionUrl, 'method=remove&'+ p, null, 'editCPDiv');
	};

	refreshListComentarioPessoal = function() {		
		extAjaxRequest(cpActionUrl, 'method=listAjax', null, 'CPDiv');
	};	
</script>
