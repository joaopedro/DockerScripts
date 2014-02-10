<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms" %>

<bean:define id="currentcontent" name="currentcontent" scope="request" type="com.sinfic.kcms.datablock.conteudo.CConteudo"/>
<bean:define id="conteudo" name="currentcontent" property="conteudo"/>

<script language="javascript">	
	function usevalues(  )
	{
		window.campo.value = window.valor;
		window.desc.value = window.descritivo;
		window.desc2.innerHTML = window.descritivo;
	}

	function buttondown( v, id, id2, tipo )
	{
// TODO Ver isto bem
		wn = open('<kcms:path configEntry="HOMEDIR" />/pesquisarfl.do2?modo=onlyone&codtipo=' + tipo,'','width=800,height=600,scrollbars=yes');
		window.campo = v;
		window.desc = id;
		window.desc2 = id2;
	}

	function calcNumOcorrencias(er, aStr) {
		var i=0;
		while( aStr.search(er) != -1 ) 
		{
	    	aStr = aStr.replace(er, "");
	  		i++;
	  	}
		return i;
	}

	function hasHoles()
	{
		var i = 0;
		var j = 0;
		var error = false;

		var text = getEditorPT().getHTML();
		
		outer : for( ; i < 9; i++ )
		{
			if( text.search("#img" + i + ".*#") == -1 )
				continue;
			inner : for( ; j < i; j++ )
			{
				if( text.search("#img" + j + ".*#") == -1 )
					error = true;
			}
		}
		
		return error;
	}
		
	function getEditorPT(){
		for (i=0; i < editors.length; i++){
			var editor = editors[i];
			if (editor._textArea.name.indexOf('(pt)') != -1 ){
				return editor;
			}
		}
		return null;
	}	
		
	function defineImagens() {
		var editor = getEditorPT();
		var numOcorrencias = calcNumOcorrencias(/#img[0-9].*#/, editor.getHTML());
		var arr = new Array();
		
		if( hasHoles() )
		{
			alert('Nºs Têm de ser sequenciais');
			for(i=0; i < 10; i++)
			{
				var imagemTitulo = eval("document.forms['conteudoForm'].elements['imagem[" + i + "].formFile']");
				var imagemFile = eval("document.forms['conteudoForm'].elements['imagem[" + i + "].description']");
				var divImagem = document.getElementById("imagem" + i);
				divImagem.style.display = 'none';
				imagemFile.style.display = 'none';
				imagemTitulo.style.display = 'none';
			}
			return;
		}
	
		var count = 0;
		for(i=0; i < 10; i++)
		{
			var er = "#img" + i + ".*#";
			arr[i] = calcNumOcorrencias(new RegExp(er), editor.getHTML());
			if( arr[i] != 0 )
				count++;
		}
		
		for(i=0; i < 10; i++)
		{
			var imagemTitulo = eval("document.forms['conteudoForm'].elements['imagem[" + i + "].formFile']");
			var imagemFile = eval("document.forms['conteudoForm'].elements['imagem[" + i + "].description']");
			var divImagem = document.getElementById("imagem" + i);
			if (i < count)
			{
				divImagem.style.display = 'inline';
				imagemFile.style.display = 'inline';
				imagemTitulo.style.display = 'inline';
			}
			else
			{
				divImagem.style.display = 'none';
				imagemFile.style.display = 'none';
				imagemTitulo.style.display = 'none';
				imagemFile.value = '';
				imagemTitulo.value = '';
			}
		}
	
		return true;
	}
	<logic:equal name="conteudo" property="tipoConteudo.usaDescricaoComprida" value="S">
		HTMLArea.loadPlugin("CSS");
        function initDocument() {
				<logic:present name="linguas">
                	<logic:iterate id="lingua" name="linguas">
                    	editors.push(new HTMLArea("localizedData(${lingua.idExterno}).descricaoComprida"));
                    </logic:iterate>
                </logic:present>
                <logic:notPresent name="linguas">
                	editors.push(new HTMLArea("localizedData(pt).descricaoComprida"));
                </logic:notPresent>
                var i = 0;
                for (i = 0; i < editors.length; i++) {
	                var editor = editors[i];
	                editor.config.width = "auto";
	                editor.config.height = 350;
	                editor.generate();
                }
	            checkFilledImages();
				<%-- 
					Depois de gerar os editores é necessário esconder os tabs que contém 
					os editores.
					O editor não é gerado caso o editor esteja contido num tab escondido
				--%>
				<logic:present name="linguas">
                	<logic:iterate id="lingua" name="linguas">
                    	document.getElementById("localizedData(${lingua.idExterno})").style.display = 'none';
					</logic:iterate>
                </logic:present>
                document.getElementById('localizedData(pt)').style.display = 'none';
        }
		var oldOnload = window.onload
		window.onload = function () { 
			if (typeof oldOnload == 'function') oldOnload(); 
			initDocument() 
		};
	  	/**
	  	 * Verifica quantas imagens existem na descrição comprida do conteúdo
	  	 */
	  	function checkFilledImages()
		{
			var element = document.getElementById("localizedData(pt).descricaoComprida");
			var str = element.value;
			var numOcorrencias = 0;
			for( var i = 0; i < 40; i++ )
			{
				var re = "#img" + i + ".*#";
				if( calcNumOcorrencias(new RegExp(re), str) > 0 )
				{
					numOcorrencias++;
				}
			}
			for( var i = 0; i < 40; i++ )
			{
				if( i < numOcorrencias )
				{
					document.getElementById("imagem" + i).style.display = 'inline';
				}
			}
		}
	</logic:equal>
</script>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		    <tbody>
    	<!-- IMAGEM LATERAL -->
        <tr bgcolor="whitesmoke">
            <td class="texto" valign="top">
              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.imagem.label" locale="locale"/>
            </td>
            <td class="texto" valign="top">
				<input type="checkbox" name="deleteImagem" value="S" title="Eliminar a imagem">
				<html:text property="imagemLateral.description" size="80" title="Imagem lateral do conteúdo"  maxlength="200"  />
            	<html:file property="imagemLateral.formFile"></html:file>
            	<logic:present name="conteudo" property="nomeImagem">
            		<bean:define id="link">${pageContext.request.contextPath}/docs/${conteudo.nomeFicheiro}</bean:define>
            		<img src="${link}" alt="${conteudo.nomeImagem}" width="25" height="20"></img>
            	</logic:present>
            </td>
        </tr>
            
        <!-- THUMBNAILS -->
        <tr>
			<td class="texto" width="20%" valign="top">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.thumb1.label" />
			</td>
			<td class="texto" valign="top">
				<input type="checkbox" name="deleteThumb" value="S" title="Eliminar Thumb">
				<html:text property="thumbnail1.description" size="80" title="Primeiro ThumbNail"  maxlength="200"  />
            	<html:file property="thumbnail1.formFile"></html:file> 
            	<logic:present name="conteudo" property="thumbName">
            		<bean:define id="link">${pageContext.request.contextPath}/docs/${conteudo.numeroConteudo}-t.${conteudo.thumbExt}</bean:define>
            		<img src="${link}" alt="${conteudo.thumbName}" width="25" height="20"></img>
            	</logic:present>
            </td>
		</tr>
        <tr>
			<td class="texto" valign="top">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.thumb2.label" />
			</td>
			<td class="texto">
				<input type="checkbox" name="deleteThumb2" value="S" title="Eliminar thumb">
				<html:text property="thumbnail2.description" size="80" title="Segundo Thumb"  maxlength="200"  />
            	<html:file property="thumbnail2.formFile"></html:file>
            	<logic:present name="conteudo" property="thumb2Name">
            		<bean:define id="link">${pageContext.request.contextPath}/docs/${conteudo.numeroConteudo}-t2.${conteudo.thumb2Ext}</bean:define>
            		<img src="${link}" alt="${conteudo.thumb2Name}" width="25" height="20"></img>
            	</logic:present>
            </td>
		</tr>
        <!-- DATA DE INÍCIO DE CONTEÚDO -->
        <logic:equal name="conteudo" property="tipoConteudo.usaDataInicio" value="S">
            <tr>
                <td class="texto" >
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.datainiciovalidade.label" locale="locale"/>
                </td>
				<td class="txt11b" width="66">
					<logic:present name="conteudoForm" property="validade.start">
						<bean:define id="start"><bean:write name="conteudoForm" property="validade.start"  format="yyyy-MM-dd HH:mm"/></bean:define>	
						<html:text property="validade.start" maxlength="16" size="16"
						           styleId="datainiciovalidade" value="${start}" ></html:text>										
					</logic:present>
					<logic:notPresent name="conteudoForm" property="validade.start">
						<html:text property="validade.start" maxlength="16" size="16"
						           styleId="datainiciovalidade" ></html:text>					
					</logic:notPresent>
                	<script type="text/javascript" language="JavaScript">	
					    Calendar.setup({
					        inputField     :    "datainiciovalidade",   // id of the input field
					        ifFormat       :    "%Y-%m-%d %H:%M",       // format of the input field
					        showsTime      :    true,
					        timeFormat     :    "24"
					    });
					</script>  
                               
				</td>
            </tr>
        
        </logic:equal>
        
        <!-- DATA DE FIM DE CONTEÚDO -->
		<logic:equal name="conteudo" property="tipoConteudo.usaDataFim" value="S">
            <tr>
                <td class="texto" >
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.datafinalvalidade.label" locale="locale"/>
                </td>
            	<td class="txt11b" width="66">
					<logic:present name="conteudoForm" property="validade.end">
							<bean:define id="end"><bean:write name="conteudoForm" property="validade.end"  format="yyyy-MM-dd HH:mm"/></bean:define>
							<html:text property="validade.end" maxlength="16" size="16"
							           styleId="datafimvalidade" value="${end}"></html:text>
					</logic:present>
					<logic:notPresent name="conteudoForm" property="validade.end">
							<html:text property="validade.end" maxlength="16" size="16"
							           styleId="datafimvalidade" ></html:text>
					</logic:notPresent>
                	<script type="text/javascript" language="JavaScript">	
					    Calendar.setup({
					        inputField     :    "datafimvalidade",   // id of the input field
					        ifFormat       :    "%Y-%m-%d %H:%M",       // format of the input field
					        showsTime      :    true,
					        timeFormat     :    "24"
					    });
					</script>  
                </td>
            </tr>
        </logic:equal>
        
        <!-- DATA DE INÍCIO DE EXECUÇÃO DO CONTEÚDO -->
        <logic:equal name="conteudo" property="tipoConteudo.usaDataExecucao" value="S">
            <tr>
                <td class="texto" >
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.datainicioexecucao.label" locale="locale"/>
                </td>
				<td class="txt11b" width="66">
					<logic:present name="conteudoForm" property="execucao.start">
						<bean:define id="startExecucao"><bean:write name="conteudoForm" property="execucao.start"  format="yyyy-MM-dd HH:mm"/></bean:define>
						<html:text property="execucao.start" styleId="datainicioexecucao"
								   maxlength="16" size="16" value="${startExecucao}"/>
					</logic:present>
					<logic:notPresent name="conteudoForm" property="execucao.start">
						<html:text property="execucao.start" 
						           styleId="datainicioexecucao"
								   maxlength="16" size="16" />
					</logic:notPresent>
					
            		
                	<script type="text/javascript" language="JavaScript">	
					</script>  
                </td>
            </tr>
			<!-- DATA DE FIM DE EXECUÇÃO DE CONTEÚDO -->		            
            <tr>
                <td class="texto" >
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.datafinalexecucao.label" locale="locale"/>
                </td>
                	<td class="txt11b" width="66">
	                	<logic:present name="conteudoForm" property="execucao.end">
							<bean:define id="endExecucao"><bean:write name="conteudoForm" property="execucao.end"  format="yyyy-MM-dd HH:mm"/></bean:define>
							<html:text property="execucao.end" styleId="datafimexecucao" maxlength="16" size="16"
	   							   value="${endExecucao}" />                        	
						</logic:present>
						<logic:notPresent name="conteudoForm" property="execucao.end">
							<html:text property="execucao.end" styleId="datafimexecucao" maxlength="16" size="16" />
						</logic:notPresent>

                		<script type="text/javascript" language="JavaScript">	 
                			var datePattern = "%Y-%m-%d %H:%M";
						    Calendar.setup({
						        inputField     :    "datainicioexecucao",   // id of the input field
						        ifFormat       :    datePattern,       // format of the input field
						        showsTime      :    true,
						        timeFormat     :    "24"
						    });
                		
					     	Calendar.setup({
					        	inputField     :    "datafimexecucao",   // id of the input field
					        	ifFormat       :    datePattern,       // format of the input field
					        	showsTime      :    true,
					        	timeFormat     :    "24"
					    	});
						</script>
                </td>
            </tr>	            
        
        </logic:equal>

        <!-- IDEXTERNO DO CONTEÚDO -->

		<logic:equal name="conteudo" property="tipoConteudo.usaIdExterno" value="S">
            <tr>
                <td class="texto" >
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.conteudo.ecraGlobal.idexterno" locale="locale"/>
                </td>
                <td>
                     <html:text property="idExterno" maxlength="50" size="40"/>
                     <script language="JavaScript"> setValidation(document.forms['conteudoForm'].idExterno,  true, 'Id Externo'); </script>
                </td>
            </tr>
        </logic:equal>
        
        <!-- LINK ESPECÍFICO DO CONTEÚDO -->
        <tr>
            <td class="texto" >
              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.linkespecifico.label" locale="locale"/>
            </td>
            <td class="texto" >
            	<html:text property="linkEspecifico" size="50" />
            	<script language="JavaScript"> setValidation(document.forms['conteudoForm'].linkEspecifico, true, 'Link Específico'); </script>
            </td>
        </tr>
        
        <!-- DISPLAY DO CONTEÚDO -->
        <tr>
            <td class="texto" >
              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.displayconteudo.label" locale="locale"/>
            </td>
            <td class="texto" >
            	<html:text property="linkDisplay" size="50" />
            	<script language="JavaScript"> setValidation(document.forms['conteudoForm'].linkDisplay, true, 'Display Conteúdo'); </script>
            </td>
        </tr>
        
        <!-- SEGUIR LINK -->
        <tr>
            <td class="texto" >
              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.seguirlink.label" locale="locale"/>
            </td>
            <td class="texto" >
            	<html:checkbox property="toSeguirLink" value="true"></html:checkbox>
            </td>
        </tr>
        
        <!-- MOSTRA NA HOMEPAGE -->
        <tr>
            <td class="texto" >
              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.mostrarnahomepage.label" locale="locale"/>
            </td>
            <td class="texto" >
            	<html:checkbox property="mostrarHomepage" />
            </td>
        </tr>
        
        <!-- FORUM -->
		<logic:equal name="conteudo" property="tipoConteudo.temComentario" value="S">
	        <tr>
	            <td class="texto" >
	              	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.forum.label" locale="locale"/>
	            </td>
	            <td class="texto" >
	            	<html:checkbox property="forum"></html:checkbox>
	            </td>
	        </tr>
		</logic:equal>
	        
        <!-- BANNER -->
		<logic:equal name="conteudo" property="tipoConteudo.banner" value="S">
	        <tr>
	            <td class="texto" >
	            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.criarconteudo.tempotransiccao.label" locale="locale"/>
	            </td>
	            <td>
	            	<html:text property="tempoTransiccao" maxlength="4" size="4"></html:text>
	            </td>
	        </tr>
		
		</logic:equal>	        

        <!-- USA PREÇO -->
		<logic:equal name="conteudo" property="tipoConteudo.usaPreco" value="S">
            <tr>
                <td class="texto" >
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.conteudo.ecraGlobal.preco" locale="locale"/>
                </td>
                <td>
                	<html:text property="preco" maxlength="16" size="16"/>
                </td>
            </tr>
		</logic:equal>
        <tr>
            <td class="texto" >
            	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<bean:message key="kcms.conteudo.ecraGlobal.tag" locale="locale"/>
            </td>
            <td>
            	<html:text property="tags" maxlength="16" size="16"/>
            </td>
        </tr>
      
    </tbody>
</table>
