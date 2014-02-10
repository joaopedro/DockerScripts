<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%-- 
	coluna a coluna da seccao.
	seccao é a seccao onde o artigo está inserido.
	artigo o artigo a tratar
--%>




<c:set var="fieldNamePrefix">extension.colunas[${statusColuna.index}].seccoes[${statusSeccao.index}].artigos[${statusArtigo.index}]</c:set>
<INPUT type="button" value="?" alt="Escolher artigo para esta secção" id="${fieldNamePrefix}.btn"
		onclick="choosevalue( '${fieldNamePrefix}.numeroConteudo', this, $('${fieldNamePrefix}_desc'))" 
		onmouseover="changeImage(this, 1);"
		onmouseout="changeImage(this, 2);" class="styledbutton" />&nbsp; 
<INPUT type="button" value="X" alt="Apagar artigo"
		onclick="limparArtigo( this.form, '${fieldNamePrefix}');"
		onmouseover="changeImage(this, 1);" 
		onmouseout="changeImage(this, 2);" class="styledbutton" />&nbsp; 
			
[<span id="${fieldNamePrefix}_desc" class="titleBlueTexto"><c:choose>
	<c:when test="${not empty artigo}">
		${artigo.titulo}
	</c:when>
	<c:otherwise>
		Selecione um artigo
	</c:otherwise>
</c:choose></span>]<html:hidden property="${fieldNamePrefix}.numeroConteudo" styleId="${fieldNamePrefix}.numeroConteudo"/>
<html:hidden property="${fieldNamePrefix}.ordem" />
<fieldset>
	<legend>Usa imagem: <html:checkbox property="${fieldNamePrefix}.mostraImagem" value="true" onclick="document.forms['conteudoForm'].elements['${fieldNamePrefix}.posicaoImagem'][0].disabled = document.forms['conteudoForm'].elements['${fieldNamePrefix}.posicaoImagem'][1].disabled = !this.checked;" /></legend>
	Alinhamento : 
	<html:radio property="${fieldNamePrefix}.posicaoImagem" value="E" /> Esquerda
	<html:radio property="${fieldNamePrefix}.posicaoImagem" value="D" /> Direita
</fieldset>
