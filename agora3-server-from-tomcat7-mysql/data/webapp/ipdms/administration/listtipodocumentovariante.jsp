<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.accao.listtipodocumentovariante.associarTiposDoc" var="associarTiposDoc" />
<fmt:message key="ipdms.accao.listtipodocumentovariante.associar" var="associar" />
<fmt:message key="ipdms.accao.listtipodocumentovariante.docFisico" var="docFisico" />
<fmt:message key="ipdms.accao.listtipodocumentovariante.obrigatorio" var="obrigatorio" />
<fmt:message key="ipdms.accao.listtipodocumentovariante.tipoDocAnexar" var="tipoDocAnexar" />
<fmt:message key="ipdms.accao.listtipodocumentovariante.emptyDocs" var="emptyDocs" />

<c:set var="formBean" value="${tipoDocumentoVarianteAssociationFormBean}" />

<script type="text/javascript">	
	document.title = '${productName} - ${formBean.variante.titulo} - ${associarTiposDoc}';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.variante.titulo} - ${associarTiposDoc}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
		  </tr>
		</tbody>
	</table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.variante.titulo} - ${associarTiposDoc}</td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	<!-- ul>
		<li> Para <b>adicionar uma Tarefa</b> ao conjunto das tarefas Gerais de uma Etapa, indique o número de ordem na coluna respectiva (*). </li>
		<li> Para <b>adicionar uma Tarefa</b> ao conjunto das tarefas Específicas de uma Etapa, indique o número de ordem na coluna respectiva (*). </li>
		<li> Para <b>adicionar uma Tarefa Posterior</b> ao conjunto das tarefas Posteriores de uma Etapa, indique o número de ordem na coluna respectiva (*). </li>
		<li> Para <b>eliminar uma Tarefa</b> do conjunto , indique a ordenação 0 (zero). </li>
		<li>
		 Para <b>confirmar</b> as suas alterações, pressione o botão <fmt:message key="ipdms.forms.submit" />. </li>
	</ul>			
	<div style="margin-left:20px;">* a ordem deverá ser um inteiro maior que zero, ou zero para eliminar a Tarefa da Etapa.</div -->	
</div>

<div id="MensagemErro">
	<html:errors/>
</div>

<br />

<html:form action="/saveTipoDocumentoVarianteAssociation" method="post" styleClass="form">
	
	<html:hidden property="numero" value="${formBean.variante.processo.numeroConteudo}"/>
	<html:hidden property="tipoAccao" value="${formBean.tipoAssociacao}"/>
	
	<table cellpadding="0" cellspacing="0" class="centro" style="width:60%">
	  <tr>
	  	<th class="centro" style="width: 10%; text-align: center;">${associar}</th>
	  	<c:if test="${formBean.tipoAssociacao == 'I'}">
	  		<th class="centro" style="width: 15%; text-align: center;">${docFisico}</th>
	  	</c:if>	
	  	<th class="centro" style="width: 15%; text-align: center;">${obrigatorio}</th>
	  	<th class="centro" >${tipoDocAnexar}</th>
	  </tr>
	  <logic:present name="formBean" property="tipos">
		  <logic:iterate name="formBean" property="tipos" id="tipos" indexId="counter">
			  <nested:root name="tipos">
				  <tr>
				  	<td class="alignCenter"><nested:checkbox property="checked" indexed="true" style="border:0;" /></td>
				  	<c:if test="${formBean.tipoAssociacao == 'I'}">
				  		<td class="alignCenter"><nested:checkbox property="association.documentoFisico" indexed="true" style="border:0;" /></td>
				  	</c:if>			  	
				  	<td class="alignCenter"><nested:checkbox property="association.obrigatorio" indexed="true" style="border:0;" /></td>
				  	<td class="centro"><nested:write property="association.id.tipoDocumento.descricao" /></td>
				  </tr>
			  </nested:root>
		  </logic:iterate>
	  </logic:present>
	  <logic:notPresent name="formBean" property="tipos">
	  	  <br/>
		  <p class="centro">${emptyDocs}</p>
	  </logic:notPresent>
	</table>
	
	
	<br />
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
			onclick="this.form.action='${pageContext.request.contextPath}/editProcesso.do2?numero=${formBean.variante.processo.numeroConteudo}'; this.form.submit();">
		<c:if test="${not empty formBean.tipos}">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />">
		</c:if>
	</div>
</html:form>