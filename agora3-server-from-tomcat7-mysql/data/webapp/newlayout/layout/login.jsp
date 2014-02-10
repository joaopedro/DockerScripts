<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/sslext.tld" prefix="sslext" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />

<section id="Login">
<img src="${IMG_DIR}/Logo_login.png" width="221" height="254" alt="ÁGORA SYSTEMS" style="display:block; margin-left:auto; margin-right:auto;"/>

<form id="UserLogin" action="${pageContext.request.contextPath}/j_acegi_security_check" method="post" autocomplete="off">
  <c:if test="${param.erro}">
	<fmt:message key="agora.errors.invalid.login" />
  </c:if>
  
  <p>
    <span class="h1">
      <fmt:message key="agora.login.title"/>
    </span>
  </p>
  <p>
    <label title="<fmt:message key='agora.login.user'/>">
		<fmt:message key="agora.login.user"/>
    </label>
    <input title="<fmt:message key='agora.login.user'/>" type="text" value="" id="user" name="j_username" autocomplete="off"/>
  </p>
  <p>
    <label title="<fmt:message key='agora.login.password'/>">
		<fmt:message key="agora.login.password"/>
    </label>
    <input title="<fmt:message key='agora.login.password'/>" type="password" value="" id="pass" name="j_password" autocomplete="off"/>
    <input name="Entrar" type="submit" value="<fmt:message key='agora.login.enter'/>" title="<fmt:message key='agora.login.enter'/>" />
  </p>
  
  <c:set var="HTTPS_AVAILABLE"><kcms:configuracao configEntry="HTTPS_AVAILABLE" /></c:set>
	<c:if test="${HTTPS_AVAILABLE == 'true'}">
	<c:choose>
		<c:when test="${pageContext.request.scheme == 'https'}">
			<sslext:link action="/ssl/login.do2">
				<fmt:message key="ipdmslogin.authsemcertificado" />
			</sslext:link>							
		</c:when>
		<c:otherwise>
			<sslext:link action="/ssl/secureLogin.do2">
				<fmt:message key="agora.login.certified" />
			</sslext:link>
		</c:otherwise>
	</c:choose>
	</c:if>
	<p><a href="#"><fmt:message key="agora.login.recovery" /></a></p>
</form>
</section>