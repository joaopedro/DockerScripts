<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <form name="dadosest" action="changeestruturadata.do2" method="post">
 <input type="hidden" name="metodo" value="save">
 <script type="text/javascript">
	novalinha = function( tabela, template )
	{
		tabela = $( tabela );
		var tr = tabela.insertRow( tabela.rows.length-1 );
		var te = $(template);
		var maxordem = $('maxordem').value * 1 + 1;
		$('maxordem').value = maxordem; 
		tr.id = 'linha' + maxordem;
		for (var i = 0; i < te.cells.length; i++ )
			{
			var cell = tr.insertCell( i );
			var s = te.cells[i].innerHTML;
			while ( s.indexOf( 'Template' ) >= 0 )
				s = s.substring( 0, s.indexOf( 'Template' ) ) + maxordem + s.substring( 1 + s.indexOf( 'Template' ) + 7 );
			cell.innerHTML = s;
			}
	}

	removerlinha = function( n )
	{
		var id = 'linha' + n;
		var tabela = $( 'tabelacampos' );
		for ( var i = 0; i < tabela.rows.length; i++ )
			if ( tabela.rows[i].id == id )
				{
				tabela.deleteRow( i );
				break;
				}
	}

	submitcampos = function ()
	{
		if ( isBlank( document.dadosest.nome.value ) )
			{
			alert( 'Deve preencher o nome da estrutura de dados' );
			document.dadosest.nome.focus();
			return false;
			}
		for( i = 1; i <= ($('maxordem').value * 1); i++ )
			{
			if ( $( 'nome' + i ) == null )
				continue;
			if ( isBlank( $( 'nome' + i ).value ) )
				{
				alert( 'Deve preencher o nome do campo' );
				$( 'nome' + i ).focus();
				return false;
				}
			if ( isBlank( $( 'rotulo' + i ).value ) )
				{
				alert( 'Deve preencher o rótulo do campo' );
				$( 'rotulo' + i ).focus();
				return false;
				}
			if ( $( 'tipo' + i ).value == 'ST' && isBlank( $( 'tamanho' + i ).value ) )
				{
				alert( 'Deve preencher o tamanho do campo' );
				$( 'tamanho' + i ).focus();
				return false;
				}
			if ( $( 'tipo' + i ).value == 'CL' && $( 'lista' + i ).value == '0' )
				{
				alert( 'Deve preencher a lista de escolha' );
				$( 'lista' + i ).focus();
				return false;
				}
			}
		ajaxSubmitGeneric( document.dadosest, 'workarea' );
	}
</script>
 <table border="1">
 	<tr><th colspan="3" style="text-align: right"><img style="cursor: hand" src="${pageContext.request.contextPath}/backoffice/images/cross.png" onclick="cleardivs('estruturacampos')"></th></tr>
 	<tr>
 		<td width="90">Nome *</td>
 		<td width="100"><input type="text" name="nome" value="${ estdata.nome }" size="60" maxlength="255"><input type="hidden" name="nestrutura" value="${ nestrutura }"></td>
 	</tr>
 	<tr>
 		<td width="90">Nome Fisíco</td>
 		<td width="100"><input type="text" name="nomefisico" value="${ estdata.tabelaFisica }"></td>
 	</tr>
 	<tr>
 		<td width="90">Validador</td>
 		<td width="100"><input type="text" name="validator" value="${ estdata.validator }"></td>
 	</tr>
 	<tr>
 		<th colspan="3">Campos</th>
 	</tr>
 	<tr>
 		<td colspan="3">
 			<table border="1" id="tabelacampos">
 				<tr><th>Nome *</th><th>Nome Físico</th><th>Rótulo *</th><th>Tipo</th><th>Tamanho</th><th>Máscara</th><th>Lista de Escolha</th><th>Nulos</th><th>Esc.</th><th>Sel.</th><th>Validador</th><th>Acção</th></tr>
 				<tr id="linhatemplate" style="display: none; visibility: hidden;">
 					<td><input type="text" name="nomeTemplate" id="nomeTemplate" value="" maxlength="255"></td>
 					<td><input type="text" name="nomeFisicoTemplate" id="nomeFisicoTemplate" value="" maxlength="255"></td>
 					<td><input type="text" name="rotuloTemplate" id="rotuloTemplate" value="" maxlength="255"></td>
 					<td><select name="tipoTemplate" id="tipoTemplate" size="1">
						<c:forEach var="tipo" items="${ tipos }">
							<option value="${ tipo.codigo }">${ tipo.descricao }</option>
						</c:forEach>
 						</select></td>
 					<td><input type="text" name="tamanhoTemplate" id="tamanhoTemplate" value="" size="4" maxlength="4"></td>
 					<td><input type="text" name="mascaraTemplate" id="mascaraTemplate" value="" maxlength="255"></td>
 					<td><select name="listaTemplate" id="listaTemplate" size="1">
 							<option value="0">Escolha a Lista</option>
 							<c:forEach var="tipoc" items="${tipificacoes}">
								<option value="${ tipoc.numeroConteudo }">${ tipoc.titulo }</option>
 							</c:forEach>
 						</select></td>
 					<td><input type="checkbox" name="nulosTemplate" id="nulosTemplate" value="S"></td>
 					<td><input type="checkbox" name="escondidoTemplate" id="escondidoTemplate" value="S"></td>
 					<td><input type="checkbox" name="selecionavelTemplate" id="selecionavelTemplate" value="S"></td>
 					<td><input type="text" name="validatorTemplate" id="validatorTemplate" value="" maxlength="255"></td>
 					<td><a href="javascript: removerlinha(Template)">remover</a></td>
 				</tr>
 				<c:forEach var="est" items="${ estdata.linhas }">
					<tr id="linha${ est.ordem }">
						<td><input type="text" name="nome${ est.ordem }" id="nome${ est.ordem }" value="${ est.nome }" maxlength="255"></td>
						<td><input type="text" name="nomeFisico${ est.ordem }" id="nomeFisico${ est.ordem }" value="${ est.colunaFisica }" maxlength="255"></td>
						<td><input type="text" name="rotulo${ est.ordem }" id="rotulo${ est.ordem }" value="${ est.rotulo }" maxlength="255"></td>
						<td><select name="tipo${ est.ordem }" id="tipo${ est.ordem }" size="1">
							<c:forEach var="tipo" items="${tipos}">
								<option value="${ tipo.codigo }" <c:if test="${ tipo.codigo == est.tipo }">selected</c:if> >${ tipo.descricao }</option>
							</c:forEach>
							</select></td>
						<td><input type="text" name="tamanho${ est.ordem }" id="tamanho${ est.ordem }" value="${ est.tamanho }" size="4" maxlength="4"></td>
						<td><input type="text" name="mascara${ est.ordem }" id="mascara${ est.ordem }" value="${ est.mascara }" maxlength="255"></td>
						<td><select name="lista${ est.ordem }" id="lista${ est.ordem }" size="1">
								<option value="0">Escolha a Lista</option>
								<c:forEach var="tipoc" items="${tipificacoes}">
									<option value="${ tipoc.numeroConteudo }" <c:if test="${ tipoc.numeroConteudo == est.numeroLista }">selected</c:if> >${ tipoc.titulo }</option>
								</c:forEach>
							</select></td>
	 					<td><input type="checkbox" name="nulos${ est.ordem }" id="nulos${ est.ordem }" value="S" <c:if test="${est.nulos == 'S'}">checked</c:if> ></td>
	 					<td><input type="checkbox" name="escondido${ est.ordem }" id="escondido${ est.ordem }" value="S" <c:if test="${est.escondido == 'S'}">checked</c:if> ></td>
	 					<td><input type="checkbox" name="selecionavel${ est.ordem }" id="selecionavel${ est.ordem }" value="S" <c:if test="${est.selecionavel == 'S'}">checked</c:if> ></td>
						<td><input type="text" name="validator${ est.ordem }" id="validator${ est.ordem }" value="${ est.validator }" maxlength="255"></td>
						<td><a href="javascript: removerlinha(${ est.ordem })">remover</a></td>
					</tr>
 				</c:forEach>
 				<tr>
 					<td colspan="9"><a href="javascript: novalinha( 'tabelacampos', 'linhatemplate' )">Novo Campo</a></td>
 				</tr>
 			</table>
 		</td>
 	</tr>
 	<tr>
 		<td colspan="3">&nbsp;</td>
 	</tr>
 	<tr>
 		<td colspan="3"><input type="hidden" name="maxordem" id="maxordem" value="${ maxordem }"><input type="button" value="Submeter" onclick="submitcampos()"></td>
 	</tr>
 </table>
 </form>