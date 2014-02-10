<%@taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%
	boolean logged = com.sinfic.kcms.userinfo.CSessionInfo.getUserLogged( request );
	request.setAttribute("logged", new Boolean(logged));
%> 
<div align="right" style="background: 'whitesmoke'">
	<html:link action="../homepage" styleClass="loginItems">Home</html:link>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<logic:equal name="logged" value="true">
		<html:link action="/logout" styleClass="loginItems">Logout</html:link>
	</logic:equal>
	<logic:notEqual name="logged" value="true">
		<html:link action="/logar" styleClass="loginItems">Login</html:link>
	</logic:notEqual>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</div>