<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>

$('${nid}').src=$('${nid}').src.replace("mais","menos");
$('${nid}').onclick=function(){
	$('show-users-${nid}').hide();//esconder utilizadores assignados
	//repor valores iniciais
	$('${nid}').src=$('${nid}').src.replace("menos","mais");	
	$('${nid}').onclick=function(){showAssignedUser($('${nid}'));};
};

</script>

<div id="show-users-${nid}" >
<c:choose>
<c:when test="${erro != null}">${erro}</c:when>
<c:otherwise>
		<c:forEach items="${colaboradores}" var="user">
			<span title="${user.titulo}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.login}<br />
			</span>
		</c:forEach>
</c:otherwise>
</c:choose>
<!-- <img style="text-align:right;" src="images/icon/icon-menos.png" title="Ocultar nomes" alt="Ocultar nomes" onclick="$('show-users-${nid}').hide();"/> -->
</div>
