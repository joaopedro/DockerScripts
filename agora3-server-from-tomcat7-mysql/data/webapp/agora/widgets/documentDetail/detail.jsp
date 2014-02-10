<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<section id="TwoCol">
	<div class="Heading_h1">${document.number} ${document.process}</div>
	<aside class="Column">
		<div class="Main">
			<div class="Heading">
				<h2 style="font-size: 1em;">Resumo do Documento</h2>
			</div>
			<div class="Content">
				<p>Numero: ${document.number}</p>
				<p>Titulo: ${document.name}</p>
				<p>Processo: ${document.process}</p>
				<p>Numero de Processo: ${document.processNumber}</p>
				<p>Data de Criação: <fmt:formatDate value="${document.creation.time}" pattern="dd-MM-yyyy hh:mm:ss"/></p>
				<p>Criador: ${document.creatorName}</p>
			</div>
		</div>
	</aside>
</section>

