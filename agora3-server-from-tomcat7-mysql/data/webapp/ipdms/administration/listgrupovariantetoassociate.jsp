<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>

<c:set var="saveAction">
	<tiles:getAsString name="saveaction" />
</c:set>
<c:set var="backAction">
	<tiles:getAsString name="backaction" />
</c:set>

<c:set var="formBean" value="${associacaoFormBean}" />
<script type="text/javascript">	
	document.title = '${productName} - ${formBean.nomeConteudo} - <fmt:message key="ipdms.etapa.gruposvariantes" />';	 
</script>
<div id="ver_ajuda" class="row" style="padding-top: 0px; text-align:left;">
<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
		<tr>
			<td class="titulo1">${formBean.nomeConteudo} - <fmt:message key="ipdms.etapa.gruposvariantes" /></td>
			<td style="width:1.75em; vertical-align: top; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png"
				onclick="Javascript:verAjuda('s');" class="cursorMao" alt="<fmt:message key='ipdms.forms.ajuda' />"
				title="<fmt:message key='ipdms.forms.ajuda' />" /></td>
		</tr>
	</tbody>
</table>
</div>
<div id="ajuda" class="info" 
	style="padding-top: 0px; display: none; text-align:left;">
<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
		<tr>
			<td class="titulo1">${formBean.nomeConteudo} - <fmt:message key="ipdms.etapa.gruposvariantes" /></td>
			<td style="width:1.75em; vertical-align: top; text-align: center;"><img
				src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png"
				onclick="Javascript:verAjuda('n');" class="cursorMao"
				alt="<fmt:message key='ipdms.forms.ocultarAjuda' />" title="<fmt:message key='ipdms.forms.ocultarAjuda' />" /></td>
		</tr>
	</tbody>
</table>
<fmt:message key='ipdms.etapa.associarGruposVariantes.help' />
</div>

<div id="MensagemErro"><html:errors /></div>

<html:form action="/${saveAction}" method="post" styleClass="form">
<html:hidden property="numero" value="${formBean.id}"/>
		<table cellpadding="0" cellspacing="0" class="centro">
		<c:choose>
			<c:when test="${not empty associacaoFormBean.elementos}">
			<tr>
				<th width="5px" class="centro"><fmt:message key='ipdms.forms.select' /></th>
				<th width="1155px" class="centro"><fmt:message
				key="ipdms.variante.grupo.designacaoplural" /></th>
			</tr>
				<logic:iterate name="associacaoFormBean" property="elementos"
					id="elementos">
  					<nested:root name="elementos">
						<tr>
							<td class="formlabel" style="text-align:center"><nested:checkbox
								property="seleccionado" styleClass="radion" indexed="true" style="border:0;" /> <nested:hidden
								property="id" indexed="true" /></td>
							<td class="formfield"><nested:write property="titulo" /></td>
						</tr>
					</nested:root>
				</logic:iterate>

				<tr>
					<td>&nbsp;</td>
				</tr>
			</c:when>
			<c:otherwise>
			<div class="formfield"><fmt:message key="ipdms.etapa.emptyGruposVariantes"/></div>
			</c:otherwise>
		</c:choose>
	</table>
	<br />
	<div class="buttonRow"><input type="button" class="btForm"
		value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
		onclick="this.form.action='${pageContext.request.contextPath}/${backAction}.do2?numero=${numeroConteudoRetorno}'; this.form.submit();">
	<input type="submit" class="btForm"
		value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
	</div>
</html:form>
