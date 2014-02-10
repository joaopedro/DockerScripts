<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.departamento.categoriasAssociadas" var="categoriasAssociadas" />
<fmt:message key="ipdms.departamento.semCategoriasAssociadas" var="semCategoriasAssociadas" />
<fmt:message key="ipdms.forms.pesquisar" var="pesquisar" />

<html:form action="/saveAreaFuncional" method="post" styleClass="form">
<html:hidden property="numero"/>

<table class="formtable" style="text-align:center;">
	<tr>
		<td class="formlabel"><fmt:message key="ipdms.departamento.nome" /> * </td>
		<td class="formfield"><html:text property="nome" size="40" maxlength="80"/></td>
	</tr>

	<tr>
		<td class="formlabel"><fmt:message key="ipdms.departamento.descricao" /></td>
		<td class="formfield"><html:text property="descricao" size="80" maxlength="2000"/></td>
	</tr>

	<tr>
		<td class="formlabel"><fmt:message key="ipdms.departamento.sigla" /></td>
		<td class="formfield"><html:text property="sigla" size="10" maxlength="20"/></td>
	</tr>

	<c:set var="collectionName" value="${areaFuncionalFormBean.categoriasAssociadas}" scope="request"></c:set>
	<c:set var="firstline" value="${categoriasAssociadas}" scope="request"></c:set>
	<c:set var="noinfo" value="${semCategoriasAssociadas}" scope="request"></c:set>
	<jsp:include page="moreInfoInTittle.jsp" />

	<logic:greaterThan name="areaFuncionalFormBean" property="numero" value="0">
	<tr>
		<td class="formlabel"><fmt:message key="ipdms.departamento.funcoes" /></td>
		<td colspan="2">
			<input type="button" value="<fmt:message key="ipdms.forms.select" />" class="btFormSecundario"
				onclick="setActionAndSubmit(this.form, 'listCategoriasForAssociation.do2');">
			<img alt="${more_info}" title="${more_info}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" alt="${pesquisar}" title="${pesquisar}" class="cursorMao" />	
		</td>
	</tr>
	</logic:greaterThan>

	<tr><td>&nbsp;</td></tr>
	
	<tr>
		<td style="text-align:center;" colspan="2">
			<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
				onclick="setActionAndSubmit(this.form, 'listAreaFuncional.do2');" />
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />" />			
		</td>
	</tr>
</table>
</html:form>