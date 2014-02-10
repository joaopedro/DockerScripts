<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.comunicacaoparecer.pesquisa.numProcesso" var="numProcesso"/>

<html:form action="/listnumproc" styleClass="frm">
	<html:hidden property="hist" />
	<html:hidden property="page" value="1" />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="${numProcesso}">
  		${numProcesso}
  	</div>
  	
  	<div class="label" style="width: 30%;" title="${numProcesso}">
  		<html:text styleClass="textinput" property="params(numprocesso)" size="20" maxlength="20" />  		
  	</div>	
	<div style="clear:both"></div>
</div>
<div class="buttonRow">
	<input type="submit" name="search" title="<fmt:message key='ipdms.forms.pesquisar'/>" value="<fmt:message key='ipdms.forms.pesquisar'/>" class="btForm" />
</div>
</html:form>
