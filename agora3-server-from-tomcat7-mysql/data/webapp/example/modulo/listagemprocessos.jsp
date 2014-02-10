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
	document.title = 'IPDMS - <bean:message key="ipdms.gestao.de" locale="locale"/> Gestão de processos';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">Gestão de processos&nbsp;</td>
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


<div class="alignLeft">
	<div class="left">
		<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" onclick="$('carrosForm').action='edit${actionName}.do2';$('carrosForm').submit();" class="cursorMao" alt="<bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/>" title="<bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/>" />
	</div>
	<div class="right">
		<div class="texto"><a href="#" onclick="$('carrosForm').action='editCarro.do2';$('carrosForm').submit();" title="<bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/>"> <bean:message key="ipdms.modules.formacao.editarcarro.criar" locale="locale"/></a></div>
	</div>
</div>

	<table cellpadding="0" cellspacing="0" class="centro">
    <tr>
      	<th width="1080" class="centro">Tipo de Processo</th>
      	<th width="100" class="centro">Notificações</th>
    </tr>
    	<tbody>  
    		<c:forEach items="${mapNotificacoesProcesso}" var="processoImpl">
    			<c:set var="count" value="${processoImpl.value}" />
			    <tr>
			      <td class="centro">
		     			<c:url var="link" value="worklist.do2">
						<c:param name="method" value="search" />
						<c:param name="processType" value="${processoImpl.key.workflowType}" />
						<c:param name="parentActivity" value="${processoImpl.key.workflowProcess}" />
						<c:param name="tipo" value="${processoImpl.key.processo.numeroConteudo}" />
						<c:param name="por_processo" value="1"/>
					</c:url>				
					<a href="${link}">${processoImpl.key.processo.titulo}</a>
				  </td>
				  <td>${count}</td>
			      
			    </tr>
	    	</c:forEach>
  		</tbody>
</table>	

