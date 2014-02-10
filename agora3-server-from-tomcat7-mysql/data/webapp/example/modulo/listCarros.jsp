<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ipdms/js/ext/resources/css/messageEditCreate.css" /> 
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/messageEditCreate.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ipdms/js/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script>

function decisao(btn){

	if(btn=='yes')
		$('carrosForm').submit();
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
	document.title = 'IPDMS - <bean:message key="ipdms.gestao.de" locale="locale"/> <bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/>';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><bean:message key="ipdms.gestao.de" locale="locale"/>&nbsp;<bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="Ajuda" title="Ajuda" /></td>
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
	Ext.example.msg('<bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/>','<bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/>');
}
</script>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><bean:message key="ipdms.gestao.de" locale="locale"/>&nbsp;<bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="Ocultar Ajuda" title="Ocultar Ajuda" /></td>
		  </tr>
		</tbody>
	</table>	
	<ul>
		<li> Para <b>adicionar</b> um(a) <bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/>, carregue no botão <bean:message key="ipdms.forms.criar" locale="locale"/>; </li>
		<li> Para <b>modificar</b> um(a) <bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/>, carregue no seu nome; </li>
		<li> Para <b>eliminar</b> <bean:message key="ipdms.modules.formacao.editarcarro.designacaosingular" locale="locale"/>, seleccione a checkbox nas linhas de dados respectivas e carregue no botão <bean:message key="ipdms.forms.eliminar" locale="locale"/>. </li>
	</ul>				
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<html:form action="/deleteCarros.do2" method="post" styleClass="form" styleId="carrosForm">
<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="$('carrosForm').action='edit${actionName}.do2';$('carrosForm').submit();" class="cursorMao" alt="<bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/>" title="<bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/>" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="$('carrosForm').action='editCarro.do2';$('carrosForm').submit();" title="<bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/>"> <bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/></a></div>
	</div>
</div>

<span class="formlabel_select">
	* Seleccionar: <a href="#" onclick="Checkboxes(true);" class="formlabel_select" title="Todos">Todos</a>,
				   <a href="#" onclick="Checkboxes(false);" class="formlabel_select" title="Nenhum">Nenhum</a>
</span>
 <br/><br/>
<table cellpadding="0" cellspacing="0" class="centro">    
	<c:choose>
	  <c:when test="${not empty carros}">
		<tr>
	      	<th width="100" class="centro"><bean:message key="ipdms.modules.formacao.editarcarro.marca" locale="locale"/></th>
	      	<th width="950" class="centro"><bean:message key="ipdms.modules.formacao.editarcarro.modelo" locale="locale"/></th>
	      	<th width="70" class="alignCenter">Eliminar</th>
	    </tr>
    	  <logic:iterate name="carros" id="carro">
		  <nested:root name="carro">
			  <tr>
			  	<td class="centro">			  		
			  		<nested:link action="/editCarro" paramId="id" paramProperty="id">
			  			${carro.marca}
			  		</nested:link>
			  	</td>
			  	<td class="centro">			  		
			  		${carro.modelo} - ${carro.id}			  		
			  	</td>
			  	<td class="alignCenter">
			  		<a href="${pageContext.request.contextPath}/deleteCarros.do2?id=${carro.id}" class="webflow_link">remover</a>			  		
			  	</td>
			  </tr>
		  </nested:root>
		  </logic:iterate>	  
	  </c:when>
		  <c:otherwise>
		  	<tr class="centro">
		  		<td colspan="2" class="alignCenter">Não existem <bean:message key="ipdms.modules.formacao.editarcarro.designacaoplural" locale="locale"/> criados(as).</td>
		  	</tr>
		  	<tr><td colspan="2">&nbsp;</td></tr>
		  </c:otherwise>
		</c:choose>   		
</table>

</html:form>