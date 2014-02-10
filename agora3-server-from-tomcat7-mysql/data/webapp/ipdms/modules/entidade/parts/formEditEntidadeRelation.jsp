<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.entidade.designacaosingular" var="entidade" />
<fmt:message key="ipdms.forms.select" var="select" />

<fieldset>
<legend><fmt:message key="ipdms.modules.entidaderelation.edit" /></legend>
<input type="hidden" id="entidaderelation_index" name="entidaderelation_index" value="${entidaderelation_index}" />

<div class="row formlabel_sf" >
    <div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.modules.entidaderelations.role" />">
		<label for="roleId"><fmt:message key="ipdms.modules.entidaderelations.role" /> *</label>
    </div>
    
    <div class="label" style="width: 80%;" title="<fmt:message key="ipdms.modules.entidaderelations.role" />">
        <select name="roleId" id="roleId">
			<option value="0"><fmt:message key="ipdms.forms.select.default" /></option>			
			<c:forEach items="${roles}" var="role">
				<c:set var="selected" value="" />
				<c:if test="${role.id == relation.role}">
					<c:set var="selected" value="selected=selected" />
				</c:if>
				<option value="${role.id}" ${selected}>${role.descricao}</option>
			</c:forEach>
		</select>		
    </div>
</div>

<div class="row formlabel_sf" >
    <div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.modules.entidaderelations.entidadetorelate" />">
		<fmt:message key="ipdms.modules.entidaderelations.entidadetorelate" /> *
    </div>
    
    <div class="label" style="width: 80%;" title="<fmt:message key="ipdms.modules.entidaderelations.entidadetorelate" />">
        <input type="hidden" id="entidadeRelationId" name="entidadeRelationId" value="${relation.entidadeRelation}" />
			<IMG src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" 
				onclick="showEntidadesSimplePopup();" 
				class="cursorMao" alt="${select} ${entidade}" title="${select} ${entidade}"/>
			<input type="text" id="entidadeRelationDescription" name="entidadeRelationDescription" value="${relation.entidadeRelationName}" disabled="disabled" />
    </div>
</div>

<div class="buttonRow">
	<input type="button" class="btForm" title="<fmt:message key="ipdms.forms.gravar"/>" value="<fmt:message key="ipdms.forms.gravar"/>" 
		onclick="saveEntidadeRelation();" />
	<input type="button" class="btFormEscuro" title="<fmt:message key="ipdms.forms.cancelar.title"/>" value="<fmt:message key="ipdms.forms.cancelar"/>" 
		onclick="Element.update('divEditEntidadeRelation', '' ); enableButtons(); " />
</div>
</fieldset>