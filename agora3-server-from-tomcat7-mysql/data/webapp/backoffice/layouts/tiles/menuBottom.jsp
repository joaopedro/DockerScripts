<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<table width="100%" border="0" cellpadding="0" cellspacing="0" background='<kcms:path configEntry="IMGDIR" />/nav/fndbot.gif' style="background-position: center bottom" >
	<tr>
		<td	align="right">
			<table cellpadding="0" cellspacing="0" border="0">
				<logic:present name="menuBot">
					<bean:define name="urlsBot" id="urlsBot"></bean:define>
					<logic:iterate name="menuBot" indexId="i" id="iter">
						<td width="100" height="45" align="center" valign="top" class="menuBottom">
							<a class="loginItems" href='<kcms:path configEntry="HOMEDIR" />/${urlsBot[i]}'>
								${iter.titulo}
							</a>
						</td>
						<td	width="20">
							<br />
						</td>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="menuBot">
					<td><br /></td>
				</logic:notPresent>
			</table>
		</td>
	</tr>
</table>
