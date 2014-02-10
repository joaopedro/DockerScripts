<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html:form action="/saveFuncao" method="post" styleClass="form">
<html:hidden property="funcao.id"/>

<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.funcao.titulo' />">
  		<label for="titulo"><fmt:message key="ipdms.funcao.titulo" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.funcao.titulo' />">
  		<html:text property="funcao.titulo" size="60" maxlength="100" styleId="titulo"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.funcao.descricao' />">
  		<label for="descricao"><fmt:message key="ipdms.funcao.descricao" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.funcao.descricao' />">
  		<html:text property="funcao.descricao" size="60" maxlength="100" styleId="descricao"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.funcao.sigla' />">
  		<label for="sigla"><fmt:message key="ipdms.funcao.sigla" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.funcao.sigla' />">
  		<html:text property="funcao.sigla" size="20" maxlength="20" styleId="sigla"/>
  	</div>
</div>
<br />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
		onclick="setActionAndSubmit(this.form, 'listFuncao.do2');">
	<c:if test="${!IPDMSInteropReceiver}">
		<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>">
	</c:if>
</div>
</html:form>