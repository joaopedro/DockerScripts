<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="webflow.anexos.docPrincipal" var="docPrincipal" />
<fmt:message key="webflow.anexos.titulo" var="titulo" />
<fmt:message key="webflow.anexos.ficheiro" var="ficheiro" />
<fmt:message key="webflow.anexos.seleccionarprincipal.vazio" var="seleccionarprincipal" />
<fmt:message key="webflow.anexos.docsAnexados" var="docsAnexados" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />

<c:if test="${empty _resumo}">
<html:form action="applicationFlow" method="post">

	<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"><br/>
	<div class="webflow_formdiv">
	<html:errors/>

	<logic:notEmpty name="webflowActionForm" property="mainDocument">
		<bean:define id="mainDocument" name="webflowActionForm" property="mainDocument" />
		<fieldset>
			<legend>${docPrincipal}</legend>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 13%; " title="${titulo}">${titulo}:</div>
			  	<div class="label" style="width: 84%;" title="${titulo}">${mainDocument.file.description}</div>
			</div>
			<div class="row formlabel_sf" >
				<div class="leftTab label" style="width: 13%; " title="${ficheiro}">${ficheiro}:</div>
			  	<div class="label" style="width: 84%;" title="${ficheiro}">
			  		<a href='/visualizeDocument.do2?id=${mainDocument.file.id}&tmpFile=${mainDocument.file.tmpFilename}' class="texto">
						<bean:write name="webflowActionForm" property="mainDocument.file.formFile.fileName"/>
					</a>
			  	</div>
			</div>
		</fieldset>
	</logic:notEmpty>



	<logic:empty name="webflowActionForm" property="mainDocument">
	
	<div class="row" style="margin-bottom:20px;">
	  <div class="leftTab label" style="width: 90%; " title="${seleccionarprincipal}">
	        <span class="formlabel_obrigatorio">${seleccionarprincipal}</span>
	    </div>
	</div>
	
		<table cellpadding="0" cellspacing="0" class="centro" style="width:50%;">
			<tr>
				<th class="centro">${docsAnexados}</th>
				<th class="centro" style="width:10%">Principal</th>
			</tr>
		<!-- Documentos Anexados -->
			<logic:notEmpty name="webflowActionForm" property="addedDocuments">
				<logic:iterate name="webflowActionForm" property="addedDocuments" id="addedDocuments">
					<nested:root name="addedDocuments">
						<tr>
							<td class="centro">${addedDocuments.file.description}</td>
							<td class="alignCenter"><label for="principal"><nested:checkbox property="mainFile" styleId="principal" styleClass="radion" indexed="true" style="border:0;"/></label></td>
						</tr>			
					</nested:root>
				</logic:iterate>
			</logic:notEmpty>
			
			<!-- Documentos Itens -->
				<logic:notEmpty name="webflowActionForm" property="itensWithFile">
					<logic:iterate name="webflowActionForm" property="itensWithFile" id="itensWithFile" >
						<c:if test="${not empty itensWithFile.file.formFile and !itensWithFile.file.toDelete}">
						<nested:root name="itensWithFile">
							<tr>
								<td class="centro">${itensWithFile.item.titulo}</td>
								<td class="alignCenter"><label for="seleccionarEliminar"><nested:checkbox property="mainFile" styleId="seleccionarEliminar" styleClass="radion" indexed="true" style="border:0;" /></label></td>
							</tr>			
						</nested:root>
						</c:if>
					</logic:iterate>
				</logic:notEmpty>
	
			</table>
		</logic:empty>
	<div style="margin-top:5%;">
		<html:submit property="_eventId_back" value="${anterior}" styleClass="btForm" title="${anteriorTitle}"/>
		<html:submit property="_eventId_next" value="${seguinte}" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="${seguinteTitle}"/>
	</div>

	</div>
</html:form>
</c:if>
