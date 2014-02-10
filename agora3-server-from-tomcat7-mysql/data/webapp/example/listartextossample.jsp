<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic" %>
<%@ taglib prefix="html" uri="/tags/html"  %>

<SCRIPT type="text/javascript">
function seleccionarEntidade(valor)
{
	// enviar dados para o pai
	opener.document.getElementById("retorno").value = valor;

	// fechar a janela
	window.close();
}
</SCRIPT>

<table width="100%" cellpadding="1" cellspacing="1" border="1">
	<tr onclick="seleccionarEntidade('Sample Text 1')" style="cursor: pointer;"><td>Sample Text 1</td></tr>
	<tr onclick="seleccionarEntidade('Sample Text 2')" style="cursor: pointer;"><td>Sample Text 2</td></tr>
	<tr onclick="seleccionarEntidade('Sample Text 3')" style="cursor: pointer;"><td>Sample Text 3</td></tr>
	<tr onclick="seleccionarEntidade('Sample Text 4')" style="cursor: pointer;"><td>Sample Text 4</td></tr>
	<tr onclick="seleccionarEntidade('Sample Text 5')" style="cursor: pointer;"><td>Sample Text 5</td></tr>
</table>
