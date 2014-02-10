<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" />

<c:set var="entidade_locale" value="${sessionScope['ipdms.entidade.locale']}" scope="request" />

<fieldset style="margin-left:10px; width:95%;">
<legend><fmt:message key="ipdms.modules.entidade.moradaedit" /></legend>

<div id="errorDivMorada">
	<html:errors />
</div>

<input type="hidden" id="morada_index" name="morada_index" value="${morada_index}" />
<div class="row" style="margin-bottom:20px; margin-left:-10px;">
	  <div class="leftTab label" style="width: 90%; " title="${obrigatorio}">
	        <span class="formlabel_obrigatorio">${obrigatorio}</span>
	  </div>
	</div>
<%-- Provincia --%>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.provincia'/>">
  		<fmt:message key="ipdms.modules.entidade.provincia"/>
  	</div>
  	
  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.provincia'/>" id="provinciaMoradaDiv">
		<select name="morada_provincia" id="morada_provincia" onchange="renderSelect('${entidade_locale}', 2);">
			<option value=""></option>			
			<c:forEach items="${provinciaList}" var="option">
				<c:set var="selected" value="" />
				<c:if test="${option.value == morada_provincia}">
					<c:set var="selected" value="selected=selected" />
				</c:if>
				<option value="${option.value}" ${selected}>${option.title}</option>
			</c:forEach>
		</select>			
  	</div>
<%-- Municipio --%>
  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.municipio'/>">
  		<fmt:message key="ipdms.modules.entidade.municipio"/>
  	</div>
  	
  	<div class="label" style="width: 50%;" title="<fmt:message key='ipdms.modules.entidade.municipio'/>" id="municipioMoradaDiv">
		<select name="morada_municipio" id="morada_municipio" onchange="renderSelect('${entidade_locale}', 3);">
			<option value=""></option>			
			<c:forEach items="${municipioList}" var="option">
				<c:set var="selected" value="" />
				<c:if test="${option.value == morada_municipio}">
					<c:set var="selected" value="selected=selected" />
				</c:if>
				<option value="${option.value}" ${selected}>${option.title}</option>
			</c:forEach>
		</select>			
  	</div>
</div>

<%--Comuna --%>
<div class="row formlabel_sf" style="height:25px;" >
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.comuna'/>">
  		<fmt:message key="ipdms.modules.entidade.comuna"/>
  	</div>
  	
  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.comuna'/>" id="comunaMoradaDiv">
			<select name="morada_comuna" id="morada_comuna" onchange="renderSelect('${entidade_locale}', 4);">
				<option value=""></option>			
				<c:forEach items="${comunaList}" var="option">
					<c:set var="selected" value="" />
					<c:if test="${option.value == morada_comuna}">
						<c:set var="selected" value="selected=selected" />
					</c:if>
					<option value="${option.value}" ${selected}>${option.title}</option>
				</c:forEach>
			</select>
   	</div>
<%-- Localidade --%>
  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
  		<fmt:message key="ipdms.modules.entidade.localidade"/>
  	</div>
  	
  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>" id="localidadeMoradaDiv">
			<select name="morada_localidade" id="morada_localidade" onchange="renderSelect('${entidade_locale}', 5);">
				<option value=""></option>			
				<c:forEach items="${localidadeList}" var="option">
					<c:set var="selected" value="" />
					<c:if test="${option.value == morada_localidade}">
						<c:set var="selected" value="selected=selected" />
					</c:if>
					<option value="${option.value}" ${selected}>${option.title}</option>
				</c:forEach>
			</select>
   	</div>
  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>" id="outraLocalidadeDiv">
		<script type="text/javascript">toggleOutraLocalidade();</script>
		<input type="text" id="outraLocalidade" name="outraLocalidade" value="${outraLocalidade}" size="30" maxlength="50"/>
	</div>
   	
</div>

<%--Domicilio --%>
<div class="row formlabel_sf" style="height:25px;" >
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.domicilio'/>">
  		<fmt:message key="ipdms.modules.entidade.domicilio"/>
  	</div>
  	
  	<div class="label" style="width: 25%;" title="<fmt:message key='ipdms.modules.entidade.domicilio'/>">
		<input type="text" id="morada_domicilio" name="morada_domicilio" value="${morada_domicilio}" size="50" maxlength="150"/>
  	</div>
</div>
<div style="clear:both"></div>
<div class="buttonRow">
	<input class="btForm" type="button" title="<fmt:message key="ipdms.forms.gravar"/>" value="<fmt:message key="ipdms.forms.gravar"/>" onclick="saveMorada('${entidade_locale}');" />
	<input type="button" class="btFormEscuro" title="<fmt:message key="ipdms.forms.cancelar.title"/>" value="<fmt:message key="ipdms.forms.cancelar"/>" onclick="enableButtons(); Element.update('divNewMorada', '' );" />
</div>

</fieldset>