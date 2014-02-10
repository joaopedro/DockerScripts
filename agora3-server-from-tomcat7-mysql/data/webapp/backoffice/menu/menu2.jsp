<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul menutree="${ menu }" id="menutree${menu}" nodeid="${ menu }" class="dhtmlgoodies_tree"><c:forEach items="${ submenus.childs }" var="m0">
	<li menutree="${ menu }" title="${ m0.titulo }" id="node${ m0.numero }" nodeid="${ m0.numero }" parentid="${ menu }" level="1"><a href="javascript: ">
		<span onmouseover="setEntry('${ m0.numero }', true )" >${ m0.titulo }</span></a>&nbsp;&nbsp;&nbsp;
			<img border=0 id="dots${ m0.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m0.numero } )"/>
			&nbsp;&nbsp;<img border=0 id="dels${ m0.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ menu }, ${ m0.numero } )"/>
		<ul menutree="${ menu }" id="menutree${ m0.numero }"><c:forEach items="${ m0.childs }" var="m1">
			<li menutree="${ menu }" title="${ m1.titulo }" id="node${ m1.numero }" nodeid="${ m1.numero }" parentid="${ m0.numero }" level="2"><a href="javascript: ">
				<span onmouseover="setEntry('${ m1.numero }', true )" >${ m1.titulo }</span></a>&nbsp;&nbsp;&nbsp;
					<img border=0 id="dots${ m1.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m1.numero } )"/>
					&nbsp;&nbsp;<img border=0 id="dels${ m1.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ m0.numero }, ${ m1.numero } )"/>
				<ul menutree="${ menu }" id="menutree${ m1.numero }"><c:forEach items="${ m1.childs }" var="m2">
					<li menutree="${ menu }" title="${ m2.titulo }" id="node${ m2.numero }" nodeid="${ m2.numero }" parentid="${ m1.numero }" level="3"><a href="javascript: ">
						<span onmouseover="setEntry('${ m2.numero }', true )" >${ m2.titulo }</span></a>&nbsp;&nbsp;&nbsp;
							<img border=0 id="dots${ m2.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m2.numero } )"/>
							&nbsp;&nbsp;<img border=0 id="dels${ m2.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ m1.numero }, ${ m2.numero } )"/>
						<ul menutree="${ menu }" id="menutree${ m2.numero }"><c:forEach items="${ m2.childs }" var="m3">
							<li menutree="${ menu }" title="${ m3.titulo }" id="node${ m3.numero }" nodeid="${ m3.numero }" parentid="${ m2.numero }" level="4"><a href="javascript: ">
								<span onmouseover="setEntry('${ m3.numero }', true )" >${ m3.titulo }</span></a>&nbsp;&nbsp;&nbsp;
								<img border=0 id="dots${ m3.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m3.numero } )"/>
								&nbsp;&nbsp;<img border=0 id="dels${ m3.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ m2.numero }, ${ m3.numero } )"/>
								<ul menutree="${ menu }" id="menutree${ m3.numero }"><c:forEach items="${ m3.childs }" var="m4">
									<li menutree="${ menu }" title="${ m4.titulo }" id="node${ m4.numero }" nodeid="${ m4.numero }" parentid="${ m3.numero }" level="5"><a href="javascript: ">
										<span onmouseover="setEntry('${ m4.numero }', true )" >${ m4.titulo }</span></a>&nbsp;&nbsp;&nbsp;
											<img border=0 id="dots${ m4.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m4.numero } )"/>
											&nbsp;&nbsp;<img border=0 id="dels${ m4.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ m3.numero }, ${ m4.numero } )"/>
										<ul menutree="${ menu }" id="menutree${ m4.numero }"><c:forEach items="${ m4.childs }" var="m5">
											<li menutree="${ menu }" title="${ m5.titulo }" id="node${ m5.numero }" nodeid="${ m5.numero }" parentid="${ m4.numero }" level="6"><a href="javascript: ">
												<span onmouseover="setEntry('${ m5.numero }', true )" >${ m5.titulo }</span></a>&nbsp;&nbsp;&nbsp;
												<img border=0 id="dots${ m5.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m5.numero } )"/>
												&nbsp;&nbsp;<img border=0 id="dels${ m5.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ m4.numero }, ${ m5.numero } )"/>
												<ul menutree="${ menu }" id="menutree${ m5.numero }"><c:forEach items="${ m5.childs }" var="m6">
													<li menutree="${ menu }" title="${ m6.titulo }" id="node${ m6.numero }" nodeid="${ m6.numero }" parentid="${ m5.numero }" level="7"><a href="javascript: ">
														<span onmouseover="setEntry('${ m6.numero }', true )" >${ m6.titulo }</span></a>&nbsp;&nbsp;&nbsp;
														<img border=0 id="dots${ m6.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/properties.gif" onclick=" getProperties( ${ m6.numero } )"/>
														&nbsp;&nbsp;<img border=0 id="dels${ m6.numero }" class="dotimg" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick=" deleteNode( ${ m5.numero }, ${ m6.numero } )"/>
													</li>
												</c:forEach>
												<li menutree="${ menu }" noSiblings="true" noDrag="true" newEntry="true" title="Nova Entrada" id="node${ m5.numero }new" nodeid="0" parentid="${ m5.numero }" level="7"><a href="javascript: newEntry(${ m5.numero }, ${ menu })">Nova Entrada</a></li>
												</ul>
											</li>
										</c:forEach>
										<li menutree="${ menu }" noSiblings="true" noDrag="true" newEntry="true" title="Nova Entrada" id="node${ m4.numero }new" nodeid="0" parentid="${ m4.numero }" level="6"><a href="javascript: newEntry(${ m4.numero }, ${ menu })">Nova Entrada</a></li>
										</ul>
									</li>
								</c:forEach>
								<li menutree="${ menu }" noSiblings="true" noDrag="true" newEntry="true" title="Nova Entrada" id="node${ m3.numero }new" nodeid="0" parentid="${ m3.numero }" level="5"><a href="javascript: newEntry(${ m3.numero }, ${ menu })">Nova Entrada</a></li>
								</ul>
							</li>
						</c:forEach>
						<li menutree="${ menu }" noSiblings="true" noDrag="true" newEntry="true" title="Nova Entrada" id="node${ m2.numero }new" nodeid="0" parentid="${ m2.numero }" level="4"><a href="javascript: newEntry(${ m2.numero }, ${ menu })">Nova Entrada</a></li>
						</ul>
					</li>
				</c:forEach>
				<li menutree="${ menu }" noSiblings="true" noDrag="true" newEntry="true" title="Nova Entrada" id="node${ m1.numero }new" nodeid="0" parentid="${ m2.numero }" level="3"><a href="javascript: newEntry(${ m1.numero }, ${ menu })">Nova Entrada</a></li>
				</ul>
			</li>
		</c:forEach>
		<li menutree="${ menu }" noSiblings="true" noDrag="true" newEntry="true" title="Nova Entrada" id="node${ m0.numero }new" nodeid="0" parentid="${ m0.numero }" level="2"><a href="javascript: newEntry(${ m0.numero }, ${ menu })">Nova Entrada</a></li>
		</ul>
	</li>
</c:forEach>
<li menutree="${ menu }" noSiblings="true" newEntry="true" title="Nova Entrada" id="node${ menu }new" nodeid="0" parentid="${ menu }" level="1"><a href="javascript: newEntry(${ menu }, ${ menu })">Nova Entrada</a></li>
</ul>
<script type="text/javascript" language="JavaScript1.2">	
	treeObj${menu} = new JSDragDropTree();
	treeObj${menu}.setTreeId('menutree${menu}');
	treeObj${menu}.setImageFolder("${pageContext.request.contextPath}/backoffice/js/tree/images/");
	treeObj${menu}.setMaximumDepth(7);
	treeObj${menu}.setMessageMaximumDepthReached('Não pode descer mais níveis');
	treeObj${menu}.initTree();
	treeObj${menu}.setMoveDropFunction( moveMenu );
	treeObj${menu}.setReorderDropFunction( reorderMenu );
</script>
