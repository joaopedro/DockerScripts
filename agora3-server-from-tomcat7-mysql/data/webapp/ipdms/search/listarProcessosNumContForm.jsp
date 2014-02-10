<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html:form method="post" action="/listnumcont" styleClass="frm">
	<html:hidden property="page" value="1" />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='webflow.requerente.nif.vazio' />">
		<fmt:message key="webflow.requerente.nif.vazio" />:
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='webflow.requerente.nif.vazio' />">
  		<html:text styleClass="textinput" property="params(numcontribuinte)" size="9" maxlength="9" onkeypress="return isDigit();" />
  	</div>	
	<div style="clear:both"></div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTabButton label" style="width: 10%;" title="">
		<input type="submit" name="search" title="<fmt:message key='ipdms.forms.pesquisar' />" value="<fmt:message key='ipdms.forms.pesquisar' />" class="btForm" />
	</div>
	<div style="clear:both"></div>
</div>
	
</html:form>
