<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<fmt:message key="ipdms.modules.entidade.nome" var="nome" />
<fmt:message key="ipdms.modules.entidade.nif" var="nif" />
<fmt:message key="ipdms.modules.entidade.criar" var="criar" />
<fmt:message key="ipdms.forms.filtrar" var="filtrar" />
<fmt:message key="ipdms.forms.filtrar.title" var="filtrarTitle" />
<fmt:message key="ipdms.modules.entidade.tipoentidade" var="tipoentidade" />
<fmt:message key="ipdms.modules.entidade.criarnova" var="criarnova" />


<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<LINK href='${THEMES_DIR}/forms.css' type=text/css rel=stylesheet />
<LINK href='${THEMES_DIR}/estilos.css' type=text/css rel=stylesheet />
<LINK href='${pageContext.request.contextPath}/ipdms/modules/entidade/theme/entidade.css' type=text/css rel=stylesheet />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<script src='${JS_DIR}/formFunctions.js' type="text/javascript"></script>
<script src='${JS_DIR}/utils.js' type="text/javascript"></script>
<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/ipdms/modules/entidade/js/entidadeutil.js" type="text/javascript" ></script>
<script src="${JS_DIR}/setInputValues.js" type="text/javascript"></script>


<body style="overflow: auto;">
<br/>
	<c:set var="popupParams" value="${sessionScope['ipdms_entidade_popupparams'].params}" />

	<form action="listEntidadeSimplePopup.do2" name="form" id="form" class="form">
		<input type="hidden" name="tipoEntidade" id="tipoEntidade" value="${popupParams.tipoEntidade}" />
		<input type="hidden" name="page" id="page" value="1" />

			<div class="alignLeft" >
    						<c:if test="${modEnt}">
    						<div class="left" style="padding-right:10px;">
    							<a href="${pageContext.request.contextPath}/editEntidadePopup.do2?saveAction=/saveEntidadePopup.do2"></a>
    								<img src="${pageContext.request.contextPath}/images/icon/icon-criarNovo.png" class="cursorMao" alt="Criar Nova Entidade" title="Criar Nova Entidade"/>
    						</div>
    						<div class="right" style="width:80%">
    							<div class="texto"><a href="${pageContext.request.contextPath}/editEntidadePopup.do2?window=${window}&saveAction=/saveEntidadePopup.do2?forwardto=okSimpleEntidade" >${criarnova}</a></div>
    						</div>
    						</c:if>
    					</div>

	<div style="padding-left:10px; padding-right:10px;">
					<div class="row formlabel_sf">
						<div class="leftTab label" style="width: 20%; " title="${nome}">
					  		<label for="nome">${nome}</label>
					  	</div>
					  	
					  	<div class="label" style="width: 76%;" title="${nome}">
					  		<input type="text" name="nome" id="nome" value="${param.nome}" size="50" maxlength="80"/>
					  	</div>
					</div>	
					
					<div class="row formlabel_sf">
						<div class="leftTab label" style="width: 20%; " title="${nif}">
					  		<label for="nif">${nif}</label>
					  	</div>
					  	
					  	<div class="label" style="width: 76%;" title="${nif}">
					  		<input type="text" name="nif" id="nif" size="15" maxlength="15" value="${param.nif}"/>
					  	</div>
					</div>
					
					<div class="buttonRow">
						<input type="submit" name="search" value="${filtrar}" class="btForm" title="${filtrarTitle}"/>
					</div>
		</div>			
	</form>
<c:set var="currentPage">
	<c:choose>
		<c:when test="${param.page !=null}">${param.page}</c:when>
		<c:otherwise>1</c:otherwise>
	</c:choose>
</c:set>
<display:table uid="entidades" name="${paginatedList}" htmlId="worklist" >
	<display:column title="${nome}"><a href="javascript:affectParentEntidadeValues('${entidades.id}','${fn:replace(entidades.nome,'\'','&lsquo;')}','${entidades.nif}');">${entidades.nome}</a></display:column>
	<display:column title="${nif}"><a href="javascript:affectParentEntidadeValues('${entidades.id}','${fn:replace(entidades.nome,'\'','&lsquo;')}','${entidades.nif}');">${entidades.nif}</a></display:column>
	<display:column title="${tipoentidade}"><a href="javascript:affectParentEntidadeValues('${entidades.id}','${fn:replace(entidades.nome,'\'','&lsquo;')}','${entidades.nif}');">${entidades.tipoEntidade}</a></display:column>
</display:table>
<br/><br/>

<c:set var="windowName" value="${sessionScope['ipdms_entidade_popupparams'].windowName}" />

<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.fechar" />" 
			onclick="parent.${windowName}.close();" title="<fmt:message key="ipdms.forms.fechar.title" />" />
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.reset"/>"
								onclick="affectParentEntidadeValues('','','','');" title="<fmt:message key="ipdms.forms.reset.title"/>" />
</div>
</body>
<script>
	affectParentEntidadeValues = function (idEntidade, nome, nif) {
		setInputValue(parent.document.getElementById('${popupParams.idEntidade}'), idEntidade);
		setInputValue(parent.document.getElementById('${popupParams.nomeEntidade}'), nome);
		setInputValue(parent.document.getElementById('${popupParams.nifEntidade}'), nif);

		parent.${windowName}.close();
	}
	
</script>