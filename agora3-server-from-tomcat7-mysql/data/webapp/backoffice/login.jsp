<%@taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@page errorPage="/backoffice/errors/error.jsp" %>
<h1>Login</h1>
<logic:messagesPresent message="false">
	<html:errors />
</logic:messagesPresent>
<html:form action="/login" method="post">

<TABLE border="0" width="100%">
		<TBODY>
			<logic:present name="errormsg" scope="request">
				<TR>
					<TD class="textovermelho" colspan="2" height="50">
						${errormsg}
					</TD>
				</TR>
			</logic:present>
			<TR>
				<TD class="txt10normal" width="20%">
					<bean:message key="kcms.login.user" locale="locale" />
				</TD>
				<TD>
					<html:text property="user" styleClass="formsize" maxlength="30" />
				</TD>
			</TR>
			<TR>
				<TD class="txt10normal">
					<bean:message key="kcms.login.password" locale="locale" />
				</TD>
				<TD>
					<html:password property="pass" redisplay="false" styleClass="formsize" />
				</TD>
			</TR>
			<TR>
				<TD colspan="2" style="height: 50px">
					<html:submit property="submeter" styleClass="styledButton"><bean:message key="kcms.botao.submeter.label" locale="locale" /></html:submit>
				</TD>
			</TR>
		</TBODY>
	</TABLE>
</html:form>

