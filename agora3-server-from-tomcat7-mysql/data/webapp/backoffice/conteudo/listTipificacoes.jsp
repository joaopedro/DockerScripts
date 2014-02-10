<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<script type="text/javascript" language="JavaScript">
	sendInfo = function(modo, valor, order, ascending)
	{
		if ( modo == 'p' )
			document.listConteudos.actpage.value = valor;
		if ( modo == 'o' )
			document.listConteudos.order.value = valor;
		if ( modo == 'i' )
			document.listConteudos.metodo.value = 'inactiva';
			
		document.listConteudos.order.value = order;	
		document.listConteudos.order.ascending = ascending;					
		ajaxSubmitGeneric( document.listConteudos, 'mainbody' );
	}
</script>
<h1>Tipificação: ${tipoConteudo.titulo}</h1>
<html:form action="/listConteudos" onsubmit="return false" method="post">
	<html:hidden property="codTipo"/>
	<html:hidden property="order"/>
	<html:hidden property="ascending"/>		
	<html:hidden property="metodo" value="display"/>
	Título: <html:text property="titulo" size="30"/>&nbsp;&nbsp;&nbsp;Linhas por Página: <html:text property="linhas" size="5" value="15"/>
	<html:radio property="showInactivos" value="false">Activos</html:radio>
	<html:radio property="showInactivos" value="true">Inactivos</html:radio>
	<html:hidden property="actpage" value="1"/>
	<html:submit value="Executar" styleClass="styledButton"
					 onmouseover="changeImage(this, 1);" 
    				 onmouseout="changeImage(this, 2);"
					onclick="ajaxSubmitGeneric( document.listConteudos, 'mainbody')"/><br>
	<input type="button" style="styledButton"
					 onmouseover="changeImage(this, 1);" 
    				 onmouseout="changeImage(this, 2);"
    				 onclick="location.href='editarConteudo.do2?codTipoConteudo=${tipoConteudo.numeroConteudo}'" value="Novo Registo">&nbsp;&nbsp;
    <input type="button" style="styledButton"
					 onmouseover="changeImage(this, 1);" 
    				 onmouseout="changeImage(this, 2);"
    				 onclick="sendInfo('i', 0, 'titulo', 'false')" value="Inactivar">
	<tiles:insert page="/backoffice/conteudo/listTipificacoesBody.jsp"/>
</html:form>
