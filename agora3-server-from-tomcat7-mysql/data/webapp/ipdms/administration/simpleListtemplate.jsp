<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>

<c:set var="bundleName"><tiles:getAsString name="bundlename"/></c:set>
<c:set var="actionName"><tiles:getAsString name="actionname"/></c:set>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 

<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>
 
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script>

function decisao(btn){

	if(btn=='yes')
		$('listFormBean').submit();
	else
		//window.location="list${actionName}.do2";
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
	document.title = '${productName} - <fmt:message key="ipdms.gestao.de"/> <fmt:message key="ipdms.${bundleName}.designacaoplural"/>';	 
</script>

<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.gestao.de"/> <fmt:message key="ipdms.${bundleName}.designacaoplural"/></td>
		    <td style="width:3%; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda'/>" title="<fmt:message key='ipdms.forms.ajuda'/>" /></td>
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
	Ext.example.msg('<fmt:message key="ipdms.${bundleName}.designacaoplural"/>','<fmt:message key="ipdms.${bundleName}.editar"/>');
}
</script>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.gestao.de"/>&nbsp;<fmt:message key="ipdms.${bundleName}.designacaoplural"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda'/>" title="<fmt:message key='ipdms.forms.ocultarAjuda'/>" /></td>
		  </tr>
		</tbody>
	</table>
	<fmt:message key="ipdms.administration.simpleListTemplate.help"/>
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/delete${actionName}.do2" method="post" styleClass="form" styleId="listFormBean">
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="$('listFormBean').action='edit${actionName}.do2';$('listFormBean').submit();" class="cursorMao" alt="<fmt:message key="ipdms.${bundleName}.criar"/>" title="<fmt:message key="ipdms.${bundleName}.criar"/>" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="$('listFormBean').action='edit${actionName}.do2';$('listFormBean').submit();" title="<fmt:message key="ipdms.${bundleName}.criar"/>"> <fmt:message key="ipdms.${bundleName}.criar"/></a></div>
	</div>
</div>

<span class="formlabel_select" >
	<fmt:message key="ipdms.seleccionar"/> <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="<fmt:message key='ipdms.todos'/>"><fmt:message key='ipdms.todos'/></a>,
				   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="<fmt:message key='ipdms.nenhum'/>"><fmt:message key='ipdms.nenhum'/></a>
</span>
<!-- ----- TESTES PARA O BRASIL
<table style="border:1" cellpadding="0" cellspacing="1" class="centro">    
	<tr>
      	<th width="1150" class="centro"><bean:message key="ipdms.${bundleName}.designacaosingular" locale="locale"/></th>
      	<th width="70" class="alignCenter">Eliminar</th>
    </tr>
   	<tbody>
		  <tr>
		  	<td>
		  		<input type="text" name="textfield" id="textfield" style="width:98%"/>
		  	</td>
		  	<td>
		  		<input type="text" style="width:98%" maxlength="100"/>
		  	</td>
		  </tr>
	</tbody>
</table>
<br /><br />--->
 <br />
<table cellpadding="0" cellspacing="0" class="centro">  
	<c:choose>
	  <c:when test="${not empty listFormBean.elementos}">
		<tr>
	      	<th style="width:94%" class="centro"><fmt:message key="ipdms.${bundleName}.designacaosingular"/></th>
	      	<th style="width:3%" class="alignCenter"><fmt:message key='ipdms.forms.eliminar'/></th>
	    </tr>
    	  <logic:iterate name="listFormBean" property="elementos" id="elementos" indexId="counter">
		  <nested:root name="elementos">
			  <tr>
			  	<td class="centro">
			  		<nested:link action="/edit${actionName}" paramId="id" paramProperty="id">
			  			<nested:write property="titulo" />
			  		</nested:link>
			  	</td>
			  	<td class="alignCenter">
			  		<label for="eliminarLabel${counter}"><nested:checkbox property="seleccionado" indexed="true" styleClass="radion" style="border:none" styleId="eliminarLabel${counter}"/></label>
			  		<nested:hidden property="id" indexed="true"/>
			  	</td>
			  </tr>
		  </nested:root>
		  </logic:iterate>	  
	  </c:when>
		  <c:otherwise>
		  	<tr class="centro">
		  		<td colspan="2" class="alignCenter"><fmt:message key="ipdms.tipodocumentoanexado.emptyMsg"/></td>
		  	</tr>
		  	<tr><td colspan="2">&nbsp;</td></tr>
		  </c:otherwise>
		</c:choose>   		
</table>
<div id="alignRight">
	<c:if test="${not empty listFormBean.elementos}">
		<c:if test="${!IPDMSInteropReceiver}">
			<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="cancelar(event,'<fmt:message key="ipdms.${bundleName}.designacaoplural" />','<fmt:message key="ipdms.eliminar.confirm" /> <fmt:message key="ipdms.${bundleName}.designacaoplural" />?',decisao,'<fmt:message key="webflow.sim" />','<fmt:message key="webflow.nao" />');" class="cursorMao" alt="<fmt:message key='ipdms.forms.eliminar'/>" title="<fmt:message key='ipdms.forms.eliminar'/>" />
		</c:if>
	</c:if>
</div>
<br />

</html:form>