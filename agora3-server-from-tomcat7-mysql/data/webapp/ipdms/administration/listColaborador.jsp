<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>

<style>

 .formlabel_select, .formlabel_select a:visited {
	color:#000000;
	font-size:9px;
	font-weight:bold;
}

</style>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script>


function decisao(btn){

	if(btn=='yes')
		$('listFormBean').submit();
	else
		//window.location="listColaborador.do2";
		false;
	
}

function Checkboxes(state) {
    $$('input[type="checkbox"]').each(function filter(item) {
                {
                item.checked=state
                }
    });
    
}  

</script>
<script type="text/javascript">	
	document.title = '${productName} - <fmt:message key="ipdms.gestao.de"/> <fmt:message key="ipdms.colaborador.designacaoplural"/>';
</script>
<div id="ver_ajuda" class="info" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.gestao.de"/>&nbsp;<fmt:message key="ipdms.colaborador.designacaoplural"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda'/>" title="<fmt:message key='ipdms.forms.ajuda'/>" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id='extInfo'></div>
<script>
var saving;
if(${empty save}){
	saving=false;	
} else {
	saving=true;
}

if(saving==true){
	Ext.example.msg('<fmt:message key="ipdms.colaborador.designacaoplural"/>','<fmt:message key="ipdms.colaborador.editar"/>');
}

</script>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.gestao.de"/>&nbsp;<fmt:message key="ipdms.colaborador.designacaoplural"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda'/>" title="<fmt:message key='ipdms.forms.ocultarAjuda'/>" /></td>
		  </tr>
		</tbody>
	</table>
	<fmt:message key="ipdms.colaborador.list.help"/>
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<%-- BOTAO CRIAR NOVO --%>
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="$('listFormBean').action='editColaborador.do2';$('listFormBean').submit();" class="cursorMao" alt="<fmt:message key="ipdms.colaborador.criar"/>" title="<fmt:message key="ipdms.colaborador.criar"/>" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="$('listFormBean').action='editColaborador.do2';$('listFormBean').submit();" title="<fmt:message key="ipdms.colaborador.criar"/>"> <fmt:message key="ipdms.colaborador.criar"/></a></div>
	</div>
</div>

<%-- BOTAO CRIAR NOVO A PARTIR DE UTILIZADOR DE LDAP--%>
<c:if test="${importldapusers}">
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" 
				onclick="$('listFormBean').action='listColaboradorFromLDAP.do2';$('listFormBean').submit();" class="cursorMao" alt="<fmt:message key='ipdms.colaborador.importarLDAP'/>" title="<fmt:message key='ipdms.colaborador.importarLDAP'/>" />
	</div>
	<div class="right">
		<div class="texto">
			<a href="#" onclick="$('listFormBean').action='listColaboradorFromLDAP.do2';$('listFormBean').submit();"> 
				<fmt:message key='ipdms.colaborador.importarLDAP'/>
			</a>
		</div>
	</div>
</div>
</c:if>

<html:form action="/deleteColaborador.do2" method="post" styleClass="form" styleId="listFormBean">

<span class="formlabel_select" >
	<fmt:message key="ipdms.seleccionar"/> <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="<fmt:message key='ipdms.todos'/>"><fmt:message key='ipdms.todos'/></a>,
				   <a href="#"  onclick="Checkboxes(false);" class="formlabel_select" title="<fmt:message key='ipdms.nenhum'/>"><fmt:message key='ipdms.nenhum'/></a>
</span><br/><br/>
<table cellpadding="0" cellspacing="0" class="centro">

	<c:choose>
	  <c:when test="${not empty listFormBean.elementos}">
	  	<tr>
	      	<th width="1150" class="centro"><fmt:message key="ipdms.colaborador.designacaosingular"/></th>
	      	<th width="70" class="alignCenter"><fmt:message key="ipdms.forms.eliminar"/></th>
	    </tr>
	    <logic:iterate name="listFormBean" property="elementos" id="elementos">
		  <nested:root name="elementos">
		  <tr>
		  	<td  class="centro">
		  		<nested:link action="/editColaborador" paramId="numero" paramProperty="numeroConteudo">
			  			${elementos.titulo}
			  			<c:if test="${not empty elementos.extraDetail}">
			  				<span style='font-size:x-small;font-style:italic;'>
			  					(${elementos.extraDetail})
			  				</span>
			  			</c:if>
			  	</nested:link>
		  	</td>
		  	<td class="alignCenter">
		  		<nested:checkbox property="seleccionado" indexed="true" styleClass="radion" style="border:0;"/>
			  	<nested:hidden property="numeroConteudo" indexed="true"/>
		  	</td>
		  </tr>
		  </nested:root>
		  </logic:iterate>	  
	  </c:when>
	  <c:otherwise>
	  	<tr>
	  		<td colspan="2" class="alignCenter"><fmt:message key="ipdms.colaborador.emptyMsg"/></td>
	  	</tr>
	  	<tr><td colspan="2">&nbsp;</td></tr>
	  </c:otherwise>
	</c:choose>
</table>
<div id="alignRight">
	<c:if test="${not empty listFormBean.elementos}">
		<c:if test="${!IPDMSInteropReceiver}">
			<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="cancelar(event,'<fmt:message key="ipdms.colaborador.designacaoplural" />','<fmt:message key="ipdms.colaborador.eliminar.confirm"/>',decisao,'<fmt:message key="webflow.sim"/>','<fmt:message key="webflow.nao"/>');" class="cursorMao" alt="<fmt:message key='ipdms.forms.eliminar'/>" title="<fmt:message key='ipdms.forms.eliminar'/>" />
		</c:if>
	</c:if>
</div>
<br />
</html:form>