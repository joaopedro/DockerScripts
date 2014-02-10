<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.comunicacaoparecer.pesquisa.areaProcesso" var="areaProcesso"/>
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.tipoProcesso" var="tipoProcesso"/>
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.detalhe.etapa" var="etapa"/>
<fmt:message key="ipdms.comunicacaoparecer.pesquisa.numProcesso" var="numProcesso"/>
<fmt:message key="ipdms.soassociacao.numeroexacto" var="numeroexacto"/>
<fmt:message key="ipdms.so.gestaoAusencias.nome" var="nome"/>
<fmt:message key="ipdms.forms.nifentidade" var="nifentidade"/>
<fmt:message key="ipdms.pesquisa.numDoc" var="numDoc"/>
<fmt:message key="ipdms.pesquisa.entradaDe" var="entradaDe"/>
<fmt:message key="ipdms.pesquisa.entradaAte" var="entradaAte"/>
<fmt:message key="ipdms.pesquisa.numProcOutroSys" var="numProcOutroSys"/>
<fmt:message key="ipdms.myprocesses.prioridade" var="prioridade"/>
<fmt:message key="ipdms.forms.estado" var="estado"/>
<fmt:message key="ipdms.forms.todos" var="todos"/>
<fmt:message key="ipdms.forms.abertos" var="abertos"/>
<fmt:message key="ipdms.forms.fechados" var="fechados"/>
<fmt:message key="ipdms.forms.assunto" var="assunto"/>

<script type="text/javascript" language="JavaScript" src="${pageContext.request.contextPath}/ipdms/js/processoutil.js"></script>

<script type="text/javascript">

Ext.onReady(function(){
	//cololcar formato de data caso nao haja datas reais
	dateFormatCheckonLoad();
});

</script>

<html:form method="post" action="/procuraprocessos" onsubmit="dateFormatCheckonSubmit();">
	<html:hidden property="page" value="1" />
	<html:hidden property="hist"/>

<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 17%; " title="${areaProcesso}">
  		<label for="areaProcesso">${areaProcesso}</label>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="${areaProcesso}">
  		<html:select  property="params(organicaProcesso)" onchange="reCarregarProcessos(this, 'listaprocessos');" style="width: 94%;" styleId="areaProcesso">
			<option value=""></option>
			<html:options collection="listOrganicas" property="id" labelProperty="designacao" />
		</html:select>
  	</div>
 
 	<div class="leftTab label" style="width: 17%; " title="${tipoProcesso}">
  		<label for="tipoProcesso">${tipoProcesso}</label>
  	</div>

  	<div class="label" style="width: 30%;" title="${tipoProcesso}">
		<div id="listaprocessos">
			<c:choose>
				<c:when test="${not empty searchProcessos.map.params['organicaProcesso']}">
					<c:url var="selectEtapas" value="selectprocessos.do2">
						<c:param name="organica" value="${searchProcessos.map.params['organicaProcesso']}"></c:param>
						<c:param name="processoId" value="${searchProcessos.map.params['tipoProcesso']}" />
					</c:url> 
					<c:import url="/${selectEtapas}" />
				</c:when>
				<c:otherwise>
			  		<html:select  property="params(tipoProcesso)" onchange="carregarEtapas(this, 'listaetapas');" style="width: 94%;" styleId="tipoProcesso">
						<option value=""></option>
						<html:options collection="listTiposProcesso" property="numeroConteudo" labelProperty="titulo" />
					</html:select>
				</c:otherwise>
			</c:choose>
		</div>	
  	</div> 	
	<div style="clear:both"></div>
</div>	

<div class="row formlabel_sf" >
  	<div class="leftTab label" style="width: 17%;" title="${etapa}">
		<label for="etapa">${etapa}</label>
	</div>
			  		
	<div class="label" style="width: 30%;" title="${etapa}">
		<div id="listaetapas">
			<c:if test="${not empty searchProcessos.map.params['tipoProcesso']}">
				<c:url var="selectEtapas" value="selectetapas.do2">
					<c:param name="tipoProcesso" value="${searchProcessos.map.params['tipoProcesso']}"></c:param>
					<c:param name="etapaId" value="${searchProcessos.map.params['etapa']}" />
				</c:url> 
				<c:import url="/${selectEtapas}" />
			</c:if>
		</div>	
	</div>

	<div class="leftTab label" style="width: 17%; " title="${numProcesso}">
  		<label for="numProcesso">${numProcesso}</label>
  	</div>
  	
  	<div class="label" style="width: 17%;" title="${numProcesso}">
  		<html:text styleClass="textinput" property="params(numProcesso)"  maxlength="20" style="width: 90%;" styleId="numProcesso"/>
	</div>
	<div class="label"  title="${numeroexacto}">
  			<label for="numExacto">${numeroexacto}</label> <html:checkbox styleClass="checkinput" property="params(tipoProc)" style="border:0;" styleId="numExacto" />
  		</div>
  	
	<div style="clear:both"></div>
</div>	
<div class="row formlabel_sf" >

  	<div class="leftTab label" style="width: 17%;" title="${nome}">
		<label for="nome">${nome}</label>
	</div>
	<div class="label" style="width: 30%;" title="${nome}">
		<html:text styleClass="textinput" property="params(entidadeNome)" maxlength="80" style="width: 85%;" styleId="nome"/>
		<a class="texto" href="#" onclick="showEntidadesSimplePopup();" id="entidadePopupImg" style="float: right;">
			<img alt="${entidadeDes}" src="${pageContext.request.contextPath}/images/icon/icon-pesquisa.png" align="middle">
		</a>
		<script type='text/javascript'>
			function showEntidadesSimplePopup(){
			var action = "${pageContext.request.contextPath}/listEntidadeSimplePopup.do2?method=showPopup";
			action += "&nomeEntidade=nome";
			action += "&nifEntidade=nif";
			action += "&window=winchoose";
			ExtWindow('Entidades',action,'','html');
			}
		</script>
	</div>
	
  	<div class="leftTab label" style="width: 17%;" title="${nifentidade}">
		<label for="nif">${nifentidade}</label>
	</div>
	<div class="label" style="width: 30%;" title="${nifentidade}">
		<html:text styleClass="textinput" property="params(entidadeNif)" maxlength="20" style="width: 100%;" styleId="nif"/>
	</div>
</div>	
<div class="row formlabel_sf" >
  	<div class="leftTab label" style="width: 17%;" title="${numDoc}">
			<label for="numDocumento">${numDoc}</label>
		</div>
	  		
	<div class="label" style="width: 30%;" title="${numDoc}">
		<html:text styleClass="textinput" property="params(numDocumento)" maxlength="20" style="width: 100%;" styleId="numDocumento"/>
	</div>
	
	<div class="leftTab label" style="width: 17%; " title="${entradaDe}">
        ${entradaDe}
    </div>
    
    <div class="label" style="width: 10%;" title="${entradaDe}">
        <html:text styleId="dataInicio" property="params(dataInicio)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
                            onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/> 
    </div>
    
    <div class="leftTab label" style="width: 4%;" title="${entradaAte}">
            ${entradaAte}
    </div>
            
    <div class="label" style="width: 10%;" title="${entradaAte}">
        <html:text styleId="dataFim" property="params(dataFim)" size="10" maxlength="10" styleClass="date" onkeypress="return false;"
                            onfocus="Calendar.setup({ inputField : this.id, ifFormat : '%d-%m-%Y', showsTime : false });"/>
    </div>
	
	<%--
	<div class="leftTab label" style="width: 17%; " title="Entrada do pedido de">
  		<label for="entradaPedido">Entrada do pedido de</label>
  	</div>
  	
  	<div class="label" title="Entrada do pedido de" id="td-${privileges.organicaFuncao.id }" style="display: ${display };">
		<input type="text" id="pesquisa[${entradaPedido}].inicio" 
			name="pesquisa[${entradaPedido}].inicio" size="10" maxlength="10"  
			class="date" value="<fmt:formatDate value='${pesquisa.inicio.time}' pattern='${dateFormat}'/>">
		<img style="vertical-align: bottom" id="button[${entradaPedido}].inicio" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="Data Inicio" title="Data Inicio" />
        <script type='text/javascript'>
           	Calendar.setup({ inputField : 'pesquisa[${entradaPedido}].inicio', ifFormat : '%d-%m-%Y', showsTime : false });
           	Calendar.setup({ inputField : 'pesquisa[${entradaPedido}].inicio', ifFormat : '%d-%m-%Y', button : "button[${entradaPedido}].inicio" });
		</script>
  	</div>
	  		
	<div class="label" style="width: 10%;" title="até">
		até
		<input type="text" id="pesquisa[${entradaPedido}].fim" 
			name="pesquisa[${entradaPedido}].fim" size="10" maxlength="10"  
			class="date" value="<fmt:formatDate value='${pesquisa.fim.time}' pattern='${dateFormat}'/>">
		<img style="vertical-align: bottom" id="button[${entradaPedido}].fim" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="Data Inicio" title="Data Inicio" />
        <script type='text/javascript'>
           	Calendar.setup({ inputField : 'pesquisa[${entradaPedido}].fim', ifFormat : '%d-%m-%Y', showsTime : false });
           	Calendar.setup({ inputField : 'pesquisa[${entradaPedido}].fim', ifFormat : '%d-%m-%Y', button : "button[${entradaPedido}].fim" });
		</script>
	</div>
	--%>
	
	
	
	
	
	<div style="clear:both"></div>
</div>	
<div class="row formlabel_sf" >
  	<div class="leftTab label" style="width: 17%;" title="${numProcOutroSys}">
			<label for="numProcessoOutro">${numProcOutroSys}</label>
	</div>
	<div class="label" style="width: 30%;" title="${numProcOutroSys}">
		<html:text styleClass="textinput" property="params(numeroProcessoExterno)" maxlength="20" style="width: 100%;" styleId="numProcessoOutro"/>
	</div>
	<div class="leftTab label" style="width: 17%;" title="${prioridade}">
		<label for="nif">${prioridade}</label>
	</div>
	<div class="label" style="width: 30%;" title="${prioridade}">
		<html:select  property="params(priority)" style="width: 94%;" styleId="tipoProcesso">
			<option value=""></option>
			<c:forEach items="${priorityValues}" var="p">
				<html:option value="${p}"><fmt:message key="${p.resourceKey}"/></html:option>
			</c:forEach>
		</html:select>
	</div>
</div>

<div class="row formlabel_sf" >
  	<div class="leftTab label" style="width: 17%;" title="${estado}">
  		<label>${estado}</label>
  	</div>
  	<div class="label" style="width: 30%;" title="${estado}">
  		<html:radio property="params(estado)" value="T" onclick="javascript:showAutorDiv('T');" style="border:none;"></html:radio>
  			${todos}
  		<html:radio property="params(estado)" value="A" onclick="javascript:showAutorDiv('A');" style="border:none;"></html:radio>
			${abertos}
  		<html:radio property="params(estado)" value="F" onclick="javascript:showAutorDiv('F');" style="border:none;"></html:radio>
			${fechados}
  	</div>
  	
  	<div class="leftTab label" style="width: 17%;" title="${assunto}">
		<label>${assunto}</label>
	</div>
	<div class="label" style="width: 30%;" title="${assunto}">
		<html:text styleClass="textinput" property="params(assunto)" maxlength="20" style="width: 100%;" styleId="assunto"/>
	</div>  	
</div>

	<div class="row formlabel_sf" >
		<div class="leftTabButton label" style="width: 10%;" title="">
			<input type="submit" name="search" title="<fmt:message key='ipdms.forms.pesquisar'/>" value="<fmt:message key='ipdms.forms.pesquisar'/>" class="btForm"/>
		</div>
		<div style="clear:both"></div>
	</div>
<br />
</html:form>

