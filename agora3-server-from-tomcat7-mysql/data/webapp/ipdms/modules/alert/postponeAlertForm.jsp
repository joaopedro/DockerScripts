<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<br/>
<fieldset>
<legend><fmt:message key="ipdms.modules.alert.agendamento.titulo" /></legend>

<input type="hidden" id="alert_id" value="${alert.id}">
<input type="hidden" id="alert_alertdate" value=" ${alert.alertDate}">
	 <div class="row formlabel_sf" style="margin-left:-10px">
          <div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.alert.dataalerta' />">
				<fmt:message key="ipdms.modules.alert.dataalerta" />:
          </div>
          
          <div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.alert.dataalerta' />">
             ${alert.alertDate}
          </div>
      </div>

	<div class="row formlabel_sf" style="margin-left:-10px" >
          <div class="leftTab label" style="width: 18%; " title="<fmt:message key='ipdms.modules.alert.agendamento.novadata' />">
				<label for="novadataAlerta"><fmt:message key="ipdms.modules.alert.agendamento.novadata" /></label>
          </div>
          
          <div class="label" style="width: 79%;" title="<fmt:message key='ipdms.modules.alert.agendamento.novadata' />">
          		<input type="text" id="alert_newalertdate" value="${alert.newAlertDate}" size="10"/>
				<script>Calendar.setup({ inputField : 'alert_newalertdate', ifFormat : '%d-%m-%Y'});</script>
          </div>
      </div>


<div style="clear:both"></div>
	<div class="buttonRow">
		<input type="button" class="btForm" title="<fmt:message key='ipdms.forms.submit.title'/>" value="<fmt:message key='ipdms.forms.submit'/>" onclick="postponeAlerta();" />
		<input type="button" class="btFormEscuro" title="<fmt:message key='ipdms.forms.cancelar.title'/>" value="<fmt:message key='ipdms.forms.cancelar'/>" onclick="Element.update('editAlertPane', '' );" />
	</div>
</fieldset>