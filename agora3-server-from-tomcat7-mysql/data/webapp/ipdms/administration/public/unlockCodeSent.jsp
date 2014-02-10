<table style="border:none;" cellpadding="0" cellspacing="0" width="100%" >
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<tr>
		<td>
			<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
				<tbody>
				  <tr>
				    <td class="titulo1"><fmt:message key="ipdms.lockuser.title" /></td>
				  </tr>
				</tbody>
			</table>					
		</td>
	</tr>
	<tr>
		<td>
			<br/>
			<p>
				<fmt:message key="ipdms.lockuser.unlockMailMsg" />
			</p>
			<br/>
			<p>
				<a href="${pageContext.request.contextPath}" title="<fmt:message key='ipdms.forms.homepage' />"><fmt:message key="ipdms.forms.homepage" /></a>
			</p>
			<br/>
		</td>
	</tr>
</table>