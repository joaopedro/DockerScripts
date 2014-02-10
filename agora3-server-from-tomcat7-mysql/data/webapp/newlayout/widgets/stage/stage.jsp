<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section id="TwoCol">
	<div class="Heading_h1">${etapa.titulo} ${process.servicoOnline.idProcessoEntidade}</div>
	<aside class="Column">
		<div class="Main">
			<div class="Heading">
				<h2 style="font-size: 1em;">Resumo do Processo</h2>
			</div>
			<div class="Content">
				<p><fmt:message key='ipdms.notification.header.numprocesso' /> ${process.servicoOnline.idProcessoEntidade}</p>
				<p><fmt:message key='ipdms.notification.header.tipoprocesso' /> ${process.servicoOnline.variante.titulo}</p>
				<c:if test="${not empty entidade}">
					<p><fmt:message key="ipdms.notification.header.entidade" /> ${entidade.nome}</p>
				</c:if>
				<p><fmt:message key='ipdms.notification.header.dataentrada' /> <fmt:formatDate value="${process.servicoOnline.dataPreenchimento.time}" pattern="dd/MM/yyyy HH:mm" /></p>
				<p><fmt:message key='ipdms.notification.header.assunto' /> ${process.servicoOnline.assunto}</p>
				<p<fmt:message key="ipdms.notification.header.priority" /> <fmt:message key="${process.servicoOnline.priority.resourceKey}"/></p>
			</div>
		</div>
	</aside>
</section>
