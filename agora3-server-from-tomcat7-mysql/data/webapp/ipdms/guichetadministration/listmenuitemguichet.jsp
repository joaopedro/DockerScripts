<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.guichetadmin.menuitem.titulo" var="titulo" />
<fmt:message key="ipdms.guichetadmin.menuitem.list.eliminar.confirm" var="confirm" />

<script type="text/javascript">
	function go_there(varArg, titulo)
	{
		var where_to= confirm("${confirm}");
		if (where_to){	
			document.menuform.action='deleteMenuItemGuichet.do2';
			document.menuform.submit();
		}
	}

	
	var rules = {
			'#menuItemList tbody tr td[class="centro"]' : function (el) {
				el.onclick = function(event){
					var queryString = '';
					
					var spans = this.parentNode.getElementsByTagName('span');
					for(var i in spans) {						
						if (spans[i].id && spans[i].id == 'miID') {
							queryString = spans[i].innerHTML.split(',').join('&');							
						}
					}
										
					//var spanElement = this.select('span');
					//if(spanElement.first()) {
					//	queryString += spanElement.first().innerHTML.split(',').join('&');
					//}
					
					window.location.href= 'editMenuItemGuichet.do2?' + queryString;
				};
			}
		};
		Behaviour.register(rules);
</script>
<script type="text/javascript">	
	document.title = '${productName} - ${titulo}';	 
</script>
<form action="/listMenuItemGuichet" method="post" class="form" name="menuform" id="menuform">

<div id="wrapper">
		<div id="content">
			<div class="row" style="padding-top:0px; text-align:left;">
				<table border="0" cellpadding="0" cellspacing="0" class="headings">
					<tbody>
		  				<tr>
		    				<td class="titulo1">${titulo}</td>
		  				</tr>	
					</tbody>
				</table>					
			</div>
			<div class="row formlabel_sf" >
               <div class="texto" style="margin-left:15px; width: 97%;">
               		<a href="#" onclick="setActionAndSubmit($(menuform),'${pageContext.request.contextPath}/editMenuItemGuichet.do2?tipo=instrucao');" title="<fmt:message key='ipdms.guichetadmin.menuitem.list.instrucao.novo' />"><fmt:message key='ipdms.guichetadmin.menuitem.list.instrucao.novo' /></a>
               		&nbsp;
               		<a href="#" onclick="setActionAndSubmit($(menuform),'${pageContext.request.contextPath}/editMenuItemGuichet.do2?tipo=link');" title="<fmt:message key='ipdms.guichetadmin.menuitem.list.link.novo' />"><fmt:message key='ipdms.guichetadmin.menuitem.list.link.novo' /></a>&nbsp;
               		<a href="#" onclick="setActionAndSubmit($(menuform),'${pageContext.request.contextPath}/editMenuItemGuichet.do2?tipo=informacao');" title="<fmt:message key='ipdms.guichetadmin.menuitem.list.informacao.novo' />"><fmt:message key='ipdms.guichetadmin.menuitem.list.informacao.novo' /></a>
                </div>
            </div>
			<br />
			<div id="areaCentral">	
			<p>			
				<table border="0" cellpadding="0" cellspacing="0" class="centro" id="menuItemList" summary="Gestão de Itens de Menu">  
				<tr>
				      	<th class="centro"><fmt:message key='ipdms.guichetadmin.menuitem.list.menu' /></th>
						<th style="width:20%" class="centro"><fmt:message key='ipdms.guichetadmin.menuitem.list.item' /></th>
						<th style="width:7%" class="centro"><fmt:message key='ipdms.guichetadmin.menuitem.list.tipo' /></th>
						<th style="width:7%" class="centro"><fmt:message key='ipdms.guichetadmin.menuitem.list.ordem' /></th>
						<th style="width:5%" class="alignCenter"><fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' /></th>
				</tr>
			    <tbody>
				<c:forEach items="${menuItemList}" var="menuItem" varStatus="index">
				<tr  style="cursor: pointer;">
				  	<td class="centro" >
				  		<span id="miID" style="display:none;">menuItemId=${menuItem.id}</span>
				 		<span style="cursor: pointer;">${menuItem.menuSuperior.titulo}</span>
				 	</td>
					<td class="centro">
					<span style="display:none;">menuItemId=${menuItem.id}</span>
				 		${menuItem.descricaoCurta}
				 	</td>
				 	<td class="centro">
					<span style="display:none;">menuItemId=${menuItem.id}</span>
				 		${menuItem.tipo}
				 	</td>
					<td class="centro">
					<span style="display:none;">menuItemId=${menuItem.id}</span>
				 		${menuItem.ordem}
				 	</td>
				  	<td class="alignCenter">
				  		<label for="removeRow_${menuItem.id}"><input type="checkbox" name="removeRow_${menuItem.id}" id="removeRow_${menuItem.id}" value="${menuItem.id}" style="border:0;"/></label>
				  	</td>
				</tr>
				</c:forEach>
			   	</tbody>   		
			</table>
			<div id="alignRight">
					<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" onclick="go_there();" class="cursorMao" alt="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />" title="<fmt:message key='ipdms.guichetadmin.menuitem.list.eliminar' />" />
			</div>
			
		</p>

		</div>
	</div>
</div>
</form>