<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page 
language="java"
contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"
%>

<fmt:message key="ipdms.processo.infoAdicional.lista" var="titulo" />
<fmt:message key="ipdms.processo.comments" var="comments" />
<fmt:message key="ipdms.processo.infoAdicional.etapas" var="infoAdicionalEtapas" />
<fmt:message key="ipdms.observacoes.clique" var="clique" />
<fmt:message key="ipdms.observacoes.aqui" var="aqui" />
<fmt:message key="ipdms.observacoes.fechar" var="fechar" />

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<LINK href='${THEMES_DIR}/estilos.css' type='text/css' rel='stylesheet'>
<LINK href='${THEMES_DIR}/forms.css' type='text/css' rel='stylesheet'>

<SCRIPT src="${JS_DIR}/comentario.js" type="text/javascript"></script>

<script src='${JS_DIR}/overlibmws/overlibmws.js' type="text/javascript"></script>
<script src='${JS_DIR}/scriptaculous.js' type="text/javascript"></script>
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src='${JS_DIR}/ajax/ajaxtags.js' type="text/javascript"></script>
<script src='${JS_DIR}/ajax/ajaxtags_parser.js' type="text/javascript"></script>
<script src='${JS_DIR}/ajax/ajaxtags_controls.js' type="text/javascript"></script>


<table width="100%">
<tr>
	<td class="formlable" style="text-align:center;">${titulo}</td>
</tr>
<tr><td>&nbsp;</td></tr>
</table>

<div id="tabPanelWrapper">
	<ajax:tabPanel panelStyleId="tabPanel" 
			contentStyleId="tabContent" 
			currentStyleClass="ajaxCurrentTab">
	  <ajax:tab caption="${comments}"
	    baseUrl="comentarioCRUD.do2"
	    parameters="method=readAllComentarios,nid=${nid}"
	    defaultTab='true'/>
	  <ajax:tab caption="${infoAdicionalEtapas}"
	    baseUrl="comentarioCRUD.do2"
	    parameters="method=readAllAtributos,nid=${nid}"/>
	</ajax:tabPanel>
</div>
	
<p class="formlabel" style="text-align:center;">${clique} <a href="javascript:close()" style="color: #136796;">${aqui}</a> ${fechar}</p>
