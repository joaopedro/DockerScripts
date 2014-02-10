<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>

<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="margin-bottom:3px">
    <tbody>
        <tr align="left" valign="top">
            <td>
            	<tiles:useAttribute id="contentList" name="contentList" ignore="true"/>
            	<logic:notEmpty name="contentList">
					<logic:iterate id="contentElem" name="contentList">
						<tiles:insert beanName="contentElem" flush="false"></tiles:insert>
					</logic:iterate>
				</logic:notEmpty>
				
				<logic:empty name="contentList">
	            	<tiles:get name="content" ignore="true"/>	
				</logic:empty>
            </td>
        </tr>
    </tbody>
</table>
