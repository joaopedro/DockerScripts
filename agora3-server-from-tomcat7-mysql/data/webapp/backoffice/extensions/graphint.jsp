<%@page errorPage="/backoffice/errors/error.jsp" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript">
	function pesquisar() {
		MM_openBrWindow('pesquisarForm.do2?modo=onlyone','','width=800,height=500,menubar=yes,toolbar=yes,scrollbars=yes');
	}
	
	var numConteudo;
	var tituloConteudo;
	
	<c:if test='${not empty conteudoForm.extension}'>
		numConteudo    = ${conteudoForm.extension.root.value.numeroConteudo};
		tituloConteudo = '${conteudoForm.extension.root.value.titulo}';
	</c:if>
	
	
	function changeData( ) {
		var s = '';
		s += 'Conteúdo: ' + '' + tituloConteudo + '' + '<br/>';
        document.getElementById("itens").innerHTML = s;
        document.getElementById("aviso").innerHTML = '&nbsp;';
        document.forms[0].elements['numeroConteudoRoot'].value = numConteudo;
    }
	
	function usevalues(  ) {
		numConteudo = valor;
		tituloConteudo = descritivo;
		changeData();
	}
</script>

<table width="70%" cellspacing="0" cellpadding="3" class="table">
	<c:choose>
		<c:when test="${empty conteudoForm.extension}">
			<span id="aviso" class="texto"><strong>Sem root definida.</strong></span><br/>
			<span class="texto">Para escolher a root do grafo, clique em "Pesquisar" e seleccione o conteúdo que pretender associar.</span><br/>
			<span class="texto" id="itens">&nbsp;</span>
		</c:when>
		<c:otherwise>
			<span class="texto">Para escolher a root do grafo, clique em "Pesquisar" e seleccione o conteúdo que pretender associar.</span><br/>
			<span class="texto" id="itens">Conteúdo: ${conteudoForm.extension.root.value.titulo}</span>
		</c:otherwise>
	</c:choose>
	<html:hidden property="numeroConteudoRoot" value="${conteudoForm.extension.root.value.numeroConteudo}"/>
</table><br/>
<html:button property="click" onclick="pesquisar()" styleClass="styledButton">Pesquisar</html:button>