<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html:form action="/saveInformacao" method="post" styleClass="form">
<html:hidden property="informacao.id"/>

<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.info.titulo' />">
  		<label for="titulo"><fmt:message key="ipdms.info.titulo" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.info.titulo' />">
  		<html:text property="informacao.titulo" style="width: 96%;" size="40" maxlength="80" styleId="titulo"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.info.subtitulo' />">
  		<label for="subTitulo"><fmt:message key="ipdms.info.subtitulo" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.info.subtitulo' />">
  		<html:text property="informacao.subTitulo" style="width: 96%;" size="80" maxlength="2000" styleId="subTitulo"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.info.descricaocurta' />">
  		<label for="descricao"><fmt:message key="ipdms.info.descricaocurta" /></label>
  	</div>
  	
  	<div class="label" style="width: 79%;" title="<fmt:message key='ipdms.info.descricaocurta' />">
  		<html:textarea property="informacao.descricao" style="width: 96.5%;" cols="80" rows="10" styleId="descricao"/>
  	</div>
</div>
<div class="row formlabel_sf" style="height:40px;">
	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.info.paginainicial' />">
  		<label for="paginaInicial"><fmt:message key="ipdms.info.paginainicial" /></label>
  	</div>
  	
  	<div class="label" style="width: 78%;" title="<fmt:message key='ipdms.info.paginainicial' />">
  		<html:checkbox property="informacao.paginaInicial" styleClass="radion" style="border:0;" styleId="paginaInicial"/> 	 
  	</div>
</div>
<br /><br />

<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
		onclick="setActionAndSubmit(this.form, 'listInformacao.do2');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
</div>
</html:form>