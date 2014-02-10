<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.soassociacao.data" var="data" />
<fmt:message key="ipdms.etapa.designacaosingular" var="etapaDes" />
<fmt:message key="ipdms.servicoonline.histProcesso.utilizador" var="utilizador" />
<fmt:message key="ipdms.etapa.atributosetapa.atributo" var="atributoDes" />
<fmt:message key="ipdms.recolha.respostadata.valor" var="valor" />
<fmt:message key="ipdms.etapa.atributosetapa.empty" var="emptyMsg" />

<jsp:include page="/ipdms/layout/ipdmsScriptsThemes.jsp" />

<logic:present name="atributos">
<logic:notEmpty name="atributos">
<br/>
<table width="100%" class="centro">
<tr><td>&nbsp;</td></tr>
<tr class="centro">
	<th class="centro">${data}</th>
	<th class="centro">${etapaDes}</th>
	<th class="centro">${utilizador}</th>
	<th class="centro">${atributoDes}</th>
	<th class="centro">${valor}</th>
</tr>
<logic:iterate name="atributos" id="atributo" indexId="indice">
<c:set var="trClass"><c:choose><c:when test="${indice % 2 == 0}">even</c:when><c:otherwise>odd</c:otherwise></c:choose></c:set>
<tr class="${trClass}">
	<td class="centro" nowrap="nowrap">
		<bean:write name="atributo" property="atributoEtapa.dataregisto" format="dd-MM-yyyy HH:mm"/>
	</td>
	<td class="centro" nowrap="nowrap">
		<bean:write name="atributo" property="etapa"/>
	</td>
	<td class="centro" nowrap="nowrap">
		<bean:write name="atributo" property="uname"/>
	</td>
	<td class="centro">
	 	<bean:write name="atributo" property="atributoEtapa.label"/>				 	
	</td>
	<td class="centro" nowrap="nowrap">
		<bean:write name="atributo" property="atributoEtapa.valor"/>
	</td>
	</tr>
</logic:iterate>
</table>
</logic:notEmpty>
<logic:empty name="atributos"> 

<table width="100%" class="centro">
	<tr><td class="formfield" style="text-align:center;">
		${emptyMsg}<br/>
	</td></tr>
</table>

</logic:empty>
</logic:present>

<logic:notPresent name="atributos">
	<logic:present name="erroatributos">
	<table width="100%" class="centro">
		<tr><td class="formfield" style="text-align:center;"><fmt:message key="${erroatributos}"/></td></tr>
	</table>
	</logic:present>
</logic:notPresent>


<script type="text/javascript">
	<logic:present name="errorMessageKey">
		alert('<fmt:message key="${errorMessageKey}" />');
	</logic:present>
</script>
