<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.templateinstrucao.associar" var="associar" />
<fmt:message key="ipdms.forms.ajuda" var="ajuda" />
<fmt:message key="ipdms.forms.ocultarAjuda" var="ocultarAjuda" />
<fmt:message key="ipdms.templateinstrucao.help" var="help" />

<%-- get save and back action from tiles-definition --%>
<c:set var="saveAction"><tiles:getAsString name="saveaction" /></c:set>
<c:set var="backAction"><tiles:getAsString name="backaction" /></c:set>

<script type="text/javascript">	
	document.title = '${productName} - associar <fmt:message key="ipdms.templateinstrucao.designacaosingular" />';	 
</script>

<div id="ver_ajuda" class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${associar} <fmt:message key="ipdms.templateinstrucao.designacaosingular" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;">
		    	<img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('s');" class="cursorMao" alt="${ajuda}" title="${ajuda}" />
		    </td>
		    </tr>
		</tbody>
	</table>					
</div>

<div id="ajuda" class="info" style="padding-top:0px; display: none; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${associar} <fmt:message key="ipdms.templateinstrucao.designacaoplural" /></td>
		    <td style="width:1.75em; vertical-align:top; text-align:center;">
		    	<img src="${pageContext.request.contextPath}/images/icon/icon-ajuda.png" onclick="Javascript:verAjuda('n');" class="cursorMao" alt="${ocultarAjuda}" title="${ocultarAjuda}" />
		    </td>		   
		  </tr>
		</tbody>
	</table>	
	${help}			
</div>


<div id="MensagemErro">
	<html:errors/>
</div>



<c:set var="formBean" value="${templateinstrucaoFormBean}" />
<html:form action="/${saveAction}" method="post" styleClass="form" enctype="multipart/form-data">
	
	<html:hidden property="variante" value="${variante}" />
	<html:hidden property="numeroConteudoRetorno" value="${numeroConteudoRetorno}" />
	
	<div class="row" style="padding-bottom:20px;">
		<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
	  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
	  	</div>
	</div>
			
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.templateinstrucao.ficheiro'  />">
	  		<fmt:message key="ipdms.templateinstrucao.ficheiro"  /> *
	  	</div>
	  	<c:set var="fileForUpload" value="${formBean.templateFile}" scope="request" />
	  	<c:import url="/ipdms/commons/fileupload/replaceablefile.jsp">  		
	  		<c:param name="formUploadProperty" value="templateFile" />
	  		<c:param name="visualizeFileAction" value="file/getTemplateInstrucao" />
	  	</c:import>  	
	</div>
	<br />
	
	
	<div class="buttonRow">
		    	
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
			onclick="this.form.action='${pageContext.request.contextPath}/${backAction}.do2?numero=${numeroConteudoRetorno}'; this.form.submit();"> 
		<c:if test="${!IPDMSInteropReceiver}">
			<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key='ipdms.forms.submit.title' />">
		</c:if>
	</div>

</html:form>

