<%@ taglib uri="/tags/html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.lockuser.obterCodigo" var="obterCodigo" />

<table style="border:none;" cellpadding="0" cellspacing="0" width="100%" >
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
			<html:errors/>
			<br/>
			<p>
				<fmt:message key="ipdms.lockuser.msg1" />
			</p>
			<br/>
			<p>
				<fmt:message key="ipdms.lockuser.msg2" /><br/>
			</p>
			<p>
				<html:form action="/public/getUnlockCodeForUser" method="POST">
					<div class="row formlabel_sf">
				   		<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.lockuser.username' />">
				   	  		<label for="username"><fmt:message key="ipdms.lockuser.username" /></label> * 
				   	  	</div>
				   	  	
				   	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.lockuser.username' />">
				   	  		<html:text property="username" size="20"/>
				   	  	</div>
				   	</div>
				   	<div class="row formlabel_sf">
				  	  	<div class="leftTab label" style="width: 17%;" title="<fmt:message key='ipdms.lockuser.email' />">
				  	  		<label for="email"><fmt:message key="ipdms.lockuser.email" /> *</label> 
				  	  	</div>					  	  		
				  	  	<div class="label" style="width: 80%;" title="<fmt:message key='ipdms.lockuser.email' />">
				  	  		<html:text property="email" size="70" />
						</div>
					</div>
					<div class="row formlabel_sf">
				  	  	<div class="leftTab label" style="width: 17%;">
				  	  		 <html:submit value="${obterCodigo}" title="${obterCodigo}" styleClass="btForm"/>
				  	  	</div> 		
					</div>
				</html:form>
			</p>				
		</td>
	</tr>
</table>