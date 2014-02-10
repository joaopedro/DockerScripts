<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.funcao.listcategoriasforassociation.associar" var="associar" />
<fmt:message key="ipdms.funcao.listcategoriasforassociation.help" var="help" />
<fmt:message key="ipdms.funcao.listcategoriasforassociation.empty" var="emptyMsg" />

<c:set var="formBean" value="${associacaoFormBean}" />
<script type="text/javascript">	
	document.title = '${productName} - ${formBean.nomeConteudo} - ${associar} <fmt:message key="ipdms.funcao.designacaoplural" />';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
   <table style="border:none" cellpadding="0" cellspacing="0" class="headings">
	<tbody>
	  <tr>
	    <td class="titulo1">${formBean.nomeConteudo} - ${associar} <fmt:message key="ipdms.funcao.designacaoplural" /></td>
	    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" /></td>
	  </tr>
	</tbody>
   </table>					
</div>
<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${formBean.nomeConteudo} - ${associar} <fmt:message key="ipdms.funcao.designacaoplural" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;"><img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" /></td>
		  </tr>
		</tbody>
	</table>	
	${help}			
</div>


<div id="MensagemErro">
	<html:errors/>
</div>


<br />

<html:form action="/saveAssociationToCategorias" method="post" styleClass="form">
<html:hidden property="numero" value="${formBean.numeroConteudo}"/>

<table class="formtable" style="text-align:center;">

  <c:choose>
	<c:when test="${not empty associacaoFormBean.elementos}">
	  <tr class="listHeader">
	  	<th class="formlabel">&nbsp;</th>
	  	<th class="formlabel"><fmt:message key="ipdms.funcao.designacaosingular" /></th>
	  </tr>
	
	  <logic:iterate name="associacaoFormBean" property="elementos" id="elementos">
	  <nested:root name="elementos">
	  <tr>
	  	<td class="formlabel">
	  		<nested:checkbox property="seleccionado" styleClass="radion" indexed="true" style="border:0;"/>
	  		<nested:hidden property="numeroConteudo" indexed="true"/>
	  	</td>
		<td class="formfield">
			<nested:write property="titulo" />
		</td>
	  </tr>
	  </nested:root>
	  </logic:iterate>
	</c:when>
	<c:otherwise>
		<tr class="formfield">
			<td colspan="2">${emptyMsg}</td>
		</tr>
	</c:otherwise>
  </c:choose>
  <tr><td>&nbsp;</td></tr>

  <tr>
	<td style="text-align:center;" colspan="2">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
			onclick="setActionAndSubmit(this.form, 'editAreaFuncional.do2');">
		<c:if test="${not empty associacaoFormBean.elementos}">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />">
		</c:if>
	</td>
  </tr>

</table>

</html:form>
