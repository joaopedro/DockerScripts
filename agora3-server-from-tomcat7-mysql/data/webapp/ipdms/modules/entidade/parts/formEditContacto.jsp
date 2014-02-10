<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fieldset>
<legend><fmt:message key="ipdms.modules.entidade.contactoedit" /></legend>

<div class="mensagenErro1" id="errorDivContacto${tabEs}${morada_index}">
	<html:errors />
</div>
<input type="hidden" id="morada_index" name="morada_index" value="${morada_index}" />
<input type="hidden" id="contacto_index" name="contacto_index" value="${contacto_index}" />
<div class="row formlabel_sf">

	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.modules.entidade.nome' />" >
  		<fmt:message key="ipdms.modules.entidade.nome" /> *
  	</div>

 	<div class="label" style="width:80%;" title="<fmt:message key='ipdms.modules.entidade.nome' />" >
  		<input type="text" id="contacto_nome" name="contacto_nome" value="${contacto_nome}" size="60" maxlength="100"/>
  	</div>
  	
</div>

<div class="row formlabel_sf">

	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.modules.entidade.funcao' />" >
  		<fmt:message key="ipdms.modules.entidade.funcao" /> *
  	</div>

 	<div class="label" style="width:80%;" title="<fmt:message key='ipdms.modules.entidade.funcao' />" >
  		<input type="text" id="contacto_funcao" name="contacto_funcao" value="${contacto_funcao}" size="30" maxlength="80"/>
  	</div>
  	
</div>

<div class="row formlabel_sf">

	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.modules.entidade.email' />" >
  		<fmt:message key="ipdms.modules.entidade.email" />
  	</div>

 	<div class="label" style="width:80%;" title="<fmt:message key='ipdms.modules.entidade.email' />">
  		<input type="text" id="contacto_email" name="contacto_email" value="${contacto_email}" size="50" maxlength="80"/>
  	</div>
  	
</div>

<table>
<tr class="hoverTransparente">
		<td colspan="2">
			<table>
				<tr class="hoverTransparente">
					<td colspan="2">&nbsp;</td>
					<td title="<fmt:message key='ipdms.modules.entidade.predefinido' />"><fmt:message key="ipdms.modules.entidade.predefinido" /></td>
				</tr>
				<tr class="hoverTransparente" title="<fmt:message key='ipdms.modules.entidade.telefonecasa' />">
					<td><fmt:message key="ipdms.modules.entidade.telefonecasa" /></td>
					<td>
						<input type="text" id="contacto_telcasa" name="contacto_telcasa" value="${contacto_telcasa}" size="20" maxlength="20" onkeypress="return IsNumericKey(event);" />
					</td>
					<td>
						<c:set var="checked" value="" />
						<c:if test="${contacto_principal == 1}"><c:set var="checked" value="checked=checked" /></c:if>
						<input type="radio" style="radion" name="contacto_principal" id="contacto_principal" value="1" ${checked} style="border:none" />
					</td>
				</tr>				
				<tr class="hoverTransparente" title="<fmt:message key='ipdms.modules.entidade.telefonetrabalho' />">
					<td><fmt:message key="ipdms.modules.entidade.telefonetrabalho" /></td>
					<td>
						<input type="text" id="contacto_teltrabalho" name="contacto_teltrabalho" value="${contacto_teltrabalho}" size="20" maxlength="20" onkeypress="return IsNumericKey(event);" />
					</td>
					<td>
						<c:set var="checked" value="" />
						<c:if test="${contacto_principal == 2}"><c:set var="checked" value="checked=checked" /></c:if>
						<input type="radio" style="radion" name="contacto_principal" id="contacto_principal" value="2" ${checked} style="border:none" />
					</td>
				</tr>
				<tr class="hoverTransparente" title="<fmt:message key='ipdms.modules.entidade.telemovel' />">
					<td><fmt:message key="ipdms.modules.entidade.telemovel" /></td>
					<td>
						<input type="text" id="contacto_telemovel" name="contacto_telemovel" value="${contacto_telemovel}" size="20" maxlength="20" onkeypress="return IsNumericKey(event);" />
					</td>
					<td>
						<c:set var="checked" value="" />
						<c:if test="${contacto_principal == 3}"><c:set var="checked" value="checked=checked" /></c:if>						
						<input type="radio" style="radion" name="contacto_principal" id="contacto_principal" value="3" ${checked} style="border:none; text-align:center;" />	
					</td>
				</tr>
				<tr class="hoverTransparente" title="<fmt:message key='ipdms.modules.entidade.fax' />">
					<td><fmt:message key="ipdms.modules.entidade.fax" /></td>
					<td colspan="2">
						<input type="text" id="contacto_fax" name="contacto_fax" value="${contacto_fax}" size="20" maxlength="20" onkeypress="return IsNumericKey(event);" />					
					</td>
				</tr>				
			</table>
		</td>
	</tr>
</table>
<div class="buttonRow">
		<input type="button" class="btForm" style="border:none;" title="<fmt:message key='ipdms.forms.gravar'/>" value="<fmt:message key="ipdms.forms.gravar"/>" onclick="saveContacto${tabEs}('${morada_index}');" />
  		<input type="button" class="btFormEscuro" style="border:none;" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key="ipdms.forms.cancelar"/>" onclick="Element.update('editContacto${tabEs}${morada_index}', '' ); enableButtons(); " />
</div>
</fieldset>
