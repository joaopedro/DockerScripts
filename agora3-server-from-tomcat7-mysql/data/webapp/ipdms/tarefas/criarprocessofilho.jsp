<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.organica.designacaosingular" var="organicaDes" />
<fmt:message key="ipdms.soassociacao.criarProcesso" var="criarProcesso" />
<fmt:message key="ipdms.soassociacao.option" var="option" />
<fmt:message key="webflow.sim" var="sim" />
<fmt:message key="webflow.nao" var="nao" />
<fmt:message key="ipdms.soassociacao.numeroprocesso" var="numeroprocesso" />
<fmt:message key="ipdms.soassociacao.data" var="data" />
<fmt:message key="ipdms.soassociacao.processo" var="processo" />
<fmt:message key="ipdms.soassociacao.requerente" var="requerente" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />
<fmt:message key="ipdms.soassociacao.processosEmpty" var="processosEmpty" />

<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images" />

<link rel="stylesheet" type="text/css" href="${JS_DIR}/ext/resources/css/CustomToolbar.css" />

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/Window_Iframe.js"></script>
<script type="text/javascript" src="${JS_DIR}/ext/ExtContentIPDMS/IPDMSTreePanel.js"></script>

<script type="text/javascript">



	function showOrganica(){
		var action = "${pageContext.request.contextPath}/ajaxListOrganica.do2";
		paramts  = "valuePlaceOlder=idOrganica";
		paramts += "&descPlaceOlder=organica";
		paramts += "&window=winchoose";

				
		winOrg=ExtWindow('${organicaDes}',action,paramts,'ext');
		winOrg.on('close',function(e){updateProcessos();});
		
	}
	
	function updateProcessos(){
		var action = '/accao/criarprocessofilho.do2?method=updateTiposProcesso';
		action += '&idOrganica='+ $('idOrganica').value;

		<c:if test="${variante != null}">
			action += '&selected='+ ${variante.numeroConteudo};
		</c:if>
		
		var myajax = new Ajax.Updater( 'processo','${pageContext.request.contextPath}/'+action,
										{method: 'get'} );
	}

</script>

<html:form action="/accao/criarprocessofilho" styleClass="form">
<html:hidden property="numero"/>
<script type="text/javascript">	
	document.title = '${productName} - ${criarProcesso}';	 
</script>
<div class="row" style="padding-top:0px; text-align:left;">
	<table style="border:none" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${criarProcesso}</td>
		  </tr>
		</tbody>
	</table>					
</div>
<html:errors/>
<c:if test="${not param.readOnly}">
  	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 9%;" title="<fmt:message key='ipdms.novoprocesso.organica' />">
              <fmt:message key="ipdms.novoprocesso.organica" />
           </div>
           
           <div class="label" style="width: 6%; ">
              	<img alt="<fmt:message key="ipdms.soassociacao.organica" />" 
					title="<fmt:message key="ipdms.soassociacao.organica" />" 
					src="${IMAGE_DIR }/icon/icon-pesquisa.png"
					onclick="showOrganica();" class="cursorMao" />
				<input type="hidden" name="idOrganica" id="idOrganica"
					value="${organica.id }"/>
           </div>
       
           <div class="label" style="width: 81%;" id="organica">
               ${organica.designacao }
           </div>
       </div>
	<div class="row formlabel_sf">
	  	<div class="leftTab label" style="width: 15%;" title="<fmt:message key='ipdms.soassociacao.tipoprocesso' />">
	  		<label for="processo"><fmt:message key="ipdms.soassociacao.tipoprocesso" /></label>
		</div>
	  	<div class="label" style="width: 82%;" title="<fmt:message key='ipdms.soassociacao.tipoprocesso' />">
	  		<select name="processo" id="processo">
	  		</select>
		</div>
	</div>
</c:if>
<c:if test="${param.readOnly}">
	<div class="row formlabel_sf">
	  	<div class="leftTab label" style="font-weight: bold;" title="<fmt:message key="ipdms.soassociacao.tipoprocesso" />">
	  		<fmt:message key="ipdms.soassociacao.tipoprocesso" />&nbsp;&nbsp;:&nbsp;&nbsp;
		</div>
	  	<div class="label" id="variante" title="<fmt:message key="ipdms.soassociacao.organica" />">
	  		${variante.titulo }
	  		<input type="hidden" name="processo" id="processo" value="${variante.numeroConteudo}">
	  		<input type="hidden" name="linkVariante" id="linkVariante" value="${variante.link}">
		</div>
	</div>
</c:if>
<div class="buttonRow">
<div>
<div class="row formlabel_sf">
  	<div class="leftTab label" title="<fmt:message key="ipdms.soassociacao.principalNotAvailable" />">
		<c:if test="${servicoOnline.processoPai!=null}">
			<div  style="color: red;">
				<fmt:message key="ipdms.soassociacao.principalNotAvailable" />
			</div>
		</c:if>
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" title="<fmt:message key='ipdms.soassociacao.principal' />">

		<label for="principal">
			<fmt:message key="ipdms.soassociacao.principal" />
		</label>
		<c:if test="${servicoOnline.processoPai!=null}">
			<input type="checkbox" value="asPrincipal" name="asPrincipal" disabled="disabled">
		</c:if>
		<c:if test="${servicoOnline.processoPai==null}">
			<input type="checkbox" value="asPrincipal" name="asPrincipal">
		</c:if>
	</div>
</div>
</div>
<div class="row formlabel_sf" >
	<div class="leftTab label" title="<fmt:message key='ipdms.soassociacao.closeCurrent' />">
		<label for="closeCurrent"><fmt:message key="ipdms.soassociacao.closeCurrent" /> *</label>	
		<select name="closeCurrent">
			<option value="">${option}</option>
			<option value="true">${sim}</option>
			<option value="false">${nao}</option>
		</select>
	</div>
</div>
<div class="row formlabel_sf" >
	<div class="buttonRow">
		<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
			onclick="setActionAndSubmit(this.form, '${pageContext.request.contextPath}${urlAnterior}');">
		<input type="submit" class="btForm" title="<fmt:message key='ipdms.forms.executar'/>" value="<fmt:message key='ipdms.forms.executar'/>">
	</div>
</div>
</html:form>

<div class="row" style="padding-top:0px; text-align:left;">
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
		<table cellpadding="0" cellspacing="1" class="centro">
			<tr>
				<th class="centro" style="width:10%">${numeroprocesso}</th>
				<th class="centro" style="width:10%">${data}</th>
				<th class="centro" style="width:38%">${processo}</th>
				<th class="centro" style="width:38%">${requerente}</th>
			</tr>
			<c:forEach items="${servicoOnline.filhos}" var="filho">
				<tr>
					<td class="centro">${filho.idProcessoEntidade}</td>
					<td class="centro">
						<fmt:formatDate value='${filho.dataPreenchimento.time}' pattern='dd-MM-yyyy'/>
					 </td>
					<td class="centro">${filho.variante.processo.titulo}</td>
					<td class="centro">
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
					<td class="centro">${pai.idProcessoEntidade}</td>
					<td class="centro">						
						<fmt:formatDate value='${pai.dataPreenchimento.time}' pattern='dd-MM-yyyy'/>
					</td>
					<td class="centro">${pai.variante.processo.titulo}</td>
					<td class="centro">
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
	<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info">${processosEmpty}</div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>


<script type="text/javascript">
updateProcessos();
</script>