<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:message key="agora.info.produtos" var="infoProdutos"/>
<fmt:message key="agora.rightsReserved" var="rightsReserved"/>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/newlayout/images" />

<div class="colLeft">
  <a href="http://www.sinfic.pt/">
    <img src="${IMG_DIR}/logo_sinfic.png" width="119" height="28" alt="SINFIC" title="SINFIC"/>
  </a>
  <p>
    Copyright &copy; 2013 Sinfic. ${rightsReserved}.
  </p>
</div>
<div class="colRight">
<p>
  <a href="#" onclick="javascript:alert('${infoProdutos}');">
    <img src="${IMG_DIR}/ico_info.png" width="16" height="16" alt="${infoProdutos}" title="${infoProdutos}"/>
  </a>
</p>
</div>
