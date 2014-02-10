<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:message key="ipdms.product.name" var="productName"/>
<fmt:message key="ipdms.tarefas.lancarsubprocesso.title" var="title" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.selecaoVariante" var="selecaoVariante" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.numProcesso" var="numProcesso" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.data" var="data" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.processo" var="processo" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.requerente" var="requerente" />
<fmt:message key="ipdms.tarefas.lancarsubprocesso.processoEmpty" var="processoEmpty" />
<fmt:message key="ipdms.instrucao.pedido.info.title" var="atencao" />

<c:set var="THEMES_DIR" value="${pageContext.request.contextPath}/ipdms/themes" />
<c:set var="JS_DIR" value="${pageContext.request.contextPath}/ipdms/js" />
<c:set var="IMAGE_DIR" value="${pageContext.request.contextPath}/images" />

<LINK href='${THEMES_DIR}/window/window-default.css' type=text/css rel=stylesheet>
<LINK href='${THEMES_DIR}/window/alphacube.css' type=text/css rel=stylesheet>

<script src='${JS_DIR}/prototype.js' type="text/javascript"></script>
<script src='${JS_DIR}/window/window.js' type="text/javascript"></script>

<script type="text/javascript">	
	document.title = '${productName} - ${title}: ${selecaoVariante}';	 
</script>
<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1">${title}: ${selecaoVariante}</td>
		  </tr>
		</tbody>
	</table>					
</div>

<html:form action="/tarefas/escolhersubprocesso" styleClass="form">
<html:hidden property="numero"/>

<select name="documentosSub" id="documentosSub" multiple="multiple" style="visibility: hidden">
<c:forEach items="${documentosSub}" var="docs">
<option value="${docs}" selected="selected">${docs}</option>
</c:forEach>
</select>

<html:hidden property="method" value="criaSubProcessDoc" />

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 8%;" title="<fmt:message key='ipdms.variante.designacaosingular' />">
  		<fmt:message key="ipdms.variante.designacaosingular" />
	</div>
  	<div class="label" style="width: 89%;" title="<fmt:message key='ipdms.variante.designacaosingular' />">
  		<select name="variante" id="variante">
		<c:forEach items="${variantes}" var="vars">
			<c:choose>
				<c:when test="${fn:length(variantes)>1}">
					<option value="${vars.numeroConteudo}" selected="selected">${vars.titulo}</option>
				</c:when>
				<c:otherwise><option value="${vars.numeroConteudo}" selected="selected" >${vars.titulo}</option>
				</c:otherwise>
			</c:choose>
		</c:forEach>
  		</select>
  		<input type="submit" class="btForm" title="<fmt:message key='ipdms.forms.criar'/>" value="<fmt:message key='ipdms.forms.criar'/>">
	</div>
</div>

<div class="buttonRow">
	
</div>


<br /><br /><br /><br />
</html:form>
<html:form action="/tarefas/escolhersubprocesso" styleClass="form">
<input type="button" class="btForm" value="<fmt:message key="ipdms.forms.anterior"/>" title="<fmt:message key='ipdms.forms.anterior.title'/>"
	onclick="setActionAndSubmit(this.form, '${pageContext.request.contextPath}${urlAnterior}');">
</html:form>

<br /><br />
<div class="row" style="padding-top:0px; text-align:left; ">
	<table style="border:none;" cellpadding="0" cellspacing="0" class="headings">
		<tbody>
		  <tr>
		    <td class="titulo1"><fmt:message key="ipdms.soassociacao.processosassociados"/></td>
		  </tr>
		</tbody>
	</table>					
</div>

<c:choose>
	<c:when test="${(servicoOnline.filhos != null && fn:length(servicoOnline.filhos) > 0) || pai != null}">
		<table cellpadding="0" cellspacing="0" class="centro">
			<tr class="hoverTransparente">
				<th class="centro">${numProcesso}</th>
				<th class="centro">${data}</th>
				<th class="centro">${processo}</th>
				<th class="centro">${requerente}</th>
			</tr>
			<c:forEach items="${servicoOnline.filhos}" var="filho">
				<tr class="hoverTransparente">
					<td class="formfield">${filho.idProcessoEntidade}</td>
					<td class="formfield">
						<fmt:formatDate value='${filho.dataPreenchimento.time}' pattern='dd-MM-yyyy'/>
					 </td>
					<td class="formfield">${filho.variante.processo.titulo}</td>
					<td class="formfield">
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
					<td class="formfield">${pai.idProcessoEntidade}</td>
					<td class="formfield">						
						<fmt:formatDate value='${pai.dataPreenchimento.time}' pattern='dd-MM-yyyy'/>
					</td>
					<td class="formfield">${pai.variante.processo.titulo}</td>
					<td class="formfield">
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
	<div class="row formlabel_sf" ><div class="mensagenCaixa"><div style="float:left; width:3%;"><img src="${pageContext.request.contextPath}/images/icon/icon-informacao.png" style="vertical-align:middle; padding-left:10px; padding-right:8px;"  alt="${atencao}" title="${atencao}"/></div><div style="float:right; width:93%; vertical-align:middle; margin-top:4px; "><div class="info">${processoEmpty}</div></div><div style="clear:both"></div></div></div>
	</c:otherwise>
</c:choose>