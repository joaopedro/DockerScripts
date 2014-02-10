<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<fmt:message key="ipdms.obrigatorio" var="obrigatorio" />
<fmt:message key="ipdms.colaborador.nome" var="nome" />
<fmt:message key="ipdms.colaborador.morada" var="morada"/>
<fmt:message key="ipdms.colaborador.telefone" var="telefone"/>
<fmt:message key="ipdms.colaborador.telemovel" var="telemovel"/>
<fmt:message key="ipdms.colaborador.fax" var="fax"/>
<fmt:message key="ipdms.colaborador.email" var="email"/>
<fmt:message key="ipdms.colaborador.login" var="login"/>
<fmt:message key="ipdms.colaborador.passwordnova" var="passwordnova"/>
<fmt:message key="ipdms.colaborador.confirmacao" var="confirmacao"/>

<script type="text/javascript">
	$(document).ready(function() {
		var widgetsContainer = document.getElementById('main-body');
		widgetsContainer.style.height = "80%";
		
		var menuTab = document.getElementById('MenuTab');
		
		var exists = $("#MenuTab li:contains('Alterar Dados Pessoais')").length > 0;
		if(!exists){			
			var processesTabsScroller = document.getElementById('ProcessesTabsScroller');
			
			var li = document.createElement("li");
			
			var a = document.createElement('a');
			a.innerHTML = 'Alterar Dados Pessoais';
		    a.href =  '#';
			a.onclick = function(){
				ajaxRequest('/newlayout/editPersonalData.do2');
			}
			
			li.appendChild(a);
			
			menuTab.insertBefore(li,processesTabsScroller);
		}
		
		toggleTab('Alterar Dados Pessoais');
	});
</script>

<form id="Geral" action="/newlayout/savePersonalData" method="post">
	<input type="hidden" name="numero">
	<input type="hidden" name="ldap">

	<h1><fmt:message key='ipdms.menu.aplicacoesInternas.geral.alterarDadosPessoais'/></h1>
	<fieldset class="formGeralFieldset">
		<div class="FormRow">${obrigatorio}</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${nome}">* ${nome}:</label>
				<input type="text" name="nome" title="${nome}" value="${dadosPessoaisFormBean.nome}">
			</div>
		</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${morada}">* ${morada}:</label>
				<input type="text" name="morada" title="${morada}" value="${dadosPessoaisFormBean.morada}">
			</div>
		</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${telefone}">${telefone}:</label>
				<input type="text" name="telefone" title="${telefone}" value="${dadosPessoaisFormBean.telefone}">
			</div>
		</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${telemovel}">${telemovel}:</label>
				<input type="text" name="telemovel" title="${telemovel}" value="${dadosPessoaisFormBean.telemovel}">
			</div>
		</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${fax}">${fax}:</label>
				<input type="text" name="fax" title="${fax}" value="${dadosPessoaisFormBean.fax}">
			</div>
		</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${email}">* ${email}:</label>
				<input type="text" name="email" title="${email}" value="${dadosPessoaisFormBean.email}">
			</div>
		</div>
		
		<div class="FormRow">
			<div class="FormCellLeft">
				<label title="${login}">${login}:</label>
				${dadosPessoaisFormBean.login}
			</div>
		</div>
		
		<c:if test="${not dadosPessoaisFormBean.ldap}">
			<div class="FormRow">
				<div class="FormCellLeft">
					<label title="${passwordnova}">${passwordnova}:</label>
					<input type="password" name="passwordnova" title="${passwordnova}" maxlength="50">
				</div>
			</div>
			
			<div class="FormRow">
				<div class="FormCellLeft">
					<label title="${confirmacao}">${confirmacao}:</label>
					<input type="password" name="confirmacao" title="${confirmacao}" maxlength="50">
				</div>
			</div>			
		</c:if>
	
	</fieldset>
	<div class="button">
		<input name="" type="button" value="Gravar" class="BT_primary">
		<input name="" type="button" value="Cancelar">
	</div>
</form>