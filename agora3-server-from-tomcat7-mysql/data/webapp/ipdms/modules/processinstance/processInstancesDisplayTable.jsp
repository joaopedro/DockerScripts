<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>
<%@ taglib uri="http://ajaxtags.org/tags/ajax" prefix="ajax" %>

<fmt:message key="ipdms.processo.imagemWorkflow" var="imagemWorkflow" />
<fmt:message key="ipdms.modules.processinstance.numProc" var="numProc" />
<fmt:message key="ipdms.modules.processinstance.tipoProcesso" var="tipoProcesso" />
<fmt:message key="ipdms.modules.processinstance.owner" var="owner" />
<fmt:message key="ipdms.modules.processinstance.dataInicial" var="dataInicial" />
<fmt:message key="ipdms.modules.processinstance.dataTerminus" var="dataTerminus" />
<fmt:message key="ipdms.modules.processinstance.manipularInstancia" var="manipularInstancia" />

<c:set var="CONTEXT_PATH" value="${pageContext.request.contextPath}" />

<script type="text/javascript">

	//loads an image, showing it in a window Ext
	function carregaImagem(title, action){
	    var titulo = '${imagemWorkflow} ' + title;
	    ExtWindowSizeParam(titulo,action,'','html',700,600);    
	}

</script>


<ajax:displayTag id="instancesDisplayTag" baseUrl="${CONTEXT_PATH}/listInstances.do2">

	<display:table id="servicoOnline" name="${paginatedList}" htmlId="worklist" requestURI="">
		<c:set var="numProcesso" value="${servicoOnline.idProcessoEntidade}" />
		
		<display:column title="${numProc}" style="width:10%" class="clickableDisplayColumn">${numProcesso}</display:column>
		<display:column title="${tipoProcesso}" style="width:20%" class="clickableDisplayColumn">
				${servicoOnline.variante.titulo}
		</display:column>
		<display:column title="${owner}" style="width:10%"> 
			${servicoOnline.colaboradorOwner.login}
		</display:column>
		<display:column title="${dataInicial}" style="width:15%"> 
			<fmt:formatDate value="${servicoOnline.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
		</display:column>
		<display:column title="${dataTerminus}" style="width:35%"> 
			<fmt:formatDate value="${servicoOnline.dataTerminus.time}" pattern="dd-MM-yyyy HH:mm"/>
		</display:column>
		<display:column  title="${manipularInstancia}" style="width:10%; text-align:center;" class="clickableDisplayColumn">
			<a href="${CONTEXT_PATH}/manipulateInstance.do2?method=prepare&numero=${servicoOnline.numeroConteudo}">
				<img alt="${manipularInstancia} ${numProcesso}" title="${manipularInstancia} ${numProcesso}" 
					src="${CONTEXT_PATH}/images/icon/icon-editar.png">
			</a>					
		</display:column>
	</display:table>
	

</ajax:displayTag>

