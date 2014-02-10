<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@page errorPage="/backoffice/errors/error.jsp" %>

<script language="JavaScript">
	function pesquisar()
	{
		MM_openBrWindow('pesquisarForm.do2?modo=relat','','width=800,height=500,menubar=yes,toolbar=yes,scrollbars=yes');
	}
	
	var nItens = 0;
	var nItens2 = 0;
	var arrOld = new Array();
	var arrNew = new Array();
	
	<logic:iterate id="crelacionamento" name="currentcontent" property="relacionamentos" indexId="index">
		arrOld[${index}] = new Object();
		arrOld[${index}].Id = ${crelacionamento.codigo};
		arrOld[${index}].Titulo = '${crelacionamento.titulo}';
		nItens ++;
	</logic:iterate>


	function changeData( )
	{
		var s = '';
		var i=0;

		s += '<table  width="100%" border="0" cellspacing="0" cellpadding="0">';
		for( i = 0; i < nItens2; i++ )
		{
			var color = 'white';
			if( i % 2 == 0 )
				color = 'whitesmoke';
			if ( arrNew[ i ].Id > 0 )
			{
				s += '<tr bgcolor="' + color + '">';
	            s += '  <td width="50">&nbsp;&nbsp;&nbsp;&nbsp;'
	            s += ' <input type="checkbox" name="relacionamento[' + i + ']" id="ck' + i + '" checked="checked" value="'+ arrNew[ i ].Id +'"/></td>';
 	            s += '  <td class="texto"><label for="ck' + i + '" style="cursor: hand">' + arrNew[ i ].Titulo + '</label></td>';
  	            s += '</tr>';
  	        }
		}
        s += '</table>';
        var itens = document.getElementById("itens");
        itens.innerHTML = s;
    }
	arrNew.concat( arrOld );
	nItens2 = nItens;

	function usevalues(  )
	{
		var numItens = window.numItens;
		var arr = window.relacionados;
		var i;
		var j=0;

		arrNew = new Array();
		for ( i = 0; i < nItens; i++ )
			arrNew[ j++ ] = arrOld[ i ];
		for ( i = 0; i < numItens; i++ )
			arrNew[ j++ ] = arr[ i ];
		nItens2 = nItens + numItens;
		changeData();
	}
	
	function goTo(path)
	{
		window.location.href = path;
	}
</script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td class="titulos" height="35" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.relacionamentos.titulo.label" locale="locale"/>
            </td>
        </tr>
        <tr>
            <td class="texto" height="50" colspan="2">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<input name="pesquisar" 
            		   type="button" 
            		   value="<bean:message key="kcms.botao.pesquisar.label" locale="locale"/>" 
            		   onmouseover="changeImage(this, 1);" 
            		   onmouseout="changeImage(this, 2);" 
            		   onclick="javascript: window.pesquisar(); " 
            		   class="styledButton"
            	/>
            </td>
        </tr>
        <tr>
            <td class="frasetitulo" colspan="2">
            	&nbsp;&nbsp;&nbsp;&nbsp;
            	<span id="itens">&nbsp;</span>
            </td>
        </tr>
    </tbody>
</table>
<script language="JavaScript">
		window.relacionados = new Array();
		window.numItens = 0;
		usevalues();
</script>

