<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:message key='ipdms.forms.seguinte' var="seguinte"/>
<fmt:message key='ipdms.forms.seguinte.title' var="seguinteTitle"/>
<fmt:message key='ipdms.forms.cancelar' var="cancelar"/>
<fmt:message key='ipdms.forms.cancelar.title' var="cancelarTitle"/>

<bean:define id="reclamacao" name="gestaoReclamacoesFlowBean" property="reclamacao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/swf-ajax.js' type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/column-tree.css" />
<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/examples/ux/css/ColumnNodeUI.css" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ColumnNodeUI.js"></script>

<style type="text/css">
	.extended_form_field{
		border:1px solid black;
		padding:5px;
	}
</style>


<logic:notPresent name="_resumo" scope="request">
	<html:form	action="/applicationFlow" method="post" enctype="multipart/form-data">
		<input	type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}" />
		<br />				
		<html:errors />
		
		<div class="webflow_formdiv">
		
			<div class="row formlabel_sf" >
				<div class="label" style="width: 20%; " title="<fmt:message key='ipdms.so.gestaoReclamacoes.descricao'/>">
					<fmt:message key="ipdms.so.gestaoReclamacoes.descricao"/> *
				</div>

				<div class="label" style="width: 77%;" title="<fmt:message key='ipdms.so.gestaoReclamacoes.descricao'/>">
					<html:textarea property="reclamacao.descricao" rows="2" cols="20" styleId="descricao" style="width:80%"/>
				</div>
			</div>
	
		<br /><br />
		
		<div class="buttonRow">
							
			<html:submit	property="_eventId_next" title="${seguinteTitle}"
							value="${seguinte}" 
							styleClass="btForm" />
							
			<html:submit	property="_eventId_cancel" title="${cancelarTitle}"
							value="${cancelar}" 
							styleClass="btFormEscuro"
							onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${referer}'); else return false;" />
		</div>
		
	</div>
		
	</html:form>
</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoReclamacoes.departamento'/>">
  		<fmt:message key="ipdms.so.gestaoReclamacoes.departamento"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoReclamacoes.departamento'/>">
		${reclamacao.reclamante.organicaPrincipal.designacao}
	</div>
</div>

<div class="row formlabel_sf">
  	<div class="leftTab label" style="width: 18%; height:13px;" title="<fmt:message key='ipdms.so.gestaoReclamacoes.descricao'/>">
  		<fmt:message key="ipdms.so.gestaoReclamacoes.descricao"/>:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%;" title="<fmt:message key='ipdms.so.gestaoReclamacoes.descricao'/>">
		${reclamacao.descricao}
	</div>
</div>

<br />&nbsp;
<br />&nbsp;
<br />&nbsp;

</logic:present>

