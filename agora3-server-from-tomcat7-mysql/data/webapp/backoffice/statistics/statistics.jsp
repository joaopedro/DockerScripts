<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<h1>Estatísticas</h1>	

<html:form action="/statistics" onsubmit="return false;" method="post">
	<html:hidden property="page" value="1"/>
	<html:hidden property="metodo" value="doReport"/>	
	<html:errors />	 
	<logic:present name="logErrors">
		<html:messages id="message" message="true">
			${message}
		</html:messages>
	</logic:present>
	
	<p class="texto">
		Entre:
		<html:text property="start" styleId="start" maxlength="10" size="9"/>
		e:
		<html:text property="end" styleId="end" maxlength="10" size="9"/>
		(AAAA-MM-DD)
	<script type="text/javascript" language="JavaScript">	 
		Calendar.setup({
			inputField     :    "start",   // id of the input field
			ifFormat       :    "%Y-%m-%d",       // format of the input field
			showsTime      :    true,
			timeFormat     :    "24"
		});
		Calendar.setup({
			inputField     :    "end",   // id of the input field
			ifFormat       :    "%Y-%m-%d",       // format of the input field
			showsTime      :    true,
			timeFormat     :    "24"
		});
	</script>
	<br />
	</p>	
	<html:submit value="Submeter" onmouseover="changeImage(this, 1);" onmouseout="changeImage(this, 2);" styleClass="styledButton"
	onclick="ajaxSubmitGeneric( document.statisticsForm, 'mainbody' )"
	/>
</html:form>
