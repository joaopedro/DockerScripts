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
<%-- ESTADO --%>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.estado'/>">
  		<fmt:message key="ipdms.modules.entidade.br.estado"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.estado'/>" id="estadoMoradaDiv">
		<select name="morada_estado" id="morada_estado" onchange="renderSelect('${entidade_locale}', 2);">
			<option value=""></option>			
			<c:forEach items="${estadoList}" var="option">
				<c:set var="selected" value="" />
				<c:if test="${option.value == morada_estado}">
					<c:set var="selected" value="selected=selected" />
				</c:if>
				<option value="${option.value}" ${selected}>${option.title}</option>
			</c:forEach>
		</select>			
  	</div>
<%-- Municipio --%>
  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.municipio'/>">
  		<fmt:message key="ipdms.modules.entidade.br.municipio"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.municipio'/>" id="municipioMoradaDiv">
		<select name="morada_municipio" id="morada_municipio" >
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

<%--Domicilio --%>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.endereco'/>">
  		<fmt:message key="ipdms.modules.entidade.br.endereco"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.endereco'/>">
		<input type="text" id="morada_endereco" name="morada_endereco" value="${morada_endereco}" size="50" maxlength="150"/>
  	</div>
	<%--numero --%>
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.numero'/>">
  		<fmt:message key="ipdms.modules.entidade.br.numero"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.numero'/>">
		<input type="text" id="morada_numero" name="morada_numero" value="${morada_numero}" size="50" maxlength="150"/>
  	</div>
</div>

<div class="row formlabel_sf" >

	<%--Complemento --%>
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.complemento'/>">
  		<fmt:message key="ipdms.modules.entidade.br.complemento"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.complemento'/>">
		<input type="text" id="morada_complemento" name="morada_complemento" value="${morada_complemento}" size="50" maxlength="150"/>
  	</div>

	<%--bairro --%>
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.bairro'/>">
  		<fmt:message key="ipdms.modules.entidade.br.bairro"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.bairro'/>">
		<input type="text" id="morada_bairro" name="morada_bairro" value="${morada_numero}" size="50" maxlength="150"/>
  	</div>
<%--CEP --%>
<div class="row formlabel_sf" >

<%--Cidade --%>
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.cidade'/>">
  		<fmt:message key="ipdms.modules.entidade.br.cidade"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.cidade'/>">
		<input type="text" id="morada_cidade" name="morada_cidade" value="${morada_cidade}" size="50" maxlength="150"/>
  	</div>

	<!-- cep -->
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.br.cep'/>">
  		<fmt:message key="ipdms.modules.entidade.br.cep"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.br.cep'/>">
		<input type="text" id="morada_cep" name="morada_cep" value="${morada_cep}" size="20" maxlength="150"/>
  	</div>
</div>

<div style="clear:both"></div>
<div class="buttonRow">
	<input class="btForm" type="button" title="<fmt:message key="ipdms.forms.gravar"/>" value="<fmt:message key="ipdms.forms.gravar"/>" onclick="saveMorada('${entidade_locale}');" />
	<input type="button" class="btFormEscuro" title="<fmt:message key="ipdms.forms.cancelar.title"/>" value="<fmt:message key="ipdms.forms.cancelar"/>" onclick="enableButtons(); Element.update('divNewMorada', '' );" />
</div>

</fieldset>