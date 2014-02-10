<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/sinfic-workflow.tld" prefix="wf"%>

<wf:result-pane notificationId="notification">
	<logic:notEmpty name="notification" property="attributes">
		<logic:iterate id="entry" name="notification" property="attributes">
			<bean:define id="attribute" name="entry" property="value" />
			<logic:equal name="attribute" property="subType" value="RESPOND">
				<logic:notEqual name="attribute" property="name" value="RESULT">
					<bean:write name="attribute" property="displayName" />&nbsp;<wf:attribute name="attribute"/><br />
				</logic:notEqual>
			</logic:equal>
		</logic:iterate>
	</logic:notEmpty>
	<logic:equal name="notification" property="attribute(RESULT).format" value="FECHAR">
		<wf:attribute name="RESULT" />
	</logic:equal>
	
	<logic:notEqual name="notification" property="attribute(RESULT).null" value="true">
		<logic:notEqual name="notification" property="attribute(RESULT).format" value="FECHAR">
			<fieldset style="margin-left:2px; width:97%;">
				<legend><bean:write name="notification" property="attribute(RESULT).displayName" /></legend>
						<wf:attribute name="RESULT" displayType="RADIO" />
			</fieldset>
		</logic:notEqual>
	</logic:notEqual>
	<logic:equal name="notification" property="attribute(RESULT).null" value="true">
		<html:hidden property="emptyResult" value="true"/>
	</logic:equal>

</wf:result-pane>
