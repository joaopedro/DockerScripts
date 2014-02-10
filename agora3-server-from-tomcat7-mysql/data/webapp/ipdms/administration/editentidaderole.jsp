<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>

<html:form action="/saveEntidadeRole" method="post" styleClass="form">

<html:hidden property="role.id"/>

<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.entidaderole.descricao" />">
  		<label for="descricao"><fmt:message key="ipdms.entidaderole.descricao" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.entidaderole.descricao" />">
  		<html:text property="role.descricao" size="80" maxlength="200" styleId="descricao"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.entidaderole.sigla" />">
  		<label for="sigla"><fmt:message key="ipdms.entidaderole.sigla" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.entidaderole.sigla" />">
  		<html:text property="role.sigla" size="20" maxlength="20" styleId="sigla"/>
  	</div>
</div>
<br />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key="ipdms.forms.anterior.title" />"
		onclick="setActionAndSubmit(this.form, 'listEntidadeRole.do2');" />
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit" />" title="<fmt:message key="ipdms.forms.submit.title" />" />
</div>

</html:form>