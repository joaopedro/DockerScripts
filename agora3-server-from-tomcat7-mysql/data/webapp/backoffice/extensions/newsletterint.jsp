<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/kcms.tld" prefix="kcms"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="newsletter" value="${currentcontent.conteudo}" />
<c:set var="imgdir" value="${pageContext.request.contextPath}/backoffice/images/newsletter" />

<script type="text/javascript">
	var campo = null;
	var desc = null;
	function action(path) {
		return '${pageContext.request.contextPath}/backoffice' + path;
	}

	function usevalues() {
		campo.value = window.valor;
		desc.innerHTML = window.descritivo;
	}
	
	var originalAction;
	var preVisualizar = false;


	function visualizar(form) {
		preVisualizar = true;
		var visual = window.open("", "visual", "toolbar=0,scrollbars=1,resizable=1,width=700,height=750,top=0,left=0");
		form.enctype = null;
		if (originalAction == null) {
			originalAction = form.action;
		}
		form.target = visual.name;
		form.action = "${pageContext.request.contextPath}/backoffice/extensions/visualizarnewsletter.do2";
	}
	
	function limparArtigo( form, prefix) {
		if( !confirm( "Tem a certeza que deseja remover este artigo?" ) ) return;

		form.elements[prefix + ".numeroConteudo"].value =  "";
		form.elements[prefix + ".ordem"].value =  "";
				
		$(prefix + "_desc").innerHTML = "escolha um artigo";
		form.elements[prefix + ".mostraImagem"].checked =  false;		
		form.elements[prefix + ".posicaoImagem"][0].disabled =  true;			
		form.elements[prefix + ".posicaoImagem"][1].disabled =  true;					
	}

	function limparImagem( campo, descricao, ordem, usaImagem, posicaoImagem ) {
		if( !confirm( "Tem a certeza que deseja remover esta imagem?" ) ) return;
		campo.value = "";
		descricao.innerHTML = "escolha uma imagem";
	}

	function buttondown( v, id, tipo ) {
		if (tipo == null) {
			tipo = 0;
		}
		wn = open(action('/pesquisarfl.do2?modo=onlyone&codtipo=0' + tipo),'','width=800,height=600,scrollbars=yes');
		campo = v;
		desc = $(id);
	}

	showchoose = function( val, button )
	{
		$(button).style.visibility = val == 'C' ? 'visible' : 'hidden';
		if ( val != 'C' )
			$('cval').innerHTML = '';
	}
	
	var savedbtn = null;
	var savedvalue = null;
	var saveddesc = null;
	
	choosevalue = function( valuef, btn, descf )
	{
		savedbtn = btn;
		savedvalue = valuef;
		saveddesc = $(descf);
		startLinkGeneric( 'choosecontent.do2', '', 'choosebox' );
		showbox( 'choosebox', btn.id );
	}

	saveNewEntry = function( numero, titulo )
	{
		$(savedvalue).value = numero;
		$(saveddesc).innerHTML = titulo;
	}

	showbox = function( divname, element )
	{
		var _popup = $( divname );
		if ( _popup.style.visibility == 'visible')
			{
			cleardivs(divname);
			return;
			}
		var _element = $(element);
		var coords = findPos( _element );
		var coords2 = findPos( $('center') );
		coords[0] = coords[0] - coords2[0];
		coords[1] = coords[1] - coords2[1];
		coords[1] += 30;
		coords[0] += 20;
		_popup.style.top = coords[1] + 'px';
		_popup.style.left = coords[0] + 'px';
		_popup.style.display = 'block';
		_popup.style.visibility = 'visible';
	}
	
	cleardivs = function(divc)
	{
		var _popup = $(divc);
		_popup.style.display = 'none';
		_popup.style.visibility = 'hidden';
		if ( divc == 'properties' )
			cleardivs( 'choosebox' );
	}

</script>
<input type="button" value="?" alt="Escolher imagem do topo" onclick="choosevalue( this.form.imagem_topo, this, 'imagem_topo_desc' )" id="btnimagemtopo" onmouseover="changeImage(this, 1);" onmouseout="changeImage(this, 2);" class="styledbutton" />
&nbsp;
<input type="button" value="X" alt="Apagar imagem do topo" onclick="limparImagem( this.form.imagem_topo, this.form.imagem_topo_desc )" onmouseover="changeImage(this, 1);" onmouseout="changeImage(this, 2);" class="styledbutton" />
&nbsp;
<html:hidden property="extension.imagem_topo" styleId="imagem_topo" />
[Banner:
		<span id="imagem_topo_desc" class="titleBlueTexto">
			<c:choose>
				<c:when test="${not empty newsletter.imagemTopo}">${newsletter.imagemTopo.titulo}</c:when>
				<c:otherwise>escolha uma imagem para o topo</c:otherwise>
			</c:choose>
		</span>
]
<p>
	<span class="textBlack">Título:</span> 
	<span class="titleBlueTexto"><html:text property="extension.titulo" maxlength="80" size="80" /></span>
</p>
<p>
	Newsletter n.º <html:text property="extension.numero" maxlength="10" size="5" /> 
	<span class="textBlack11pt">&nbsp; 
		<html:text styleId="data" property="extension.data"/> 
		&nbsp; 	
		<script type="text/javascript">
			Calendar.setup({ inputField : "data", ifFormat : "%Y-%m-%d", showsTime : false });
		</script> 
	</span>
	Newsletter Tag <html:text property="extension.subtitulo" maxlength="15" size="10" /> 
</p>
<table cellspacing="0" cellpadding="0" border="1" width="800">
	<tbody>
		<tr>
			<c:forEach var="coluna" items="${conteudoForm.extension.colunas}" varStatus="statusColuna">
				<td align="left" width="${100 / fn:length(conteudoForm.extension.colunas)}%" style="vertical-align: top;">
					<html:hidden property="extension.colunas[${statusColuna.index}].coluna" styleId="extension.colunas[${statusColuna.index}].coluna"/>
					<c:choose>
						<c:when test="${statusColuna.index == 0}">Artigos Principais</c:when>
						<c:otherwise>Títulos Laterais</c:otherwise>
					</c:choose>
					<c:forEach var="seccao" items="${coluna.seccoes}" varStatus="statusSeccao">
						<%@include file="newsletterint_seccao.jsp"%>
					</c:forEach>
					<c:forEach begin="${fn:length(coluna.seccoes)}" end="4" varStatus="statusSeccao">
						<%@include file="newsletterint_seccao.jsp"%>
					</c:forEach>
				</td>
			</c:forEach>
		</tr>
	</tbody>
</table>