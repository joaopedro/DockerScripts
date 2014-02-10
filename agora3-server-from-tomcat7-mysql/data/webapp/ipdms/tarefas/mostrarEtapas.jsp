<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="referer" scope="page"><%=com.sinfic.util.EncodingUtils.encodeURL(request.getContextPath() + "/notification.do2?nid=") %>${nid}</c:set>

<script type="text/javascript">
showAssignedUser = function (img) {
	var child = img;
	var myajax = new Ajax.Updater( {success: "users_" + child.attributes['id'].value},
						child.attributes['action'].value,
						{method: 'get',evalScripts:true} );
};
</script>

<c:set var="referer" value="${referer}" scope="request" />
<jsp:include page="/ipdms/servico/parts/listOfEtapasSimple.jsp" />
