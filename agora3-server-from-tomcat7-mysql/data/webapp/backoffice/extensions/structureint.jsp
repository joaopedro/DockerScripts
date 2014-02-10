<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page errorPage="/backoffice/errors/error.jsp" %>
<script type="text/javascript">
	novalinha = function( tabela, template )
	{
		tabela = $( tabela );
		if ( tabela.ordem == undefined )
			tabela.ordem = -1;
		var tr = tabela.insertRow( tabela.rows.length );
		var te = $(template);
		tabela.ordem = tabela.ordem + 1;
		tr.id = 'linha_' + tabela.id + '_' + tabela.ordem;
		for (var i = 0; i < te.cells.length; i++ )
			{
			var cell = tr.insertCell( i );
			var s = te.cells[i].innerHTML;
			while ( s.indexOf( 'Template' ) >= 0 )
				s = s.substring( 0, s.indexOf( 'Template' ) ) + tabela.ordem + s.substring( s.indexOf( 'Template' ) + 8 );
			while ( s.indexOf( 'TempRowId' ) >= 0 )
				s = s.substring( 0, s.indexOf( 'TempRowId' ) ) + tabela.ordem + s.substring( s.indexOf( 'TempRowId' ) + 9 );
			cell.innerHTML = s;
			if ( i == (te.cells.length-1) )
				cell.style.textAlign = 'center';
			}
		actLinhas( tabela.id );		
	}

	actLinhas = function( tabela )
	{
		var max = 0;
		var tb = $(tabela);
		for ( var i = 0; i < tb.rows.length; i++ )
			{
			var s = tb.rows[i].id;
			if ( s.indexOf( tabela ) > 0 )
				{
				s = s.substring(s.indexOf( tabela ) + tabela.length + 1 );
				s = s * 1;
				if ( s > max )
					max = s; 
				}
			}
		$( tabela + 'cnt' ).value = max+1;
	}

	removerlinha = function( tabela, linha )
	{
		tabela = $( tabela );
		if ( !tabela.ordem )
			tabela.ordem = -1;
		var id = linha;
		for ( var i = 0; i < tabela.rows.length; i++ )
			{
			if ( tabela.rows[i].id == id )
				{
				tabela.deleteRow( i );
				break;
				}
			}
	}

	setMascara = function( mascara )
	{
	
	}
	
	fnExtraSubmit = function( frm )
	{
        <c:forEach var="campo" items="${ estrutura.estrutura.linhas }">
           	<c:if test="${ campo.tipo != 'BL' }">
	           	<c:if test="${ campo.nulos == 'N' }">
           		if ( isBlank(frm.${ campo.colunaFisica }.value) )
           			{
           			alert( "Deve preencher o campo ${ campo.rotulo }" );
           			frm.${ campo.colunaFisica }.focus();
           			return false;
           			}
	           	</c:if>
           	</c:if>
           	<c:if test="${ campo.tipo == 'IT' }">
           		if ( frm.${ campo.colunaFisica }.value != null )
           			{
           			var v = parseFloat( frm.${ campo.colunaFisica }.value );
           			if ( isNaN( v ) )
           				{
	           			alert( "Deve preencher o campo ${ campo.rotulo } com um valor numérico válido" );
	           			frm.${ campo.colunaFisica }.focus();
	           			return false;
	           			}
           			}
           	</c:if>
		</c:forEach>
       	<c:forEach var="dados" items="${ estrutura.linhas }">
			var tabela = $( 'subtb${ dados.estrutura.numero }' );
			for ( var j = 3; j < tabela.rows.length; j++ )
				{
				var te = tabela.rows[j];
				for (var i = 0; i < te.cells.length; i++ )
					{
					var cell = te.cells[i];
					var spans = cell.getElementsByTagName("span");
					if ( spans == null || spans.length == 0 )
						continue;
					var txt = spans[0].innerText;
					if ( txt == null )
						txt = "";
					var nulos = txt.indexOf( "nulos=true" );
					var numero = txt.indexOf( "numero=true" );
					var obj = null;
					var inps = cell.getElementsByTagName("INPUT");
					if ( inps != null && inps.length > 0 )
						obj = inps[0];
					if ( obj == null )
						{
						inps = cell.getElementsByTagName("select");
						if ( inps != null && inps.length > 0 )
							obj = inps[0];
						}
					if ( obj == null )
						continue;
					if ( (!nulos) && isBlank(obj.value) )
	           			{
	           			alert( "Deve preencher o campo" );
	           			obj.focus();
	           			return false;
	           			}
	           		if ( numero && obj.value != null )
	           			{
	           			var v = parseFloat( obj.value );
	           			if ( isNaN( v ) )
	           				{
		           			alert( "Deve preencher o campo com um valor numérico válido" );
		           			obj.focus();
		           			return false;
		           			}
	           			}
					}
				}
		</c:forEach>
		return true;
	}
</script>
<table border="0" cellspacing="0" cellpadding="0">
    <tbody>
        <tr>
            <td class="titulos" colspan="2">${ estrutura.estrutura.nome }</td> 
        </tr>
        <tr>
            <td align="right" class="texto" width="180">&nbsp;</td>
            <td align="right" class="texto">&nbsp;</td>
        </tr>
        <c:forEach var="campo" items="${ estrutura.estrutura.linhas }">
        	<c:if test="${ campo.escondido != 'S' }">
		        <tr>
		            <td align="left" class="texto" width="180">
		            	${ campo.rotulo }:
		            </td>
		            <td align="left" class="texto">
		            	<c:if test="${ campo.tipo == 'ST' }">
		            		<input type="text" value="<kcms:field conteudo='dadosactuais' property='${ campo.nome }' />" name="${ campo.colunaFisica }" id="${ campo.colunaFisica }" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" onkeypress="setMascara( this, '${ campo.mascara }' )" />
		            	</c:if>
		            	<c:if test="${ campo.tipo == 'DT' }">
		            		<input type="text" value="<kcms:field conteudo='dadosactuais' property='${ campo.nome }' />" name="${ campo.colunaFisica }" id="${ campo.colunaFisica }" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" onkeypress="setMascara( this, '${ campo.mascara }' )" />
		                	<script type="text/javascript" language="JavaScript">	
							    Calendar.setup({
							        inputField     :    "${ campo.colunaFisica }",   // id of the input field
							        ifFormat       :    "%Y-%m-%d",       // format of the input field
							        showsTime      :    true,
							        timeFormat     :    "24"
							    });
							    ${ campo.colunaFisica }.value = "";
							</script>
		            	</c:if>
		            	<c:if test="${ campo.tipo == 'IT' }">
		            		<input type="text" value="<kcms:field conteudo='dadosactuais' property='${ campo.nome }' />" name="${ campo.colunaFisica }" id="${ campo.colunaFisica }" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" onkeypress="setMascara( this, '${ campo.mascara }' )" />
		            	</c:if>
		            	<c:if test="${ campo.tipo == 'BL' }">
		            		Sim <input type="radio" <kcms:field conteudo='dadosactuais' property='${ campo.nome }' value='s' output='checked' /> name="${ campo.colunaFisica }" id="${ campo.colunaFisica }" value="s" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" />&nbsp;&nbsp;&nbsp;
		            		Não <input type="radio" <kcms:field conteudo='dadosactuais' property='${ campo.nome }' value='n' output='checked' /> name="${ campo.colunaFisica }" id="${ campo.colunaFisica }" value="n" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" />
		            	</c:if>
		            	<c:if test="${ campo.tipo == 'FN' }">
		            		<input type="file" name="${ campo.colunaFisica }" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" />
		            	</c:if>
		            	<c:if test="${ campo.tipo == 'CL' }">
	            			<kcms:set var="ctipo" numeroConteudo="${ campo.numeroLista }"/>
		            		<select name="${ campo.colunaFisica }" size="1">
		            			<kcms:conteudos var="tipoc" tipoConteudo="ctipo">
		            				<option value="${ tipoc.numeroConteudo }"  <kcms:field conteudo='dadosactuais' property='${ campo.nome }' value='${ tipoc.numeroConteudo }' output='selected' /> >${ tipoc.titulo }</option>
		            			</kcms:conteudos>
		            		</select>
		            	</c:if>
		            </td>
		        </tr>
	        </c:if>
        </c:forEach>
        <tr><td colspan="2">&nbsp;</td></tr>
       	<c:forEach var="dados" items="${ estrutura.linhas }">
	        <tr><td colspan="2">
	       		<c:set var="tb" value="${ dados.estrutura }" />
	        	<table border="0" id="subtb${ tb.numero }">
		       		<tr><th colspan="${fn:length(tb.linhas ) }">${ tb.nome }<input type="hidden" name="subtb${ tb.numero }cnt" value=""></th><th width="20">&nbsp;</th></tr>
		       		<tr>
			       		<c:forEach var="campo" items="${ tb.linhas }">
			       			<td bgcolor="lightblue">${ campo.rotulo }</td>
			       		</c:forEach>
		       			<td bgcolor="lightblue" width="20" align="center">&nbsp;<a href="javascript: novalinha('subtb${ tb.numero }', 'subtemplate${ tb.numero }' )"><img src="${pageContext.request.contextPath}/backoffice/images/fold.gif" border="0"></a></td>
		       		</tr>
		       		<tr id="subtemplate${ tb.numero }" style="display: none; visibility: hidden;">
			       		<c:forEach var="campo" items="${ tb.linhas }" varStatus="idx">
				        	<c:if test="${ campo.escondido != 'S' }">
				       			<td>
				       				<span style="visibility: hidden; display: none;">nulos=${ campo.nulos == 'S' },numero=${ campo.tipo == 'IT' }</span>
					            	<c:if test="${ campo.tipo == 'ST' }">
					            		<input type="text" name="subtb${ tb.numero }.${ campo.colunaFisica }Template" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" onkeypress="setMascara( this, '${ campo.mascara }' )" />
					            	</c:if>
					            	<c:if test="${ campo.tipo == 'DT' }">
					            		<input type="text" name="subtb${ tb.numero }.${ campo.colunaFisica }Template" id="${ campo.colunaFisica }Template" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" />
					                	<script type="text/javascript" language="JavaScript">	
										    Calendar.setup({
										        inputField     :    "${ campo.colunaFisica }Template",   // id of the input field
										        ifFormat       :    "%Y-%m-%d",       // format of the input field
										        showsTime      :    true,
										        timeFormat     :    "24"
										    });
										</script>

					            	</c:if>
					            	<c:if test="${ campo.tipo == 'IT' }">
					            		<input type="text" name="subtb${ tb.numero }.${ campo.colunaFisica }Template" id="subtb${ tb.numero }.${ campo.colunaFisica }Template" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" maxlength="${ campo.tamanho }" />
					            	</c:if>
					            	<c:if test="${ campo.tipo == 'BL' }">
					            		Sim <input type="radio" name="subtb${ tb.numero }.${ campo.colunaFisica }Template" id="subtb${ tb.numero }.${ campo.colunaFisica }sTemplate" value="s" checked />&nbsp;&nbsp;&nbsp;
					            		Não <input type="radio" name="subtb${ tb.numero }.${ campo.colunaFisica }Template" id="subtb${ tb.numero }.${ campo.colunaFisica }nTemplate" value="n"/>
					            	</c:if>
					            	<c:if test="${ campo.tipo == 'FN' }">
					            		<input type="file" name="subtb${ tb.numero }.${ campo.colunaFisica }Template" id="subtb${ tb.numero }.${ campo.colunaFisica }Template" size="${ campo.tamanho < 50 ? campo.tamanho : 50 }" />
					            	</c:if>
					            	<c:if test="${ campo.tipo == 'CL' }">
				            			<kcms:set var="ctipo" numeroConteudo="${ campo.numeroLista }"/>
					            		<select name="subtb${ tb.numero }.${ campo.colunaFisica }Template" id="subtb${ tb.numero }.${ campo.colunaFisica }Template" size="1">
					            			<kcms:conteudos var="tipoc" tipoConteudo="ctipo">
					            				<option value="${ tipoc.numeroConteudo }">${ tipoc.titulo }</option>
					            			</kcms:conteudos>
					            		</select>
					            	</c:if>
				            	</td>
				            </c:if>
			       		</c:forEach>
			       		<td width="20"><a href="javascript: removerlinha('subtb${ tb.numero }', 'linha_subtb${ tb.numero }_TempRowId' )"><img src="${pageContext.request.contextPath}/backoffice/images/open.gif" border="0"></a></td>
		       		</tr>
		       	</table>
		       	</td>
		   </tr>
	        <tr><td colspan="2">&nbsp;
	        </td></tr>
	        <script type="text/javascript">
	        	actLinhas( 'subtb${ tb.numero }' );
	        </script>
       	</c:forEach>
    </tbody>
</table>
