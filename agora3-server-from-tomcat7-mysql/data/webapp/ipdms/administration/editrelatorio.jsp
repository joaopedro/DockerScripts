<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-nested" prefix="nested" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:form action="/saveRelatorio" method="post" styleClass="form" enctype="multipart/form-data">
<html:hidden property="relatorio.id"/>

<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.relatorio.titulo" />">
  		<label for="titulo"><fmt:message key="ipdms.relatorio.titulo" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.relatorio.titulo" />">
  		<html:text property="relatorio.titulo" style="width: 51%;" size="40" maxlength="80" styleId="titulo"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.relatorio.descricao" />">
  		<label for="descricao"><fmt:message key="ipdms.relatorio.descricao" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.relatorio.descricao" />">
  		<html:text property="relatorio.descricao" style="width: 51%;" size="80" maxlength="2000" styleId="descricao"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.relatorio.ficheiroBIRT" />">
  		<fmt:message key="ipdms.relatorio.ficheiroBIRT" /> *
  	</div>
  	<c:set var="fileForUpload" value="${relatorioFormBean.ficheiroBIRT}" scope="request" />
  	<c:import url="/ipdms/commons/fileupload/replaceablefile.jsp">  		
  		<c:param name="formUploadProperty" value="ficheiroBIRT" />
  		<c:param name="withDescription" value="true" />
  		<c:param name="visualizeFileAction" value="file/getRelatorio" />
  	</c:import>  	
</div>
<br />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key="ipdms.forms.anterior.title"/>"
		onclick="setActionAndSubmit(this.form, 'listRelatorio.do2');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key="ipdms.forms.submit.title"/>">
</div>

</html:form>