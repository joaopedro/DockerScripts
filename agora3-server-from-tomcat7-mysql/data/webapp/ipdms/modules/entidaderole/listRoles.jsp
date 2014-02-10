<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.modules.entidaderelationrole.list.help" var="listHelp" />
<fmt:message key="ipdms.seleccionar" var="seleccionar" />
<fmt:message key="ipdms.todos" var="todos" />
<fmt:message key="ipdms.nenhum" var="nenhum" />
<fmt:message key="ipdms.forms.eliminar" var="eliminar" />
<fmt:message key="ipdms.modules.entidaderelationrole.list.empty" var="listEmpty" />
<fmt:message key="ipdms.modules.entidaderelationrole.delete.confirm" var="deleteConfirm" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script>

function decisao(btn){

	if(btn=='yes')
		$('listFormBean').submit();
	else
		false;
}

function Checkboxes(state) {
    $$('input[type="checkbox"]').each(function filter(item) {
                {
                item.checked=state;
                }
    });
}   

</script>

<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.gestao.de" /> <fmt:message key="ipdms.modules.entidaderelationrole.designacaoplural" />';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.gestao.de" />&nbsp;<fmt:message key="ipdms.modules.entidaderelationrole.designacaoplural" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id='extInfo' ></div>

<script>
var saving;
if(${empty save}){
	saving=false;	
}
else
	saving=true;

	if(saving==true){
	Ext.example.msg('<fmt:message key="ipdms.modules.entidaderelationrole.designacaoplural" />','<fmt:message key="ipdms.modules.entidaderelationrole.editar" />');
}
</script>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.gestao.de" />&nbsp;<fmt:message key="ipdms.modules.entidaderelationrole.designacaoplural" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	${listHelp}				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/module/entidaderole/deleteRoles.do2" method="post" styleClass="form" styleId="listFormBean">
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="$('listFormBean').action='edit${actionName}.do2';$('listFormBean').submit();" class="cursorMao" alt="<fmt:message key="ipdms.modules.entidaderelationrole.criar" />" title="<fmt:message key="ipdms.modules.entidaderelationrole.criar" />" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="$('listFormBean').action='editRole.do2';$('listFormBean').submit();" title="<fmt:message key="ipdms.modules.entidaderelationrole.criar" />"> <fmt:message key="ipdms.modules.entidaderelationrole.criar" /></a></div>
	</div>
</div>

<span class="formlabel_select">
	${seleccionar} <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="${todos}">${todos}</a>,
				   <a href="#" onclick="Checkboxes(false);" class="formlabel_select" title="${nenhum}">${nenhum}</a>
</span>
 <br/><br/>
<table cellpadding="0" cellspacing="0" class="centro">    
	<c:choose>
	  <c:when test="${not empty listFormBean.elementos}">
		<tr>
	      	<th width="1150" class="centro"><fmt:message key="ipdms.modules.entidaderelationrole.designacaosingular" /></th>
	      	<th width="70" class="alignCenter">${eliminar}</th>
	    </tr>
    	  <logic:iterate name="listFormBean" property="elementos" id="elementos">
		  <nested:root name="elementos">
			  <tr>
			  	<td class="centro">
			  		<c:set var="tituloRole"><nested:write property="titulo" /></c:set>
			  		<nested:link action="/module/entidaderole/editRole" paramId="id" paramProperty="id" title="${tituloRole}">
			  			${tituloRole}
			  		</nested:link>
			  	</td>
			  	<td class="alignCenter">
			  		<nested:checkbox property="seleccionado" indexed="true" styleClass="radion" style="border:0;"/>
			  		<nested:hidden property="id" indexed="true"/>
			  	</td>
			  </tr>
		  </nested:root>
		  </logic:iterate>	  
	  </c:when>
		  <c:otherwise>
		  	<tr class="centro">
		  		<td colspan="2" class="alignCenter">${listEmpty}</td>
		  	</tr>
		  	<tr><td colspan="2">&nbsp;</td></tr>
		  </c:otherwise>
		</c:choose>   		
</table>
<div id="alignRight">
	<c:if test="${not empty listFormBean.elementos}">
		<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="cancelar(event,'<fmt:message key="ipdms.modules.entidaderelationrole.designacaoplural"  />', '${deleteConfirm}',decisao,'${sim}','${nao}');" class="cursorMao" alt="${eliminar}" title="${eliminar}" />
	</c:if>
</div>
<br />

</html:form>