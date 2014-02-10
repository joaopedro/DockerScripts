<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<fieldset style="margin-left:10px; width:95%;">
<legend><fmt:message key="ipdms.modules.entidade.moradaedit" /></legend>

<div id="errorDivMoradaEs">
	<html:errors />
</div>

<input type="hidden" id="morada_index" name="morada_index" value="${morada_index}" />

<div class="row" style="padding-bottom:3%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.pais' />">
  		<fmt:message key="ipdms.modules.entidade.pais" /> *
  	</div>
  	
  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.pais' />">
  		<input type="text" id="moradaes_pais" name="moradaes_pais" value="${moradaes_pais}" size="60" maxlength="100"/>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.morada' />">
  		<fmt:message key="ipdms.modules.entidade.morada" /> *
  	</div>
  	
  	<div class="label" style="width: 87%;" title="<fmt:message key='ipdms.modules.entidade.morada' />">
  		<input type="text" id="moradaes_morada" name="moradaes_morada" value="${moradaes_morada}" size="80" maxlength="80"/>
  	</div>
</div>

<div class="buttonRow">
	<input type="button" class="btForm" title="<fmt:message key="ipdms.forms.gravar"/>" value="<fmt:message key="ipdms.forms.gravar"/>" onclick="saveMoradaEs();" />
	<input type="button" class="btFormEscuro" title="<fmt:message key="ipdms.forms.cancelar.title"/>" value="<fmt:message key="ipdms.forms.cancelar"/>" onclick="enableButtons(); Element.update('divEditMoradaEs', '' );" />
</div>


</fieldset>
