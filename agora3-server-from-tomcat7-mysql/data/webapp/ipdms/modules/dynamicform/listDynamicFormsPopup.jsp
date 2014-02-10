<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/formFunctions.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>

<body style="overflow: auto;">

	<c:set var="popupParams" value="${sessionScope['ipdms_dynamicform_popupparams'].params}" />

	<form action="listDynamicFormsPopup.do2" name="form" id="form" class="form">
		<input type="hidden" name="page" id="page" value="1" />
		
		<table width="100%" style="border:none" cellpadding="5" cellspacing="0">
			<tr style="text-align:left;">
				<td>
					<div class="row formlabel_sf">
						<div class="leftTab label" style="width: 20%; " title="<fmt:message key='ipdms.dynamicform.form.description' />">
					  		<label for="nome"><fmt:message key='ipdms.dynamicform.form.description' /></label>
					  	</div>
					  	
					  	<div class="label" style="width: 76%;" title="<fmt:message key='ipdms.dynamicform.form.description' />">
					  		<input type="text" name="descricao" id="descricao" value="${param.descricao}" size="50" maxlength="80"/>
					  	</div>
					</div>	
					
					<div class="buttonRow">
						<input type="submit" name="search" value="<fmt:message key='ipdms.forms.filtrar' />" class="btForm" title="<fmt:message key='ipdms.forms.filtrar.title' />"/>
					</div>
					
				</td>
			</tr>
		</table>
	</form>

<hr>
<c:set var="currentPage">
	<c:choose>
		<c:when test="${param.page !=null}">${param.page}</c:when>
		<c:otherwise>1</c:otherwise>
	</c:choose>
</c:set>

<c:set var="windowName" value="${sessionScope['ipdms_dynamicform_popupparams'].windowName}" />

<fmt:message key='ipdms.dynamicform.form.id' var='formId' />
<fmt:message key='ipdms.dynamicform.form.externalid' var='externalid' />
<fmt:message key='ipdms.dynamicform.form.description' var='formDescription' />
<fmt:message key='ipdms.dynamicform.form.creationdate' var='creationdate' />
<fmt:message key='ipdms.dynamicform.field.numberofcampos' var='numberofcampos' />

<display:table id="dinamicForms" name="${paginatedList}" htmlId="worklist">
	<display:column title="${formId}" property="id" />
	<display:column title="${externalid}" property="externalId" />
	<display:column title="${formDescription}">
		<a href="" onclick="affectParentValues('${dinamicForms.id}','${dinamicForms.description}'); parent.${windowName}.close();">
			${dinamicForms.description}
		</a>
	</display:column>
	<display:column title="${creationdate}">
		<fmt:formatDate value="${dinamicForms.creation.time}" pattern="dd-MM-yyyy HH:mm"/>
	</display:column>
	<display:column title="${numberofcampos}">
		${fn:length(dinamicForms.fields)}
	</display:column>
</display:table>



<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.fechar" />" onclick="parent.${windowName}.close();" title="<fmt:message key="ipdms.forms.fechar.title" />" />
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.reset"/>" onclick="affectParentValues('','');" title="<fmt:message key="ipdms.forms.reset.title"/>" />
</div>
</body>
<script>

	affectParentValues = function (dynamicFormId, dynamicFormDesc) {
		setInputValue(parent.document.getElementById('${popupParams.dynamicFormId}'), dynamicFormId);
		setInputValue(parent.document.getElementById('${popupParams.dynamicFormDesc}'), dynamicFormDesc);
		setInputValue(parent.document.getElementById('${popupParams.dynamicFormDescSpan}'), dynamicFormDesc);
	}
	
	setInputValue = function (inputElement, value) {
		if(inputElement) {
			if(inputElement.tagName == 'SPAN') {
				inputElement.innerHTML = value;
			} else {
				inputElement.value = value;
			}
		}
	}
</script>