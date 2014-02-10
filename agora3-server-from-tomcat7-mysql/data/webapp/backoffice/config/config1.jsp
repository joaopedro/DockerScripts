<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<ul id="menuconfig" class="dhtmlgoodies_tree"><c:forEach items="${ config }" var="c0">
	<li title="${ c0.title }" id="node${ c0.pos }" noDrag="true" noRename="true" noDelete="true"><a href="javascript:  getProperties('${ c0.fullpath }', 'node${ c0.pos }')">
		<span onmouseover="setEntry(${ c0.pos }, '${ c0.fullpath }')">${ c0.path }</span></a>
			&nbsp;&nbsp;&nbsp;<img border=0 id="dots${ c0.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( '${ c0.fullpath }', 'node${ c0.pos }' )"/>
			&nbsp;&nbsp;&nbsp;<img border=0 id="dels${ c0.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteConfig( '${ c0.fullpath }' )"/>
		<c:if test="${ not empty c0.childs }" >
		<ul><c:forEach items="${ c0.childs }" var="c1">
			<li title="${ c1.title }" id="node${ c1.pos }" noDrag="true" noRename="true" noDelete="true"><a href="javascript:  getProperties('${ c1.fullpath }', 'node${ c1.pos }')">
				<span onmouseover="setEntry(${ c1.pos }, '${ c1.fullpath }')">${ c1.path }</span></a>
				&nbsp;&nbsp;&nbsp;<img border=0 id="dots${ c1.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( '${ c1.fullpath }', 'node${ c1.pos }' )"/>
				&nbsp;&nbsp;&nbsp;<img border=0 id="dels${ c1.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteConfig( '${ c1.fullpath }' )"/>
				<c:if test="${ not empty c1.childs }" >
				<ul><c:forEach items="${ c1.childs }" var="c2">
					<li title="${ c2.title }" id="node${ c2.pos }" noDrag="true" noRename="true" noDelete="true"><a href="javascript:  getProperties('${ c2.fullpath }', 'node${ c2.pos }')">
						<span onmouseover="setEntry(${ c2.pos }, '${ c2.fullpath }')">${ c2.path }</span></a>
						&nbsp;&nbsp;&nbsp;<img border=0 id="dots${ c2.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( '${ c2.fullpath }', 'node${ c2.pos }' )"/>
						&nbsp;&nbsp;&nbsp;<img border=0 id="dels${ c2.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteConfig( '${ c2.fullpath }' )"/>
						<c:if test="${ not empty c2.childs }" >
							<ul><c:forEach items="${ c2.childs }" var="c3">
								<li title="${ c3.title }" id="node${ c3.pos }" noDrag="true" noRename="true" noDelete="true"><a href="javascript: getProperties('${ c3.fullpath }', 'node${ c3.pos }')">
									<span onmouseover="setEntry(${ c3.pos }, '${ c3.fullpath }')">${ c3.path }</span></a>
									&nbsp;&nbsp;&nbsp;<img border=0 id="dots${ c3.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( '${ c3.fullpath }', 'node${ c3.pos }' )"/>
									&nbsp;&nbsp;&nbsp;<img border=0 id="dels${ c3.pos }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteConfig( '${ c3.fullpath }' )"/>
								</li>
								</c:forEach>
							</ul>
						</c:if>
					</li>
					</c:forEach>
				</ul>
				</c:if>
			</li>
			</c:forEach>
		</ul>
		</c:if>
	</li>
	</c:forEach>
	<li title="(Nova Entrada)" id="nodenew" noDrag="true" noRename="true" noDelete="true"><a href="javascript: getProperties('(new)', 'nodenew')">
		<span onmouseover="setEntry( 'new', '(new)')">Nova Entrada</span></a>
		&nbsp;&nbsp;&nbsp;<img border=0 id="dotsnew" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( '(new)', 'nodenew' )"/>
	</li>
</ul>
<script type="text/javascript" language="JavaScript1.2">
	treeObj${menu} = new JSDragDropTree();
	treeObj${menu}.setTreeId('menuconfig');
	treeObj${menu}.setImageFolder("${pageContext.request.contextPath}/backoffice/js/tree/images/");
	treeObj${menu}.setMaximumDepth(7);
	treeObj${menu}.initTree();
</script>
