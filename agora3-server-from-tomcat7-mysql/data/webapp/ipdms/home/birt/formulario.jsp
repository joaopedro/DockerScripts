<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.relatorio.field.required.msgPt1" var="msgPt1" />
<fmt:message key="ipdms.relatorio.field.required.msgPt2" var="msgPt2" />
<fmt:message key="ipdms.forms.anterior" var="anterior" />
<fmt:message key="ipdms.forms.anterior.title" var="anteriorTitle" />
<fmt:message key="ipdms.forms.reset" var="reset" />
<fmt:message key="ipdms.forms.reset.title" var="resetTitle" />
<fmt:message key="ipdms.relatorio.gerarRelatorio" var="gerarRelatorio" />
<fmt:message key="ipdms.relatorio.gerarPDFRelatorio" var="gerarPDFRelatorio" />
<fmt:message key="ipdms.relatorio.exportarExcel" var="exportarExcel" />

<script type="text/javascript">
	function reloadForm(parametroAlterado)
	{
		document.formulario.parametro_alterado.value = parametroAlterado.name;
		document.formulario.action="formularioanalise.do2";
		document.formulario.target = "_self";
		document.formulario.submit();
	}
	
	/*Valida se os parametros de entrada são preenchidos*/
	function isEmpty(form, action)
	{
	    //lista de todos os elementos marcados com preenchimento obrigatório
	    var isreqlist = ${isreqlist};   
	        
	    //obtem todos os componentes do formulário cujo parametro class=inputtext
	    var params = Ext.query("*[class=inputtext]");
	    var control = 0;                //control variable
	    var scope={control:control};    //scope variable, to access, in the Ext.each loop, the variable control
	
	    //por cada campo verifica se está marcado como de preenchimento obrigatório
	    Ext.each(params,function(item,index,params){
	        for(id in isreqlist){
	            //se for de preenchimento obrigatório e estiver vazio
	            if(item.name == isreqlist[id] && item.value.length == 0){
	                alert("${msgPt1} " + item.name + " ${msgPt2}");
	                scope.control++;
	                return false;
	            }
	        }                           
	    },scope);
	
	    //if all is fine, submit the form
	    if( scope.control == 0 ) {      
	        form.action=action;
	        form.target="_blank";
	        form.submit();      
	    }
	
	}

</script>

<form name="formulario" method="post">
	<input type="hidden" name="numero" value="${relatorio.id}">
	<input type="hidden" name="parametro_alterado" value="">
	
	<%--Paramters of the form --%>
	<jsp:include page="reportparams.jsp" />
	
	<%--Buttons --%>
	<div style="clear:both"></div>	
		
	<div class="buttonRow">
		<input type="button" class="formButton" value="${anterior}" onclick="this.form.action='formulariosanalise.do2'; this.form.target='_self'; this.form.submit();" title="${anteriorTitle}" />
		<input type="reset" class="formButton" value="${reset}" title="${resetTitle}" />
		<input type="button" class="formButton" value="${gerarRelatorio}" onclick="isEmpty(this.form,'analisar.do2');" title="${gerarRelatorio}" />
		<input type="button" class="formButton" value="${gerarPDFRelatorio}" onclick="isEmpty(this.form,'analisarpdf.do2');" title="${gerarPDFRelatorio}" />
		<input type="button" class="formButton" value="${exportarExcel}" onclick="isEmpty(this.form,'analisarexcel.do2');" title="${exportarExcel}" />
	</div>

</form>