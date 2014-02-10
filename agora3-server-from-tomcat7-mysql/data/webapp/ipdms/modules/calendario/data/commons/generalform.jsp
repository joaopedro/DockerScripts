<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html:hidden property="id"/>
<html:hidden property="calendarioid"/>

<div class="row" style="padding-bottom:2%;">
	<div class="leftTab label" style="width: 90%; " title="<fmt:message key='ipdms.obrigatorio' bundle='${calendarioBundle}' />">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" bundle="${calendarioBundle}" /></span>
  	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.designacao' bundle='${calendarioBundle}' />">
		<label for="designacao"><fmt:message key="data.designacao" bundle="${calendarioBundle}" /> *</label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='data.designacao' bundle='${calendarioBundle}' />">
		<html:text styleId="designacao" property="designacao" />
	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.descricao' bundle='${calendarioBundle}' />" >
		<label for="descricao"><fmt:message key="data.descricao" bundle="${calendarioBundle}" /> </label>
	</div>
	<div class="label" style="width: 80%;" title="<fmt:message key='data.descricao' bundle='${calendarioBundle}' />">
		<html:text styleId="descricao" property="descricao" />
	</div>
</div>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='data.data' bundle='${calendarioBundle}' />">
		<label for="data"><fmt:message key="data.data" bundle="${calendarioBundle}" /> *</label>
	</div>
	<div class="label" style="width: 80%;">
		<html:text styleId="${viewPrefix}data" property="data" size="10" maxlength="10" />
		<img style="vertical-align: bottom" id="${viewPrefix}dataImg" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" 
			class="cursorMao" alt="<fmt:message key='data.data' bundle='${calendarioBundle}' />" title="<fmt:message key='data.data' bundle='${calendarioBundle}' />" />
	</div>
       <script type='text/javascript'>
        	Calendar.setup({ inputField : '${viewPrefix}data', ifFormat : '%d-%m-%Y', showsTime : false });
        	Calendar.setup({ inputField : '${viewPrefix}data', ifFormat : '%d-%m-%Y', button : "${viewPrefix}dataImg" });
       </script>		
</div>
