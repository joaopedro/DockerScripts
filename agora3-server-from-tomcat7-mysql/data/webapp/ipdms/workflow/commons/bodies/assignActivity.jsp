<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.assign_activity.selectResponsavel" var="selectResponsavel" />

<bean:write name="notification" property="body"  filter="false"/>

<logic:present name="todos">
	<fmt:message key="ipdms.assign_activity.alert.all" />
</logic:present>
<logic:present name="etapa">
	<br/>${selectResponsavel} <b>${etapaParaDistribuir.titulo}</b>:
	<br/>
	<br/>
</logic:present>
<html:hidden property="activityName" />

<logic:iterate id="colaborador" name="colaboradores">

	<bean:define id="login"><bean:write name="colaborador" property="key" /></bean:define>
	<logic:notPresent name="todos">
		<logic:equal name="tipoDistribuicao" property="multipleResponders" value="false">
			<html:radio property="roles" value="${login}" styleClass="radion"/>		
		</logic:equal>
		<logic:notEqual name="tipoDistribuicao" property="multipleResponders" value="false">
			<html:multibox property="roles"><bean:write name="login" /></html:multibox>
		</logic:notEqual>
	</logic:notPresent>	
	<bean:write name="colaboradores" property='<%= login.toString() +  ".titulo" %>' /><br/>
</logic:iterate>
