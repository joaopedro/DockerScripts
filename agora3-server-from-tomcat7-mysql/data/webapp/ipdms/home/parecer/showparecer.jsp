<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:message key="ipdms.tarefas.assinar.consultarFicheiro" var="consultarFicheiro" />

<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/estilos.css' />
<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/forms.css'  />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.processo.detalhe.criadoPor" />:</span>
	</div>
	<div class="textoCinza" style="width:65%;">		
			${parecer.autor.titulo}			
	</div>
</div>	
<br />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.destinatario' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.destinatario" />:</span>
	</div>
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.destinatario' />">
		${parecer.destinatario.titulo}							
	</div>
</div>
<br />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.assunto' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.criar.assunto" />:</span>
	</div>	
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.assunto' />">
		${parecer.assunto}
	</div>
</div>	
<br />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.mensagem' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.criar.mensagem" />:</span>
	</div>	
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.criar.mensagem' />">
		${parecer.mensagem}
	</div>
</div>	
<br />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.processo.pedido.dataenvio' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.processo.pedido.dataenvio" />:</span>
	</div>	
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.processo.pedido.dataenvio' />">
		<fmt:formatDate value="${parecer.dataCriacao.time}" pattern="dd-MM-yyyy" />
	</div>
</div>
<br />
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.etapaProcesso.detalhe.dataTomeiConhecimento' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.etapaProcesso.detalhe.dataTomeiConhecimento" />:</span>
	</div>	
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.etapaProcesso.detalhe.dataTomeiConhecimento' />">
		<fmt:formatDate value="${parecer.dataResposta.time}" pattern="dd-MM-yyyy" />
	</div>
</div>
<br />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.parecer' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.consultar.detalhe.parecer" />:</span>
	</div>
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.consultar.detalhe.parecer' />">
		${parecer.respostaParecer}
	</div>
</div>
<br />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.processo.pedido.anexos' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.processo.pedido.anexos" />:</span>
	</div>
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.processo.pedido.anexos' />">
		<c:if test="${not empty parecer.documentos}">
			<c:forEach var="documento" items="${parecer.documentos}">
				${documento.designacao}
				<c:set var="url" value="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" />
				<a href="${url}" class="formfield" title="${consultarFicheiro}" target="_blank">${documento.filename}</a>
				<br/>				
			</c:forEach>			
		</c:if>		
		<c:if test="${empty parecer.documentos}">
			<fmt:message key="ipdms.comunicacaoparecer.processo.pedido.noRecordsFound" />
		</c:if>
	</div>
</div>
<br />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.comunicacaoparecer.processo.historico.anexos' />">
		<span class="textoBold"><fmt:message key="ipdms.comunicacaoparecer.processo.historico.anexos" />:</span>
	</div>
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.comunicacaoparecer.processo.historico.anexos' />">
		<c:if test="${not empty parecer.docsRespostaParecer}">
			<c:forEach var="documento" items="${parecer.docsRespostaParecer}">
				${documento.designacao}
				<c:set var="url" value="${pageContext.request.contextPath}/file/getDocumento.do2?nc=${documento.numeroConteudo}" />
				<a href="${url}" class="formfield" title="${consultarFicheiro}" target="_blank">${documento.filename}</a>
				<br/>	
			</c:forEach>
		</c:if>
		<c:if test="${empty parecer.docsRespostaParecer}">
			<fmt:message key="ipdms.comunicacaoparecer.processo.historico.noRecordsFound" />
		</c:if>	
	</div>
</div>

