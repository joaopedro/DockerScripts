<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%-- <logic:notPresent name="_resumo" scope="request">
	
	<html:form action="applicationFlow" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}"><br/>
		<div class="webflow_formdiv">
			<html:errors/><br/>		
	
			Lista de documentos gerados
			<logic:notEmpty name="webflowActionForm" property="docsGerados">
				DFDFDFDFDFDFD
				<div style="margin-top:10px;">
					<bean:define id="formUploadListItens" name="webflowActionForm" property="docsGerados" toScope="request" />
					<c:import url="/ipdms/webflow/uploadparts/anexosFileList.jsp">
						<c:param name="formUploadListProperty" value="docsGerados" />
						<c:param name="visualizeFileAction" value="file/getDocumentoInstrucao" />
						<c:param name="anexarColumnTitle"><fmt:message key="ipdms.accoes.anexar.documentosanexados" /></c:param>
						<c:param name="toDelete" value="true" />
					</c:import>
				</div>		
			</logic:notEmpty>
			<br />
	
			<div style="clear:both"><br /></div>
			<div class="buttonRow" style="margin-top:10px;">
				<html:submit property="_eventId_back" styleClass="btForm" title="Retroceder ao ecrã anterior"><fmt:message key='ipdms.forms.anterior' /></html:submit>
				<html:submit property="_eventId_next" styleClass="btForm" title="Avançar para o ecrã seguinte"><fmt:message key='ipdms.forms.seguinte' /></html:submit>
			</div>
		</div>
	</html:form>
	
</logic:notPresent> --%>

<%----------------------- RESUMO -----------------------%>
<logic:present name="_resumo" scope="request">
	
	<logic:notEmpty name="webflowActionForm" property="docsGerados">
		<table cellspacing="0" cellpadding="0" width="100%" class="centro">
			<tr>
				<th class="centro" style="width:20%"><fmt:message key="ipdms.instrucao.entidade" /></th>				
				<th class="centro" style="width:30%"><fmt:message key="ipdms.instrucao.documento" /></th>
				<th class="centro" style="width:50%">					
					<fmt:message key="ipdms.accoes.anexar.tipodocumento" />
				</th>
			</tr>
			<logic:iterate name="webflowActionForm" property="docsGerados" id="doc" indexId="counter">				
				<c:set var="documento" value="${doc.value}" />				
				<tr>
					<td class="centro">
						${doc.key.nome}
					</td>					
					<td class="centro">
						<a href="${pageContext.request.contextPath}/file/getDocumentoTemplateInstrucao.do2?nc=${documento.file.id}&tmpfile=${documento.file.tmpFilename}" target="_blank">
							${documento.file.description}							
						</a>						
					</td>
					<td class="centro" style=" border-right:none">--</td>
				</tr>
			</logic:iterate>
		</table>
	</logic:notEmpty>
	<logic:empty name="webflowActionForm" property="docsGerados">
		<div class="row formlabel_sf" style="height:13px;">
		  	<div class="leftTab label" style="width: 98%;" title="Ajax Combo">
		  		<fmt:message key="ipdms.instrucao.template.nenhumdocumentogerado" />
		  	</div>
		</div>
	</logic:empty>	
	<br/>

</logic:present>
