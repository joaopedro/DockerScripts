<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<link href='${pageContext.request.contextPath}/backoffice/themes/pc-ie.css' rel="stylesheet" type="text/css" />
<link href='${pageContext.request.contextPath}/backoffice/themes/estilos.css' rel="stylesheet" type="text/css" />
<link href='${pageContext.request.contextPath}/backoffice/themes/sinfic.css' rel="stylesheet" type="text/css" />
<link href='${pageContext.request.contextPath}/backoffice/themes/tabs.css' rel="stylesheet" type="text/css" />		
<script language="JavaScript" src='${pageContext.request.contextPath}/backoffice/js/scripts.js'></script>
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/kcms.js'></script>		
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/codethat/codethatsdk.js'></script>
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/codethat/codethatgridpro.js'></script>
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/codethat/codethattype.js'></script>
<script language="Javascript" src='${pageContext.request.contextPath}/backoffice/js/prototype.js'></script>
<script language="Javascript">
	function choosenumero( numero, texto )
		{
		var caller = '${param.codigo}';
		
		opener.document.getElementById( 'dado' + caller ).value = numero;
		texto = '<span id="link ' + caller + '"><a href="../displayconteudo.do2?numero=' + numero + '" target="_blank">' + texto + '</a></span>';
		opener.document.getElementById( 'link' + caller ).innerHTML = texto;
		window.close();
		}
		
	function createlista( valor )
		{
		var url = 'choosecontentdet.do2';
		var pars = 'numero=' + valor.value;

		var myAjax = new Ajax.Updater( 'listaconts',
			url,
			{
				method: 'get',
				parameters: pars,
				evalScripts:true
			});
		}
</script>
<h1>Escolha de conteúdo</h1>
<select name="dados" size="1" onchange=" createlista( this ); ">
	<option value="0">Escolha a tipificação</option>
	<logic:iterate name="listacont" id="entry">
		<option value="${entry.numeroConteudo}">${entry.titulo}</option>
	</logic:iterate>
</select>
<div id="listaconts"></div>