<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/estilos.css' />
<link type=text/css rel=stylesheet href='${pageContext.request.contextPath}/ipdms/themes/forms.css'  />	
	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.conhecdadopor' />">
		<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.conhecdadopor" /></span>
	</div>
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.conhecdadopor' />">
		${soConhecimento.colaboradorEmitente.titulo}
	</div>
</div>	
<br />	
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.dataenvioparaconhec' />">
		<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.dataenvioparaconhec" /></span>
	</div>	
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.dataenvioparaconhec' />">
		<fmt:formatDate value="${soConhecimento.dataEnvio.time}" pattern="dd-MM-yyyy" />
	</div>
</div>	
<br />
<div class="row formlabel_sf" >
	<div class="leftTab label" style="width: 25%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.observacoes' />">
		<span class="textoBold"><fmt:message key="ipdms.myprocesses.darconhecimento.observacoes" /></span>
	</div>
	<div class="textoCinza" style="width:65%;" title="<fmt:message key='ipdms.myprocesses.darconhecimento.observacoes' />">
		${soConhecimento.observacoes}
	</div>
</div>