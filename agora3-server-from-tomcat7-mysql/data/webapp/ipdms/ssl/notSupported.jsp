<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<br/><br/>
<center>
	<div class="texto">
		<b>
			<fmt:message key="errors.ssl.notsupported" />
		</b>
	</div>
	<br />
	<div>
		<form action="" method="post">
			&nbsp;<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.anterior" />" title="<fmt:message key='ipdms.forms.anterior.title' />"
					onclick="this.form.action='${pageContext.request.contextPath}${sessionScope.urlAnterior}';">				
		</form>
	</div>
</center>