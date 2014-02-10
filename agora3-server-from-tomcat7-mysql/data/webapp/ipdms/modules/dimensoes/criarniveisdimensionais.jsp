<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fieldset style="margin:0px; width:97%">
	<legend><fmt:message key="ipdms.dimensoes.nivel.novo" /></legend>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.dimensoes.nivel.titulo' />">
			<label for="textonivel"><fmt:message key="ipdms.dimensoes.nivel.titulo" /> *</label>
		</div>

		<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dimensoes.nivel.titulo' />">
			<input type="text" id="textonivel" name="Nivel" style="width:97.6%" value="${nivel.designacao}"/>
		</div>
	</div>
	<div class="buttonRow">
		<input type="button" title="<fmt:message key="ipdms.forms.submit.title"/>" value="<fmt:message key="ipdms.forms.submit"/>" id="novonivelButton"  class="btForm"  onclick="criarNivel();" />		
		<input type="button" title="<fmt:message key="ipdms.forms.submit.title"/>" value="<fmt:message key="ipdms.forms.submit"/>" id="alterarnivelButton"  class="btForm"  onclick="alterarNivel(${index});" style="display:none;"/>
		<input type="button" title="<fmt:message key="ipdms.forms.eliminar"/>" value="<fmt:message key="ipdms.forms.eliminar"/>" id="eliminarnivelButton"  class="btForm"  onclick="eliminarNivel(${index});" style="display:none;"/>
		<input type="button" title="<fmt:message key="ipdms.forms.cancelar.title"/>" value="<fmt:message key="ipdms.forms.cancelar"/>" id="cancelarButton"  class="btFormEscuro"  onclick="cancelarEditarNivel();"/>
	</div>
</fieldset>

<script type="text/javascript">
	<logic:present name="errorMessageKey">
		alert('<bean:message key="${errorMessageKey}" />');
	</logic:present>
</script>