<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.dimensoes.titulo" var="titulo" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />

<script src='${pageContext.request.contextPath}/ipdms/js/swf-ajax.js' type="text/javascript"></script>

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />

<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>


<div class="row" style="padding-top:0; text-align:left;">
	<table border="0" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${titulo}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<div id="valoresDimensionaisErrorDiv">
	<html:errors />
</div>

<html:form action="/deleteValoresDimensionais" method="post" styleClass="form" enctype="multipart/form-data">
<nested:root name="${formBeanName}">
<!-- DIV DO FORMULÁRIO -->
		<div class="row formlabel_sf" >
			<div class="leftTab label textoBold" style="width: 17%; " title="<fmt:message key='ipdms.dimensoes.valor.descricao' />">
				<fmt:message key="ipdms.dimensoes.valor.descricao" />:
			</div>
				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dimensoes.valor.descricao' />">
					<nested:write property="descricaoDim"/>
			</div>
		</div>
		
		<div class="row formlabel_sf" >
			<div class="leftTab label textoBold" style="width: 17%; " title="<fmt:message key='ipdms.dimensoes.edit.designacao' />">
				<fmt:message key="ipdms.dimensoes.edit.designacao" />:
			</div>
				<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.dimensoes.edit.designacao' />">
					<nested:write property="designacaoDim"/>
			</div>
		</div>

	<div style="clear:both"></div><br />

	<div class="leftTab label" id="valoresdimensionais"><jsp:include page="listvaloresdimensionais.jsp" /></div>


<logic:notPresent name="valores">
	<logic:present name="errovalores">
	<table width="100%">
		<tr><td class="formfield" style="text-align:center;"><fmt:message key="${errovalores}"/></td></tr>
	</table>
	</logic:present>
</logic:notPresent>

	<br/>

	<div class="buttonRow">
		<input type="button" class="btForm" onclick="setActionAndSubmit(this.form, 'listDimensoes.do2');" value="${anterior}" id="anterior" title="${anteriorTitle}">
	</div>
	
</nested:root>
</html:form>