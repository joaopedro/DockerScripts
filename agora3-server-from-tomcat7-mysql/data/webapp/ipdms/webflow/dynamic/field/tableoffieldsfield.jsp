<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="html" uri="/tags/html"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.forms.seguinte" var="seguinte" />
<fmt:message key="ipdms.forms.seguinte.title" var="seguinteTitle" />
<fmt:message key="ipdms.forms.cancelar" var="cancelar" />
<fmt:message key="ipdms.forms.cancelar.title" var="cancelarTitle" />
<fmt:message key="ipdms.forms.novalinha" var="novaLinha" />
<fmt:message key="ipdms.forms.novalinha.title" var="novaLinhaTitle" />
<fmt:message key="ipdms.forms.mostraresconderlinha" var="mostraEscondeLinha" />
<fmt:message key="ipdms.forms.mostraresconderlinha.title" var="mostraEscondeLinhaTitle" />
<fmt:message key="ipdms.so.gestaoAusencias.pedidos" var="pedidos" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<script type="text/javascript" defer="defer">
	
	
	newTableRow=function(event,id,idTable){
		
		addTableRow(idTable);
		var nrRowsInput=jQuery("input[name='" + id +"']");
		var valNrRows=Number(nrRowsInput.val());

		nrRowsInput.val(Number(valNrRows)+1);
	}
	
	
	showHideTableRows=function(id){
		
		jQuery('#'+id+' tr[id=tableRow]').toggle();
		
	}
	
	</script>
<c:choose>
<%-- RESUMO: see dynamicform.jsp --%>
<c:when test="${inputDisabled || resumo}">
	
	<c:set var="tableIsVisible" value="false" />
				
	<c:forEach var="subField" items="${field.fields}">
		<c:if test="${subField.visible}">
			<c:set var="tableIsVisible" value="true" />				
		</c:if>
	</c:forEach>
	
	<c:if test="${tableIsVisible}">
	
		<div class="row formlabel_sf" >
		<c:set  var="dfieldId" value="${field.siglaId}" scope="request" />
		<c:choose>
			<c:when test="${not empty customTableSize[field.siglaId]}">
				<c:set var="trueRowSize" value="${customTableSize[field.siglaId]}" />
			</c:when>
			<c:otherwise>
				<c:set var="trueRowSize" value="${field.numberOfRows}" />
			</c:otherwise>
		</c:choose>

		<table id="${dfieldId}" title="${field.title}" class="centro" cellspacing="1">
			<tr class="listHeader">
			<c:forEach var="subField" items="${field.fields}">
				<td class="centro">${subField.label}<c:if test="${subField.required}">*</c:if></td>
			</c:forEach>
			</tr>
						
			<!-- Store original values -->
			<c:set var="tableField" value="${field}" />
			<c:set var="tableFieldId" value="${dfieldId}" />

			<c:forEach begin="0" end="${trueRowSize-1}" step="1" varStatus="i">
				
				<c:choose>
					<c:when test="${i.index > tableField.numberOfRows-1}">
   						<tr id="tableRow" hidden="hidden">
					</c:when>
					<c:otherwise>
						<tr>
					</c:otherwise>
				</c:choose>		 
				<c:forEach var="subField" items="${tableField.fields}">
				<c:set var="field" value="${subField}" scope="request" />
				<c:set var="dfieldId" value="${tableFieldId}.${field.siglaId}[${i.index}]" scope="request" />

				<!-- Obtencao do field instance correcto -->
				<c:set var="tableFieldInstance" value="${fieldInstance}" scope="request"/>
				<c:set var="fieldInstance" value="" scope="request"/>
				<c:forEach var="idxInstanceField" items="${tableFieldInstance.fields}">
					<c:if test="${i.index == idxInstanceField.index && field.siglaId == idxInstanceField.fieldTemplate.siglaId}">
						<c:set var="fieldInstance" value="${idxInstanceField}" scope="request" />					
					</c:if>
				</c:forEach>
				<!-- Field Instance Obtido -->
				
				<td class="centro">
				<c:choose>
					<c:when test="${field.type == 'STRING'}"><jsp:include page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'INTEGER'}"><jsp:include page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'DATE'}"><jsp:include page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'COMBOBOX'}"><jsp:include page="parts/optionvaluesvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'NIVELDIMENSIONAL'}"><jsp:include page="parts/niveldimensionalvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'MORADA'}"><jsp:include page="parts/moradavaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'DIMENSAO'}"><jsp:include page="parts/dimensaovaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'ENTIDADE'}"><jsp:include page="parts/entidadevaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'EXTERNALOPTION'}"><jsp:include page="parts/externaloptionvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'ORGANICA'}"><jsp:include page="parts/organicavaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'COLABORADOR'}"><jsp:include page="parts/colaboradorvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'BOOLEAN'}"><jsp:include page="parts/booleanvaluepart.jsp" /></c:when>	
				</c:choose>	
				</td>
				<c:set var="fieldInstance" value="${tableFieldInstance}" scope="request" />
								
				</c:forEach>
				</tr>
             </c:forEach>
             
             <!-- Restore original values -->
             <c:set var="field" value="${tableField}" scope="request" />
             <c:set var="dfieldId" value="${tableFieldId}" scope="request" />
		</table>
		<c:if test="${tableField.numberOfRows < trueRowSize}">
			<html:button property="showTableLines" styleClass="btForm" style="float: right;" value="${mostraEscondeLinha}" onclick="showHideTableRows('${field.siglaId}');" title="${mostraEscondeLinhaTitle}"/>
		</c:if>
	</div>
	
	
	</c:if>
	
	
	
	
	
</c:when>

<%-- Normal Form --%>
<c:otherwise>
	<c:set var="dfieldId" value="${field.siglaId}" scope="request" />
	<c:choose>
	<c:when test="${not empty customTableSize[field.siglaId]}">
   		<c:set var="rowNbr" value="${customTableSize[field.siglaId]}"/>
	</c:when>
	<c:otherwise>
		<c:set var="rowNbr" value="${field.numberOfRows}"/>
	</c:otherwise>
	</c:choose>

	<input type="hidden" class="tableRows" name="${field.siglaId}-numRows" value="${rowNbr}"/>
	<div id="div_${dfieldId}" class="row formlabel_sf">
		<table title="${field.title}" id="${dfieldId}" class="centro" cellspacing="1">
			<tr class="listHeader">
			<c:forEach var="subField" items="${field.fields}">
				<td class="centro">${subField.label}<c:if test="${subField.required}">*</c:if></td>
			</c:forEach>
			</tr>
						
			<!-- Store original values -->
			<c:set var="tableField" value="${field}" />
			<c:set var="tableFieldId" value="${dfieldId}" />
			
			<c:forEach begin="0" end="${rowNbr-1}" step="1" varStatus="i">
				<tr class="hoverTransparente">
				<c:forEach var="subField" items="${tableField.fields}">
				<c:set var="field" value="${subField}" scope="request" />
				<c:set var="dfieldId" value="${tableFieldId}[${i.index}].${field.siglaId}" scope="request" />

				<!-- Obtencao do field instance correcto -->
				<c:set var="tableFieldInstance" value="${fieldInstance}" scope="request"/>
				<c:set var="fieldInstance" value="" scope="request"/>
				<c:forEach var="idxInstanceField" items="${tableFieldInstance.fields}">
					<c:if test="${i.index == idxInstanceField.index && field.siglaId == idxInstanceField.fieldTemplate.siglaId}">
						<c:set var="fieldInstance" value="${idxInstanceField}" scope="request" />					
					</c:if>
				</c:forEach>
				<!-- Field Instance Obtido -->
				
				<td class="centro">
				<c:choose>
					<c:when test="${subField.type == 'STRING'}"><jsp:include page="parts/stringinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'INTEGER'}"><jsp:include page="parts/intinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'DATE'}"><jsp:include page="parts/dateinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'COMBOBOX'}"><jsp:include page="parts/comboboxinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'NIVELDIMENSIONAL'}"><jsp:include page="parts/niveldimensionalinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'MORADA'}"><jsp:include page="parts/moradainputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'DIMENSAO'}"><jsp:include page="parts/dimensaoinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'ENTIDADE'}"><jsp:include page="parts/entidadeinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'EXTERNALOPTION'}"><jsp:include page="parts/externaloptioninputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'BOOLEAN'}"><jsp:include page="parts/booleaninputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'COLABORADOR'}"><jsp:include page="parts/colaboradorinputpart.jsp" /></c:when>
					<c:when test="${subField.type == 'ORGANICA'}"><jsp:include page="parts/organicainputpart.jsp" /></c:when>
					
				</c:choose>	
				</td>
				<c:set var="fieldInstance" value="${tableFieldInstance}" scope="request" />
								
				</c:forEach>
				</tr>
             </c:forEach>
             <!-- Restore original values -->
             <c:set var="field" value="${tableField}" scope="request" />
             <c:set var="dfieldId" value="${tableFieldId}" scope="request" />
             <!--method addTableRow on dynamicFormFunctions.js-->
             <tfoot></tfoot>   
		</table>
         <html:button property="_eventId_newTableLine" styleClass="btForm" style="float: right;" value="${novaLinha}" onclick="newTableRow(event,'${field.siglaId}-numRows','${dfieldId}');" title="${novaLinhaTitle}"/>
				 
	</div>
	
	<jsp:include page="parts/scriptpart.jsp"></jsp:include>
</c:otherwise>
</c:choose>