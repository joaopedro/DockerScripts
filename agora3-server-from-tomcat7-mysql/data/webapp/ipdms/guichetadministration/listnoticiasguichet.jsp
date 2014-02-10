<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.guichetadmin.noticia.list.headtitle" var="titulo" />
<fmt:message key="ipdms.guichetadmin.menuitem.list.eliminar.confirm" var="confirm" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/ConfirmCancel.js"></script>

<script type="text/javascript">
	//decisao for cancelar method for showing dialog
	function decisao(btn,val){
		if(btn=='yes'){
			deleteNoticias();
		}	
	}

	function deleteNoticias(){
		
		document.noticiaform.action = 'deleteNoticiaGuichet.do2';
		document.noticiaform.submit();
	}
	
	function editCreateNoticia(atr){
		
		document.noticiaform.action = 'editNoticiaGuichet.do2'+'?'+atr;
		document.noticiaform.submit();
	}

	function Checkboxes(state) {
    	$$('input[type="checkbox"]').each(function filter(item) {
        	        {
            	    item.checked=state
                	}
    	});
	}  
</script>
<script type="text/javascript">
	document.title = '${productName} - ${titulo}';
</script>
<form action="/listNoticiaGuichet" method="post" class="form"
	name="noticiaform" id="noticiaform">

	<div id="wrapper">
		<div id="content">
			<div class="row" style="padding-top: 0px; text-align: left;">
				<table border="0" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
						<tr>
							<td class="titulo1">${titulo}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="alignLeft">
				<div class="left" onclick="setActionAndSubmit($(noticiaform),'${pageContext.request.contextPath}/editNoticiaGuichet.do2');">
					<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" class="cursorMao" alt="<fmt:message key='ipdms.guichetadmin.noticia.list.criar' />" title="<fmt:message key='ipdms.guichetadmin.noticia.list.criar' />" />
				</div>
				<div class="right" onclick="setActionAndSubmit($(noticiaform),'${pageContext.request.contextPath}/editNoticiaGuichet.do2');">
					<div class="texto"><a href="#" title="<fmt:message key='ipdms.guichetadmin.noticia.list.criar' />"><fmt:message key='ipdms.guichetadmin.noticia.list.criar' /></a></div>
				</div>
			</div>

			<br/>
			<span class="formlabel_select">
				* Seleccionar: <a href="#"  class="formlabel_select" onclick="Checkboxes(true);">Todos</a>, <a href="#" class="formlabel_select" onclick="Checkboxes(false);"> Nenhum</a>
			</span>
			
			<br/>
			<div id="areaCentral">
				<p>
				<table border="0" cellpadding="0" cellspacing="0" class="centro"
					id="noticiaList" summary="Gestão de Itens de Menu">
					<tr>
						<th style="width: 20%" class="centro"><fmt:message
								key='ipdms.guichetadmin.noticia.list.titulo' /></th>
						<th style="width: 30%" class="centro"><fmt:message
								key='ipdms.guichetadmin.noticia.edit.subtitulo' /></th>
						<th style="width: 10%" class="alignCenter"><fmt:message
								key='ipdms.guichetadmin.noticia.list.datainicio' /></th>
						<th style="width: 10%" class="alignCenter"><fmt:message
								key='ipdms.guichetadmin.noticia.list.datafim' /></th>
						<th style="width: 5%" class="alignCenter"><fmt:message
								key='ipdms.guichetadmin.noticia.list.editar' /></th>
						<th style="width: 3%" class="alignCenter"><fmt:message
								key='ipdms.guichetadmin.noticia.list.eliminar' /></th>
					</tr>
					<tbody>
						<c:forEach items="${noticias}" var="menuItem" varStatus="index">
							<tr>
								<td class="centro"><span id="miID" style="display: none;">id=${menuItem.id}</span>
									<span style="cursor: pointer;">${menuItem.titulo}</span></td>
								<td class="centro"><span style="display: none;">menuItemId=${menuItem.id}</span>
									${menuItem.subtitulo}</td>
								<td class="centro"><span style="display: none;">menuItemId=${menuItem.id}</span>
									<fmt:formatDate value="${menuItem.dataInicio.time}"
										pattern="dd-MM-yyyy" /></td>
								<td class="centro"><span style="display: none;">menuItemId=${menuItem.id}</span>
									<fmt:formatDate value="${menuItem.dataFim.time}"
										pattern="dd-MM-yyyy" /></td>
								<td class="alignCenter"><img style="cursor: pointer;"
									onclick="editCreateNoticia('id=${menuItem.id}')"
									src="${pageContext.request.contextPath}/images/icon/icon-editar.png"
									class="cursorMao" alt="${editar}" title="${editar}"
									style="border:none" /></td>
								<td class="alignCenter"><label
									for="removeRow_${menuItem.id}"><input type="checkbox"
										name="removeRow_${menuItem.id}" id="removeRow_${menuItem.id}"
										value="${menuItem.id}" style="border: 0;" /></label></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div id="alignRight">
					<img
						src="${pageContext.request.contextPath}/images/icon/icon-lixo.png"
						onclick="cancelar(event,'<fmt:message key="ipdms.guichetadmin.noticia.list.eliminar.titulo"/>','<fmt:message key="ipdms.guichetadmin.noticia.list.eliminar.msg"/>',decisao,'${sim}','${nao}');" 
						title="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />"
						class="cursorMao"
						alt="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />"
						title="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />" />
				</div>

				</p>

			</div>
		</div>
	</div>
</form>