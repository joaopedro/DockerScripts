<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="referer" scope="page"><%=com.sinfic.util.EncodingUtils.encodeURL(request.getContextPath() + "/displayconteudo.do2?numero=") %>${servicoOnline.numeroConteudo}</c:set>

<script type="text/javascript">
	showAssignedUser = function (img) {
		var child = img;
		var myajax = new Ajax.Updater( {success: "users_" + child.attributes['id'].value},
							child.attributes['action'].value,
							{method: 'get',evalScripts:true} );
	};
</script>

<br />
<c:set var="referer" value="${referer}" scope="request" />
<jsp:include page="parts/listOfEtapas.jsp" />
