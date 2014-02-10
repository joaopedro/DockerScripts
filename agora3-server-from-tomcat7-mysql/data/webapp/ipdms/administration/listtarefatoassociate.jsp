<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>

<script type="text/javascript">
<!--
function switchColor(fieldName)
{
	var index = fieldName.substring(8,fieldName.indexOf(']'));
	var trId = document.getElementById("tr"+index);
	var ordemGeral = document.getElementsByName("tarefas["+index+"].ordenacaoGeral");
	var ordemEspecifica = document.getElementsByName("tarefas["+index+"].ordenacaoEspecifica");

	trId.style.backgroundColor = ordemGeral[0].value > 0 || ordemEspecifica[0].value > 0 ? "whitesmoke" : "";
}
//-->
</script>

<c:set var="formBean" value="${tarefaEtapaFormBean}" />

<script type="text/javascript">	
	document.title = '${productName} - ${formBean.nome} - <fmt:message key="ipdms.etapa.tarefas"/>';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nome} - <fmt:message key="ipdms.etapa.tarefas"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda'/>" title="<fmt:message key='ipdms.forms.ajuda'/>" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nome} - <fmt:message key="ipdms.etapa.tarefas"/></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ocultarAjuda'/>" title="<fmt:message key='ipdms.forms.ocultarAjuda'/>" /></td>
		  </tr>
		</tbody>
	</table>	
	<fmt:message key="ipdms.etapa.associarListTarefas.help"/>	
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<html:form action="/saveTarefaEtapaRelation" method="post" styleClass="form">
<html:hidden property="numero" value="${tarefaEtapaFormBean.numero}"/>
<table cellpadding="0" cellspacing="0" class="centro" style="width:60%">

  <tr>
  	<th class="centro" width="64%"><fmt:message key="ipdms.etapa.associarListTarefas.tarefa"/></th>
  	<th width="9%" class="centro"><fmt:message key="ipdms.etapa.associarListTarefas.ordemGeral"/></th>
  	<th width="12%" class="centro"><fmt:message key="ipdms.etapa.associarListTarefas.ordemEspecifica"/></th>
  	<th width="15%" class="centro"><fmt:message key="ipdms.etapa.associarListTarefas.ordemTarefaPosterior"/></th>
  </tr>


	<logic:present name="formBean" property="tarefas">
	  <logic:iterate name="formBean" property="tarefas" id="tarefas" indexId="counter">
	  <bean:define id="id" name="tarefas" property="id" />
	  <nested:root name="tarefas">
	  <tr id="tr<bean:write name="counter"/>"
			<nested:greaterThan property="ordenacaoGeral" value="0">style="background-color: whitesmoke;"</nested:greaterThan>
			<nested:greaterThan property="ordenacaoEspecifica" value="0">style="background-color: whitesmoke;"</nested:greaterThan>
	  >
	  	<td class="centro"><nested:hidden property="id" indexed="true"/><nested:write property="nome" /></td>
		<td class="centro" style="text-align:center"><nested:text property="ordenacaoGeral" indexed="true" size="5" maxlength="3" onkeypress="return isDigit();" onchange="switchColor(this.name)" styleClass="number"/></td>
		<td class="centro" style="text-align:center"><nested:text property="ordenacaoEspecifica" indexed="true" size="5" maxlength="3" onkeypress="return isDigit();" onchange="switchColor(this.name)" styleClass="number"/></td>
		<td class="centro" style="text-align:center"><nested:text property="ordenacaoExecucaoPosTarefa" indexed="true" size="5" maxlength="3" onkeypress="return isDigit();" onchange="switchColor(this.name)" styleClass="number"/></td>
	  </tr>
	  </nested:root>
	  </logic:iterate>
  </logic:present>
  <logic:notPresent name="formBean" property="tarefas">
  	  <br/>
	  <p class="centro"><fmt:message key="ipdms.etapa.emptyTarefas"/></p>
  </logic:notPresent>
  <tr>
</table>
<br />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
		onclick="this.form.action='${pageContext.request.contextPath}/editEtapa.do2?numero=${formBean.numero}'; this.form.submit();">
	<c:if test="${not empty formBean.tarefas}">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
	</c:if>
</div>

</html:form>