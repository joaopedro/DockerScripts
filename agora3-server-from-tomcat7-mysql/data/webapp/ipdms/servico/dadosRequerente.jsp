<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.processo.processopai.consultar" var="consultarProcessoPai" />
<fmt:message key="ipdms.processo.subprocesso.consultar" var="consultarSubprocesso" />

<c:set var="isSubProcesso" value="${not empty conteudo.processoPai}" />
<c:set var="servico" value="${conteudo}" />
<c:if test="${isSubProcesso}">
	<c:set var="servicoPai" value="${conteudo.processoPai}" />
</c:if>

<%-- Link para os dados do processo pai, caso ele exista --%>
<c:if test="${isSubProcesso}">
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 4%;" title="${consultarProcessoPai}">
	  		<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${servicoPai.numeroConteudo}&urlAnterior=${urlAnterior}" style="text-decoration:none;">
				<img src="${pageContext.request.contextPath}/images/icon/icon-setacima.png"  class="cursorMao" alt="${consultarProcessoPai}" title="${consultarProcessoPai}" />
			</a>
	  	</div>
	  	
	  	<c:set var="soEntidadeNome" value="" />
	  	<c:if test="${not empty servicoPai.entidades}">
	  		<c:forEach var="soEntidade" items="${servicoPai.entidades}">
				<c:set var="soEntidadeNome" value="${soEntidade.id.entidade.nome}" />			
			</c:forEach>		
	  	</c:if>
	  		  	
	  	<div class="label" style="width: 94%; margin-top:8px; margin-bottom:10px; " title="${consultarProcessoPai}">
	  		<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${servicoPai.numeroConteudo}&urlAnterior=${urlAnterior}" class="iconeLink">
				<fmt:message key="ipdms.processo.processopai.link">
					<fmt:param value="${servicoPai.variante.titulo}" />
					<fmt:param value="${servicoPai.idProcessoEntidade}" />
					<fmt:param value="${servicoPai.assunto}" />
					<fmt:param value="${soEntidadeNome}" />
					<fmt:param>
						<fmt:formatDate value="${servicoPai.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
					</fmt:param>
				</fmt:message>				
			</a>
	  	</div> 
	</div>
</c:if>

<c:if test="${not empty conteudo.filhos}">
<c:forEach items="${conteudo.filhos}" var="subProcesso">
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 4%;" title="${consultarSubprocesso}">
	  		<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${subProcesso.numeroConteudo}&urlAnterior=${urlAnterior}" style="text-decoration:none; ">
				<img src="${pageContext.request.contextPath}/images/icon/icon-setabaixo.png" class="cursorMao" alt="${consultarSubprocesso}" title="${consultarSubprocesso}" />
			</a>
	  	</div>
	  	<c:set var="soFilhoEntidadeNome" value="" />
	  	<c:if test="${not empty subProcesso.entidades}">
	  		<c:forEach var="soFilhoEntidade" items="${subProcesso.entidades}">
				<c:set var="soFilhoEntidadeNome" value="${soFilhoEntidade.id.entidade.nome}" />			
			</c:forEach>		
	  	</c:if>	  	
	  	<div class="label" style="width: 94%; margin-top:8px;" title="${consultarSubprocesso}">
	  		<a href="${pageContext.request.contextPath}/displayconteudo.do2?numero=${subProcesso.numeroConteudo}&urlAnterior=${urlAnterior}" class="iconeLink">
				<fmt:message key="ipdms.processo.subprocesso.link">
					<fmt:param value="${subProcesso.variante.titulo}" />
					<fmt:param value="${subProcesso.idProcessoEntidade}" />
					<fmt:param value="${subProcesso.assunto}" />
					<fmt:param value="${soFilhoEntidadeNome}" />
					<fmt:param>
						<fmt:formatDate value="${subProcesso.dataPreenchimento.time}" pattern="dd-MM-yyyy HH:mm"/>
					</fmt:param>
				</fmt:message>				
			</a>
	  	</div>  	
	</div>
</c:forEach>
</c:if>


<table width="100%" cellpadding="0" style="border:none;" >
	<tr><td><div id="resumoProceso"></div></td></tr>
</table>
<script>
	new Ajax.Updater( {success: 'resumoProceso'}, '${pageContext.request.contextPath}/gerarresumo.do2?numero=${servico.numeroConteudo}', {method: 'get' , evalScripts: true} );
</script>