<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<li>Menus
		<ul><c:forEach items="${ menu }" var="m0">
			<li id="node${ m0.numero }"><a href="javascript: openMenu( ${ m0.numero } )">${ m0.titulo }</a><div id="subnode${ m0.numero }">
			</div></li>
		</c:forEach></ul>
	</li>
</ul>
