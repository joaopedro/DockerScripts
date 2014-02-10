<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script type="text/javascript" src='${pageContext.request.contextPath}/ipdms/js/jquery/jquery-1.7.2.js' ></script>

<html:form action="/saveTarefa" method="post" styleClass="form">
<html:hidden property="tarefa.id"/>

<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key="ipdms.obrigatorio" />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.nome" />">
  		<label for="titulo"><fmt:message key="ipdms.tarefa.nome" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.nome" />">
  		<html:text property="tarefa.titulo" style="width: 50%;" size="40" maxlength="80" styleId="titulo"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.label" />">
  		<label for="tarefa"><fmt:message key="ipdms.tarefa.label" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.label" />">
  		<html:text property="tarefa.label" style="width: 50%;" size="80" maxlength="2000" styleId="tarefa"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.descricao" />">
  		<label for="descricao"><fmt:message key="ipdms.tarefa.descricao" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.descricao" />">
  		<html:text property="tarefa.descricao" style="width: 50%;" size="80" maxlength="2000" styleId="descricao"/>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.link" />">
  		<label for="link"><fmt:message key="ipdms.tarefa.link" /> *</label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.link" />">
  		<html:text property="tarefa.link" style="width: 50%;" size="80" maxlength="2000" styleId="link"/>
  	</div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.novajanela" />">
  		<label for="novaJanela"><fmt:message key="ipdms.tarefa.novajanela" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.novajanela" />">
  		<html:checkbox property="tarefa.novaJanela" styleClass="radion" style="border:0;" styleId="novaJanela"/>
  	</div>
</div>
<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.propriapagina" />">
  		<label for="abrirNaPagina"><fmt:message key="ipdms.tarefa.propriapagina" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.propriapagina" />">
		<html:checkbox property="tarefa.abrirNaPagina" styleClass="radion" style="border:0;" styleId="abrirNaPagina" onclick="showHide();/>
  	</div>
</div>

<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.autosaveetapa" />">
  		<label for="autoSaveEtapa"><fmt:message key="ipdms.tarefa.autosaveetapa" /></label>
  	</div>
  	
  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.autosaveetapa" />">
		<html:checkbox property="tarefa.autoSaveEtapa" styleClass="radion" style="border:0;" styleId="autoSaveEtapa"/>
  	</div>
</div>

<div id="autoOpenDiv" style="display: none;" class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key="ipdms.tarefa.autoopenetapa" />">
  		<label for="autoOpenEtapa"><fmt:message key="ipdms.tarefa.autoopenetapa" /></label>
  	</div>

  	<div class="label" style="width: 80%;" title="<fmt:message key="ipdms.tarefa.autoopenetapa" />">
		<html:checkbox property="tarefa.autoOpenEtapa" styleClass="radion" style="border:0;" styleId="autoOpenEtapa"/>
  	</div>
</div>

<br />
<br />
<div class="buttonRow">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key="ipdms.forms.anterior.title"/>"
			onclick="setActionAndSubmit(this.form, 'listTarefa.do2');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key="ipdms.forms.submit.title"/>">
</div>
<br />

</html:form>


<script type="text/javascript">

	// onload the jsp
	jQuery( document ).ready(function( $ ) {
		var checked = $('#abrirNaPagina').is(':checked');

		// if "abrirNaPagina" checkbox is checked, show "autoOpenDiv"
		if(checked){
			$('#autoOpenDiv').css('display', 'block');
		}

	});

	// on check "abrirNaPagina"
	function showHide() {
		jQuery('#autoOpenDiv').toggle();
	};

</script>