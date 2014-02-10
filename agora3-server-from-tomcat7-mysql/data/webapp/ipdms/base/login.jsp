<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/sslext.tld" prefix="sslext" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>
<div class="column-one-content">

<div id="list-menu">
<TABLE cellSpacing="0" cellPadding="0" width="100%" summary="tabela decorativa">
<TBODY>
	<TR>
		<TD>
			<TABLE class="areaLogin" cellSpacing="0" cellPadding="0" style="border:none">
				<TBODY>
					<TR>
						<TD style="padding-left:5px;">Login</TD>
					</TR>
				</TBODY>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD class=subArea-meio>
			<TABLE cellSpacing="0" cellPadding="0" border="0">
			<TBODY>
				<TR>
					<td style="padding-left:0.25em; padding-bottom:0.38em;">
					<c:if test="${erro}">
						<div class="mensagenErro1">
							<fmt:message key="errors.invalid.login" />
						</div>
					</c:if>
					<form action="${pageContext.request.contextPath}/j_acegi_security_check" method="post" autocomplete="off">
						<div class="suporteFormLogin">
							<label for="user"><fmt:message key="ipdmslogin.login"/></label>
							<br>
							<input type="text" value="" id="user" name="j_username" autocomplete="off" />
							<br>
							<label for="pass"><fmt:message key="ipdmslogin.password"/></label>
							<br>
							<input type="password" id="pass" value="" name="j_password" 
								onfocus="this.select();" autocomplete="off" style="vertical-align:top;">
							<input name="submeter" 
							   type="image"
							   src="${pageContext.request.contextPath}/images/icon/icon-login.png"
							   value="Entrar"
							   alt="<fmt:message key='ipdmslogin.submitBtn'/>"
							   title="<fmt:message key='ipdmslogin.submitBtn'/>"
							   style="border:0;"
							   />	
						</div>
						<c:set var="HTTPS_AVAILABLE"><kcms:configuracao configEntry="HTTPS_AVAILABLE" /></c:set>
						<c:if test="${HTTPS_AVAILABLE == 'true'}">
						<c:choose>
							<c:when test="${pageContext.request.scheme == 'https'}">
								<sslext:link action="/ssl/login.do2" styleClass="texto">
									<fmt:message key="ipdmslogin.authsemcertificado" />
								</sslext:link>							
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/images/icon/icon-lock.png" width="12" height="17" style="border:none;" alt="<fmt:message key='ipdmslogin.authcomcertificado'/>" title="<fmt:message key='ipdmslogin.authcomcertificado'/>" />
								<sslext:link action="/ssl/secureLogin.do2" styleClass="texto">
									<fmt:message key="ipdmslogin.authcomcertificado" />					
								</sslext:link>
							</c:otherwise>
						</c:choose>		
						</c:if>				
						<br />
					</form>
					</td>
				</TR>
			</TBODY>
			</TABLE>
		</TD>
	</TR>
</TBODY>
</TABLE>
</div>
</div>