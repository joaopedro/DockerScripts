<META http-equiv="X-UA-Compatible" content="IE=EmulateIE8" > 

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.organica.designacaosingular" var="organicaDes" />
<fmt:message key="ipdms.soassociacao.processosDisponiveis" var="processosDisponiveis" />
<fmt:message key="ipdms.soassociacao.associarProcesso" var="associarProcesso" />
<fmt:message key="ipdms.soassociacao.numeroprocesso" var="numProcesso" />
<fmt:message key="ipdms.soassociacao.data" var="data" />
<fmt:message key="ipdms.soassociacao.processo" var="processo" />
<fmt:message key="ipdms.soassociacao.requerente" var="requerente" />
<fmt:message key="ipdms.soassociacao.processosEmpty" var="processosEmpty" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />


<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script type="text/javascript">
	if (typeof Range.prototype.createContextualFragment == "undefined") {
	    Range.prototype.createContextualFragment = function(html) {
	        var doc = this.startContainer.ownerDocument;
	        var container = doc.createElement("div");
	        container.innerHTML = html;
	        var frag = doc.createDocumentFragment(), n;
	        while ( (n = container.firstChild) ) {
	            frag.appendChild(n);
	        }
	        return frag;
	    };
	}

	function showOrganica(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts = "valuePlaceOlder=idOrganica";
		paramts += "&descPlaceOlder=organica";
		paramts += "&window=winchoose";

		winOrg=ExtWindow('${organicaDes}',action,paramts,'ext');
		winOrg.on('close',function(e){updateProcessos();});
		
	}
	
	function updateProcessos(){
		var action = '/accao/associarprocesso.do2?method=updateTiposProcesso';
		action += '&idOrganica='+ $('idOrganica').value;
		//action += '&includeItemAll=true';

		<c:if test="${pai != null}">
			action += '&selected='+ ${variante.numeroConteudo};
		</c:if>
		
		var myajax = new Ajax.Updater( 'processo','${pageContext.request.contextPath}/'+action,
										{method: 'get'} );
	}

	function showServicosOnline(){
		var action = "${pageContext.request.contextPath}/searchServicoOnlinePopup.do2";
		action += "?valuePlaceOlder=idServicoOnline";
		action += "&descPlaceOlder=servicoOnline";
		action += "&window=winchoose";
		action += "&idVariante="+$('processo').value;
		//action += "&entidadeId=22";
		//action += "&entidadeRoleId=4"; //requerente: 4 terceiro: 5
		action += "&exclude=${servicoOnline.id.numeroConteudo}";

		ExtWindow('${processosDisponiveis}',action,'','html');
	}	

</script>
<script type="text/javascript">	
		document.title = '${productName} - ${associarProcesso}';	 
	</script>
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${associarProcesso}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="/accao/associarprocesso" styleClass="form">
<html:hidden property="numero"/>

<div class="row formlabel_sf" style="height:25px;">
  	<div class="leftTab label" style="width:12%;" title="<fmt:message key="ipdms.soassociacao.organica" />">
  		<fmt:message key="ipdms.soassociacao.organica" />
  	</div>
	
  	<div class="label" style="width: 4%;" title="<fmt:message key="ipdms.soassociacao.organica" />">
  		<img alt="<fmt:message key="ipdms.soassociacao.organica" />" 
					title="<fmt:message key="ipdms.soassociacao.organica" />" 
					src="${IMAGE_DIR }/icon/icon-pesquisa.png"
					onclick="showOrganica();" class="cursorMao" />
		<input type="hidden" name="idOrganica" id="idOrganica"
			value="${organica.id }"/>
  	</div>
  	
  	<div class="textoCinza" id="organica" style="width: 82%;" title="<fmt:message key="ipdms.soassociacao.organica" />">
  			${organica.designacao }
	</div>
</div>

<div class="row formlabel_sf" style="height:25px;">
  	<div class="leftTab label" style="width:16%;" title="<fmt:message key="ipdms.soassociacao.tipoprocesso" />">
  		<fmt:message key="ipdms.soassociacao.tipoprocesso" />
	</div>
  	<div class="label" style="width:80%;" title="<fmt:message key="ipdms.soassociacao.tipoprocesso" />">
  		<select name="processo" id="processo">
  		</select>
	</div>
</div>
<div class="row formlabel_sf" style="height:35px;">
  	<div class="leftTab label" style="width:12%;" title="<fmt:message key="ipdms.soassociacao.numeroprocesso" />">
  		<fmt:message key="ipdms.soassociacao.numeroprocesso" />
	</div>
  	<div class="label" style="width:4%;" id="servico" title="<fmt:message key="ipdms.soassociacao.numeroprocesso" />">
  		<img alt="<fmt:message key="ipdms.soassociacao.numeroprocesso" />" 
					title="<fmt:message key="ipdms.soassociacao.numeroprocesso" />" 
					src="${IMAGE_DIR }/icon/icon-pesquisa.png"
					onclick="showServicosOnline();" class="cursorMao" />
  	</div>
  	<div class="label" style="width:20%;" id="servico" title="<fmt:message key="ipdms.soassociacao.numeroprocesso" />">
		<input type="hidden" name="idServicoOnline" id="idServicoOnline" value="${pai.numeroConteudo}"/>
  		<input name="servicoOnline" id="servicoOnline" readonly="readonly" value="${pai.idProcessoEntidade}"/>
	</div>
	
  	<div class="label" style="width:62%;" id="servico" title="<fmt:message key="ipdms.soassociacao.numeroprocesso" />">
		<img alt="<fmt:message key="ipdms.forms.reset" />" 
			title="<fmt:message key="ipdms.forms.reset" />" 
			src="${IMAGE_DIR }/icon/icon-lixo.png"
			onclick="$('servicoOnline').value='';$('idServicoOnline').value=''" class="cursorMao" /> 
	</div>	
</div>

<div class="buttonRow" style="margin-top:15px; height:35px;">
	<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
		onclick="setActionAndSubmit(this.form, '${pageContext.request.contextPath}${urlAnterior}');">
	<input type="submit" class="btForm" value="<fmt:message key="ipdms.forms.submit"/>" title="<fmt:message key='ipdms.forms.submit.title'/>" />
</div>
</html:form>
<br />
<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo2"><fmt:message key="ipdms.soassociacao.processosassociados"/></td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:choose>
	<c:when test="${(servicoOnline.filhos != null && fn:length(servicoOnline.filhos) > 0) || pai != null}">
		<table id="worklist" style="width:98%; ">
			<tr class="listHeader">
				<th width="15%">${numProcesso}</th>
				<th width="10%">${data}</th>
				<th>${processo}</th>
				<th>${requerente}</th>
			</tr>
			<c:forEach items="${servicoOnline.filhos}" var="filho">
				<tr>
					<td>${filho.idProcessoEntidade}</td>
					<td>
						<fmt:formatDate value='${filho.dataPreenchimento.time}' pattern='dd-MM-yyyy'/>
					 </td>
					<td>${filho.variante.processo.titulo}</td>
					<td>
						<c:forEach items="${filho.entidades}" var="entidade">
							<c:if test="${entidade.id.role.sigla == 'RQT'}">
								${entidade.id.entidade.nome }
							</c:if>
						</c:forEach>		
					</td>
				</tr>
			</c:forEach>
			<c:if test="${pai != null}">
				<tr>
					<td>${pai.idProcessoEntidade}</td>
					<td>						
						<fmt:formatDate value='${pai.dataPreenchimento.time}' pattern='dd-MM-yyyy'/>
					</td>
					<td>${tituloProcessoPai}</td>
					<td>
						<c:forEach items="${pai.entidades}" var="entidade">
							<c:if test="${entidade.id.role.sigla == 'RQT'}">
								${entidade.id.entidade.nome }
							</c:if>
						</c:forEach>		
					</td>
				</tr>
			</c:if>			
		</table>
	</c:when>
	<c:otherwise>
	<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info">${processosEmpty}</div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
updateProcessos();
</script>
