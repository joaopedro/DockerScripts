<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html:form action="/saveModulo" method="post" enctype="multipart/form-data" styleClass="form">
<html:hidden property="modulo.id"/>

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.nome' />">
  		<label for="tituloLabel"><fmt:message key="ipdms.modulo.nome" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modulo.nome' />">
  		<html:text property="modulo.titulo" maxlength="80" size="40" styleId="tituloLabel"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.qname' />">
  		<label for="qnameLabel"><fmt:message key="ipdms.modulo.qname" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modulo.qname' />">
  		<html:text property="modulo.qname" maxlength="80" size="40" styleId="qnameLabel"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.link'/>">
  		<label for="linkLabel"><fmt:message key="ipdms.modulo.link"/> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modulo.link'/>">
  		<html:text property="modulo.link" maxlength="150" size="40" styleId="linkLabel"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.pesquisa'/>">
  		<label for="checkboxPesquisa"><fmt:message key="ipdms.modulo.pesquisa"/></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modulo.pesquisa'/>">
  		<html:checkbox property="modulo.pesquisa" styleClass="radion" styleId="checkboxPesquisa" style="border:0;" />
  	</div>
</div>
<div class="row formlabel_sf" id="rowAgrupamento" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.agrupamento'/>">
  		<label for="agrupamentoLabel"><fmt:message key="ipdms.modulo.agrupamento"/> **</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modulo.agrupamento'/>">
  		<html:text property="modulo.agrupamento" maxlength="150" size="40" styleId="agrupamentoLabel"/>
  	</div>
</div>
<div class="row formlabel_sf" id="rowAgrupamento" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.iconFile'/>">
  		<fmt:message key="ipdms.modulo.iconFile"/>
  	</div>

  	<c:set var="fileForUpload" value="${moduloFormBean.iconFile}" scope="request" />
  	<c:import url="/ipdms/commons/fileupload/replaceablefile.jsp">  		
  		<c:param name="formUploadProperty" value="iconFile" />
  	</c:import>  	
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modulo.useasdefaulticon'/>">
  		<label for="checkboxuseAsDefaultIcon"><fmt:message key="ipdms.modulo.useasdefaulticon"/></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modulo.useasdefaulticon'/>">
  		<html:checkbox property="modulo.useAsDefaultIcon" styleClass="radion" styleId="checkboxuseAsDefaultIcon" style="border:0;" />
  	</div>
</div>

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio.condicionado' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio.condicionado" /></span>
  	</div>
</div>

<jsp:include page="privilegestemplate.jsp" />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
			onclick="setActionAndSubmit(this.form, 'listModulo.do2');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
</div>
</html:form>
