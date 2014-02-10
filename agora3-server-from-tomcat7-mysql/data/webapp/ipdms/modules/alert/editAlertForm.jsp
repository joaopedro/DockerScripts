<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<div id="errorDivAlert">
	<html:errors />
</div>
<input type="hidden" id="alert_id" value="${alertBean.id}">
<input type="hidden" id="numero" value="${servicoOnline.numeroConteudo}">

<div class="row formlabel_sf" style="padding-bottom:10px;">
	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.modules.alert.datacriacao' />">
		<span class="textoBold">
			<fmt:message key="ipdms.modules.alert.datacriacao" />:
		</span>
	</div>
	<div class="textoCinza" style="width: 65%;" title="<fmt:message key='ipdms.modules.alert.datacriacao' />">${alertBean.creationDate}</div>
</div>
<div class="row formlabel_sf" style="padding-bottom:10px;">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.alert.processo' />">
		<span class="textoBold">
			<fmt:message key="ipdms.modules.alert.processo" />:
		</span>
	</div>
	<div class="textoCinza" style="width: 80%;" title="<fmt:message key='ipdms.modules.alert.processo' />">${alertBean.process}</div>
</div><br />
<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.alert.subject' />">
		<label for="alert_subject"><fmt:message key="ipdms.modules.alert.subject" /></label>*
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.alert.subject' />">
		<input type="text" id="alert_subject" name="alert_subject" value="${alertBean.subject}" size="80" maxlength="255"/>
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.alert.dataalerta' />" >
		<label for="alert_alertdate"><fmt:message key="ipdms.modules.alert.dataalerta" />*</label>
	</div>
	<div class="label" style="margin-right:2px;" title="<fmt:message key='ipdms.modules.alert.dataalerta' />">
		<input type="text" id="alert_alertdate" name="alert_alertdate" value="${alertBean.alertDate}" size="10" maxlength="10" onkeypress="return false;"/>		
	</div>
	<div class="label" style="width:49%">
		<img id="dataAlertaButton" src="${pageContext.request.contextPath}/images/guichet/icons/icon-calendario.png" class="cursorMao" alt="<fmt:message key='ipdms.modules.alert.dataalerta' />" title="<fmt:message key='ipdms.modules.alert.dataalerta' />" />
		<script>Calendar.setup({ inputField : 'alert_alertdate', ifFormat : '%d-%m-%Y', button : "dataAlertaButton" });</script>
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.alert.detail' />">
		<label for="alert_detail"><fmt:message key="ipdms.modules.alert.detail" /></label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.modules.alert.detail' />">
		<input type="text" id="alert_detail" name="alert_detail" value="${alertBean.detail}" size="100" maxlength="512"/>
	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; "></div>
	<div class="label" style="width: 80%;"></div>
</div>
<div class="buttonRow">
	<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.gravar'/>" value="<fmt:message key="ipdms.forms.gravar"/>" onclick="saveAlerta();" />
	<input type="button" class="btFormEscuro" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key="ipdms.forms.cancelar"/>" onclick="Element.update('editAlertPane', '' );" />
</div>