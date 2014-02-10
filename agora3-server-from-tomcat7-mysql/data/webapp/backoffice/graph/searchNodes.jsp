<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>

<title>Pesquisa de Nós</title>

<link href="${pageContext.request.contextPath}/backoffice/themes/pc-ie.css" rel="stylesheet" type="text/css">
<link href='${pageContext.request.contextPath}/backoffice/themes/sinfic.css' rel="stylesheet" type="text/css">
<link href='${pageContext.request.contextPath}/backoffice/themes/estilos.css' rel="stylesheet" type="text/css">
<link href='${pageContext.request.contextPath}/backoffice/themes/calendar-brown.css' rel="stylesheet" type="text/css" media="all" title="summer" />

<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/calendar.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/calendar-en.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/calendar-setup.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/verify.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/mm_menu.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/behaviors.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/Date.js'></script>
<script type="text/javascript" src='${pageContext.request.contextPath}/backoffice/js/scripts.js'></script>

<script type="text/javascript">

	var arrSelecteds = new Array();
	var numItens=0;

	function addChecked(frm) {
		for (i=0;i< frm.length;i++) {
			e = frm.elements[i];
			if (e.type=='checkbox' && e.checked && e.name.substr(0,2) == "ch") {
				var numeroConteudo = eval("frm.idi" + e.name.substr(2) + ".value");
				var nodeId = eval("frm.nidi" + e.name.substr(2) + ".value");				

				var j;
				for (j = 0; j < numItens; j++) {
					if (arrSelecteds[j].Id == numeroConteudo) {
						break;
					}
				}
				if ( j >= numItens ) { // Somente se não tiver sido anteiormente selecionado
					arrSelecteds[numItens] = new Object();
					arrSelecteds[numItens].Id = numeroConteudo;
					arrSelecteds[numItens].NodeId = nodeId;					
					arrSelecteds[numItens].Titulo = e.value;
					numItens ++;
				}
			}
		}
		
		window.opener.relacionados = arrSelecteds;
		window.opener.numItens = numItens;
		
		opener.usevalues();
		window.close();
	}

</script>

<form name="resultados" >
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    	<tr>
        	<td>
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="rebordoCinzaFino">
					<tr>
                         <td align="right" class="texto">
                            <table  width='100%' border='0' cellspacing='0' cellpadding='0'>
                            	<tr>
                                    <td bgcolor="gainsboro" align="Center" nowrap colspan="2">
                                      	<strong><bean:message key="kcms.pesquisar.titulo.label" locale="locale"/></strong>
                                    </td>
                                </tr>
                                <c:forEach var="node" items="${nodes}" varStatus="status">
                                	<tr bgcolor="${status.index % 2 == 0 ? 'whitesmoke' : 'white' }">
		                            	<td width="34">
		                            		<input class="texto" 
		                            			   type="checkbox" 
		                            			   name='ch${status.index}'
		                            			   id='ch${status.index}' 
		                            			   value='${node.value.titulo}' />
		                            		<input type="hidden" id='idi${status.index}' value='${node.value.numeroConteudo}' />
		                            		<input type="hidden" id='nidi${status.index}' value='${node.id}' />		                            		
		                            	</td>
		                            	<td class="texto">
		                            		<label for="ch${status.index}" style="cursor: hand">${node.value.titulo}</label>
		                            	</td>
	                            	</tr>
                                </c:forEach>
                         	</table>
             			</td>
                    </tr>
                    <tr>
						<td height="30">
							<input type="hidden" name="result" value="" />
							<input type="hidden" name="resultt" value="" />
							&nbsp;&nbsp;&nbsp;
							<input name="areservar" type="button"
								value='<bean:message key="kcms.botao.submeter.label" locale="locale"/>'
								onclick="addChecked(resultados);"
								onmouseover="changeImage(this, 1);"
								onmouseout="changeImage(this, 2);"
								class="styledButton"
								style="width: 100px"
							/>
						</td>
                    </tr>
                </table>
    		</td>
      	</tr>
 	</table>
</form>
