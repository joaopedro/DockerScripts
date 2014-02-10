<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="validationTitle"><fmt:message key="ipdms.dynamicform.resumo.validationinfo" /></c:set>
<tr id="${field.siglaId}_val_open">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('${field.siglaId}_val');">
			<img src="images/icon/seta_seccao_fecha.png" alt="${validationTitle}" title="${validationTitle}"/>
		</a>
	</td>
	<td class="titulo2">
		<a href="#" onclick="toggleInfo('${field.siglaId}_val');" class="formfield">
			${validationTitle}
		</a>
	</td>
</tr>
<tr id="${field.siglaId}_val_close" style="display: none;">
	<td class="titulo2" style="width:3%;">
		<a href="#" onclick="toggleInfo('${field.siglaId}_val');">
			<img src="images/icon/seta_seccao_abre.png" alt="${validationTitle}" title="${validationTitle}"/>
		</a>
	</td>
	<td class="titulo2">
		<a href="#" onclick="toggleInfo('${field.siglaId}_val');" class="formfield">
			${validationTitle}
		</a>
	</td>
</tr>