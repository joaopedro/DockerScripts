<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>

<title>Pesquisa</title>

<c:if test="${not empty param.modo}">
	<c:set var="pesquisa_modo" scope="session" value="${param.modo}" />
</c:if>
<c:set var="pesquisar" value="${sessionScope.pesquisa_modo == 'pesquisa'}" />
<c:set var="onlyone" value="${sessionScope.pesquisa_modo == 'onlyone' or pesquisar}" />
<c:set var="relacionar" value="${sessionScope.pesquisa_modo == 'relat' or (onlyone and not pesquisar)}" />

<link href="${pageContext.request.contextPath}/backoffice/themes/pc-ie.css" rel="stylesheet" type="text/css">

<c:if test="${relacionar}">
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
</c:if>

<script type="text/javascript">

	var arrSelecteds = new Array();
	var numItens=0;
	<c:if test="${pesquisar}">
		<c:choose>
			<c:when test="${not empty param.modo}">
				window.opener.relacionados = arrSelecteds;
				window.opener.numItens = 0;				
			</c:when>
			<c:otherwise>
				arrSelecteds = window.opener.relacionados;
				numItens = window.opener.numItens;			
			</c:otherwise>
		</c:choose>
	</c:if>

	function addChecked(frm)
	{
		for(i=0;i< frm.length;i++)
		{
			e=frm.elements[i];
			if (e.type=='checkbox' && e.checked && e.name.substr(0,2) == "ch" )
			{
				var j;
				var id = eval( "frm.idi" + e.name.substr(2) + ".value" );

				for ( j = 0; j < numItens; j++ )
				{
					if ( arrSelecteds[j].Id == id )
						break;
				}
				if ( j >= numItens ) // Somente se não tiver sido anteiormente selecionado
				{
					arrSelecteds[ numItens ] = new Object();
					arrSelecteds[ numItens ].Id = id;
					arrSelecteds[ numItens ].Titulo = e.value;
					numItens ++;
				}
			}
		}
		window.opener.relacionados = arrSelecteds;
		window.opener.numItens = numItens;
	}

	function submitform( frm )
	{
		frm.submit()
	}
	
</script>
<html:form action="/pesquisar">
	<c:if test="${not empty param.codtipo and param.codtipo > 0}">
		<input type="hidden" name="codtipo" value="${param.codtipo}" />
	</c:if>
	<c:if test="${relacionar}">
		<input type="hidden" name="relacionar" value="true" />	
	</c:if>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    	<tr>
        	<td>
			<!-- Zona de Trabalho -->
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="rebordoCinzaFino">
					<tr>
						<td class="frasetitulo" height="35">
							<span class="titulos"> 
								<c:choose>
									<c:when test="${relacionar}">
										&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.pesquisar.relacionar.label" locale="locale"/>
									</c:when>
									<c:otherwise>
										&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.pesquisar.pesquisar.label" locale="locale"/> 
									</c:otherwise>
								</c:choose>
							</span>
						</td>
					</tr>
					<tr>
						<td class="texto">
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.selecionarconteudo.tipo.label" locale="locale"/>
						</td>
						<td>
							<select name="tipoconteudo" style="width: 322px">
							<c:choose>
								<c:when test="${not empty param.codtipo and param.codtipo > 0}">
									<kcms:set var="tipoConteudo" numeroConteudo="${param.codtipo}" />
									<option value="${tipoConteudo.numeroConteudo}">${tipoConteudo.titulo}</option>
								</c:when>
								<c:otherwise>
									<kcms:set var="tipoTipoConteudo" configEntry="CODTIPOCON" />
									<kcms:conteudos tipoConteudo="tipoTipoConteudo" var="tipoConteudo">
										<option value="${tipoConteudo.numeroConteudo}">${tipoConteudo.titulo}</option>
									</kcms:conteudos>
								</c:otherwise>
							</c:choose>
					   		</select>
						</td>
					</tr>
					<tr>
						<td class="texto">
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.pesquisar.texto.label" locale="locale"/>
						</td>
						<td class="texto">
							<textarea name="texto" class="txt11" cols="75" rows="4"></textarea>
						</td>
					</tr>
					<tr>
						<td class="texto">
						  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.pesquisar.datainicio.label" locale="locale"/>
						</td>
						<td>
							<table>
								<tr>
									<td>
										<input name="datainicio" 
	    									   id="datainicio" 
											   maxlength="10" 
											   size="10" 
											   tabindex="4"  
											   onFocus="javascript:vDateType='2'"
											   onKeyUp="DateFormat(this,this.value,event,false,'2')"
											   onBlur="DateFormat(this,this.value,event,true,'2');" 
											   type="text"
										/>
										<SCRIPT type="text/javascript">	
										     Calendar.setup({
										        inputField     :    "datainicio",
										        ifFormat       :    "%Y-%m-%d",
										        showsTime      :    true,
										        timeFormat     :    "24"
										    });
										</SCRIPT>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>	
						<td class="texto">
					  		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.pesquisar.datafim.label" locale="locale"/>
						</td>
						<td>
							<table>
								<tr>
									<td>
										<input name="datafim"  
	 										   id="datafim" 
											   maxlength="10" 
											   size="10" 
											   tabindex="4" 
											   onFocus="javascript:vDateType='2'"
											   onKeyUp="DateFormat(this,this.value,event,false,'2')"
											   onBlur="DateFormat(this,this.value,event,true,'2');" 
											   type="text"
										/>
										<SCRIPT>	 
										     Calendar.setup({
										        inputField     :    "datafim",   // id of the input field
										        ifFormat       :    "%Y-%m-%d",       // format of the input field
										        showsTime      :    true,
										        timeFormat     :    "24"
										    });
										</SCRIPT>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="35">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										&nbsp;&nbsp;&nbsp;
										<input name="submeter" type="button"
											value="<bean:message key="kcms.botao.pesquisar.label" locale="locale"/>"
											onclick="javascript:submitform(this.form)"
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
        	</td>
    	</tr>
	</table>
</html:form>
<br />
<form  name="resultados" >
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    	<tr>
        	<td>
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="rebordoCinzaFino">
					<tr>
                         <td align="right" class="texto">
                         	<br>
          
                            <table  width='100%' border='0' cellspacing='0' cellpadding='0'>
                            	<tr>
                                    <td  bgcolor="gainsboro" align="Center" nowrap colspan="2">
                                      	<strong><bean:message key="kcms.pesquisar.titulo.label" locale="locale"/></strong>
                                    </td>
                                </tr>
                                <c:forEach var="c" items="${conteudos}" varStatus="status">
                                	<tr bgcolor="${status.index % 2 == 0 ? 'whitesmoke' : 'white' }">
		                            	<td width="34">
		                            		<input class="texto" 
		                            			   type="${onlyone ? 'radio' : 'checkbox' }" 
		                            			   name='ch${onlyone ? "" : status.index }'
		                            			   id='ch${status.index}' 
		                            			   value='${c.titulo}' 
		                            			   onclick="resultados.result.value=${c.numeroConteudo}; resultados.resultt.value='${c.titulo}';"
		                            		/>
		                            		<input type="hidden" 
		                            			   name='idi${status.index}' 
		                            			   value='${c.numeroConteudo}'
		                            		/>
		                            	</td>
		                            	<td class="texto">
		                            		<label for="ch${status.index}" style="cursor: hand">${c.titulo}</label>
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
							<c:set var="buttonLabel">
								<c:choose>
									<c:when test="${onlyone}">
										<bean:message key="kcms.botao.escolher.label" locale="locale"/>
									</c:when>
									<c:otherwise>
										<bean:message key="kcms.botao.relacionar.label" locale="locale"/>
									</c:otherwise>
								</c:choose>
							</c:set>
							<input name="areservar" type="button"
								value="${buttonLabel}"
								onclick="javascript:${onlyone ? 'submeterEscolha(this)' : 'addChecked(resultados); changeData();'}"
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
      	<tr>
      		<td>
      			<br />
      		</td>
      	</tr>
        <tr>
            <td>
            	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="rebordoCinzaFino">
					<tr>
                         <td align="right" class="texto">
                         	<br>
                         	<span id="itens">&nbsp;</span>
							<script type="text/javascript">
								function submeterEscolha()
								{
									var done = false;
						
						   			var ok = eval( "resultados.result.value" );
									if ( ok ) {
									<c:choose>
										<c:when test="${!pesquisa}">
											opener.valor = eval( "resultados.result.value" );
											opener.descritivo = eval( "resultados.resultt.value" );
								       		opener.usevalues();
								       		window.close();
										</c:when>
										<c:otherwise>
											<c:set var="homeDir"><kcms:configuracao configEntry="HOMEDIR"/></c:set>
											location.href = "${pageContext.request.contextPath}/${homeDir}/displayconteudo.do2?numero=" + resultados.result.value;
										</c:otherwise>
									</c:choose>
										done = true;
									}
						       		if (!done) {
						       			alert( 'Deve escolher pelo menos uma opção' );
						       		}
								}
						
								function submeterValores()
								{
						       		var i;
						
						       		for ( i = 0; i < numItens; i++ )
						       		{
						       			var ok = eval( "resultados.ck" + i + ".checked" );
						
						       			if ( !ok )
						       			{
						       				arrSelecteds[ i ].Id = -arrSelecteds[ i ].Id;
						       			}
						       		}
						       		opener.usevalues();
						       		window.close();
								}
						
								function toggle( id )
								{
						       		var i;
						
						       		id = 1 * id; // correcção para inteiro
						
						       		for ( i = 0; i < numItens; i++ )
						       		{
						       			if ( arrSelecteds[ i ].Id == id || arrSelecteds[ i ].Id == -id )
										{
						       				arrSelecteds[ i ].Id = -arrSelecteds[ i ].Id;
						       			}
						       		}
								}
						
								function changeData( )
								{
									var s = '';
									var i=0;
						
									s += '<table  width="100%" border="0" cellspacing="0" cellpadding="0">';
									<c:if test="${!onlyone}">
										s += '<tr>';
							            s += '<td  bgcolor="gainsboro" align="Center" colspan="2" nowrap><strong>';
										s += '<bean:message key="kcms.pesquisar.relacionamentos.label" locale="locale"/>';
										s += '</strong></td>';
										s += '</tr>';
									</c:if>
									for( i = 0; i < numItens; i++ )
									{
										var color = "white";
										if( i % 2 == 0 )
											color = "whitesmoke";
											
										s += '<tr bgcolor="' + color + '">';
										if ( arrSelecteds[ i ].Id > 0 )
											sel = " checked ";
										else
											sel = "";
							            s += '<td width="34"><input type="checkbox" name="ck' + i + '" ' + sel + ' onclick="toggle( resultados.id' + i + '.value )"><input type="hidden" name="id' + i + '" value="' + arrSelecteds[ i ].Id + '"> </td>';
							            s += '<td class="texto">' + arrSelecteds[ i ].Titulo + '</td>';
							            s += '</tr>';
									}
						            s += '</table>';
						            itens.innerHTML = s;
						       	}
						       	changeData();
							</script>
                   		</td>
                 	</tr>
	               <c:if test="${!onlyone}">
	                <tr>
						<td height="30">
							&nbsp;&nbsp;&nbsp;
							<input name="aterminar" type="button"
								value="<bean:message key="kcms.botao.aceitar.label" locale="locale"/>"
								onclick="javascript:submeterValores()"
								onmouseover="changeImage(this, 1);"
								onmouseout="changeImage(this, 2);"
								class="styledButton"
								style="width: 100px"
							/>
						</td>
	           	 	</tr>
					</c:if>
          		</table>
       		</td>
      	</tr>
 	</table>
</form>
