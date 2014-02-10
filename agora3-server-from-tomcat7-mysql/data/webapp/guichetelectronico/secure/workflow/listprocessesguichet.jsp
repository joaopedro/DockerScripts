<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="guichetelectronico.processo.detail.numprocesso" bundle="${guichetBundle}" var="numprocesso"/>
<fmt:message key="guichetelectronico.processo.detail.tipoprocesso" bundle="${guichetBundle}" var="tipoprocesso"/>
<fmt:message key="guichetelectronico.processo.detail.data" bundle="${guichetBundle}" var="data"/>
<fmt:message key="guichetelectronico.processo.detail.consultar" bundle="${guichetBundle}" var="consultar"/>

<script type="text/javascript">
	var rules = {
		'#worklist tbody tr': function(el) {
			el.onmouseover = function(){
				Element.addClassName(this,'active-row')				
			};
			el.onmouseout = function() {
				Element.removeClassName(this, 'active-row');
			};
		}
	};
	Behaviour.register(rules);
</script>

<c:set var="IMG_DIR" value="${pageContext.request.contextPath}/images" />

<div class="barraTitulo">
	<div class="textoTitulo"><fmt:message key="guichetelectronico.processo.list.titulo" bundle="${guichetBundle}"/></div>
</div>
			
<div id="areaCentral">
	<c:if test="${colaborador.entidadeAssociada != null}">
		<div class="barraSubTitulo">
			<div class="textoSubTitulo"><fmt:message key="guichetelectronico.processo.list.dadosentidade" bundle="${guichetBundle}"/></div>
		</div>

		<div class="row formlabel_sf" >
			<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.list.designacaosocial' bundle='${guichetBundle}'/>">
				<fmt:message key="guichetelectronico.processo.list.designacaosocial" bundle="${guichetBundle}"/>:
			</div>
			<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.list.designacaosocial' bundle='${guichetBundle}'/>">					
				${colaborador.entidadeAssociada.nome}						
			</div>
		</div>
		<div class="row formlabel_sf" >
			<div class="label textoBold" style="width: 20%; " title="<fmt:message key='guichetelectronico.processo.list.numfiscal' bundle='${guichetBundle}'/>">
				<fmt:message key="guichetelectronico.processo.list.numfiscal" bundle="${guichetBundle}"/>:
			</div>
			<div class="label" style="width: 77%;" title="<fmt:message key='guichetelectronico.processo.list.numfiscal' bundle='${guichetBundle}'/>">					
				${colaborador.entidadeAssociada.nif}				
			</div>
		</div>

		<div style="clear:both"></div><br />
	</c:if>

	<div class="barraSubTitulo">
		<div class="textoSubTitulo"><fmt:message key="guichetelectronico.processo.list.subtitulo" bundle="${guichetBundle}"/></div>
	</div>

<html:errors />
<div class="row formlabel_sf" style="font-size: 11px;">

<bean:size id="numberOfItens" name="processos"/>
<logic:greaterThan name="numberOfItens" value="0">
	<display:table id="processo" name="processos" htmlId="worklist" pagesize="20" requestURI="listprocessesguichet.do2">
			<display:column title="${numprocesso}" sortable="true" style="width:13%">
	 			<span style="display:none">nid=<bean:write name="processo" property="idProcessoEntidade"/></span>				
					${processo.idProcessoEntidade} 				
			</display:column>
			<display:column title="${tipoprocesso}" sortable="true">
	 			${processo.variante.titulo}  				
			</display:column>		
			<display:column title="${data}" sortable="true" style="width:12%">
	 			<c:if test="${not empty processo.dataPreenchimento}">
					<fmt:formatDate value="${processo.dataPreenchimento.time}" pattern="yyyy/MM/dd HH:mm"/>
				</c:if>				 				
			</display:column>
			<display:column title="${consultar}" sortable="false" class="alignCenter" style="width:4%">
	 			<a href="notificationdetail.do2?method=prepare&numConteudo=${processo.id.numeroConteudo}">
					 <img src="${pageContext.request.contextPath}/images/guichet/icons/icon-consultarDoc.png"
						class="cursorMao" alt="${consultar}" title="${consultar}" style="border:none;" /> </a>				
			</display:column>
	</display:table>

</logic:greaterThan>
<logic:equal name="numberOfItens" value="0">
	<div class="row">
		<div class="leftTab label" style="width: 90%; ">
	  		<fmt:message key="guichetelectronico.processo.list.empty" bundle="${guichetBundle}"/>		
	  	</div>
	</div>
	<P>&nbsp;</P>
</logic:equal>
</div>
</div>