<%@ taglib prefix="html" uri="/tags/html"%>
<%@ taglib prefix="bean" uri="http://struts.apache.org/tags-bean" %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"%>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="kcms" uri="http://www.sinfic.pt/kcms/tags" %>

<SCRIPT src='${pageContext.request.contextPath}/ipdms/js/swf-ajax-ext.js' type="text/javascript"></script>

<logic:notPresent name="_resumo" scope="request">
<html:form action="applicationFlow" method="post" enctype="multipart/form-data">
<input type="hidden" name="_flowExecutionKey" value="${flowExecutionKey}">

	<html:errors/>
	<br/>
	<c:if test="${not empty resultMessage}">
		<span style="background-color: yellow; outline-color: black;"><b>Foi criado o processo no subflow ${resultMessage}</b><br/><br/></span>
	</c:if>
		<div class="row formlabel_sf" style="height:30%;">
			<c:forEach varStatus='status' var='ecra2' items='${teste.ecra1.ecra2s}'>
				<c:set var="lastIndex" value="${status.index}"/>
					<div class="leftTab label" style="width: 13%; ">
						Posição <span class="textoBaseDados"><c:out value='${status.index}'/></span>
					</div>
					<div class="label" style="width: 85%;">
   		  				<html:text value="${ecra2.descricao}" property="ecra1.ecra2s[${status.index}].descricao" />
	  				    <html:submit property="_eventId_delete=${status.index}&" value="Eliminar" styleClass="btForm" onkeyup="doAjax(event);" onmouseup="ajaxSubmit(event);"/>
					</div>
			</c:forEach>
		</div>
		<div class="row formlabel_sf" style="height:30%; ">
			<div class="leftTab label" style="width: 13%; ">
				<label for="novo">Novo</label>
			</div>
			<div class="label" style="width: 85%;">	
				<html:text property="novoEcra2.descricao" styleId="novo"/>
				<html:submit property="_eventId_refresh" value="Adicionar" styleClass="btForm" onkeyup="doAjax(event);" onmouseup="ajaxSubmit(event);"/>
			</div>
		</div>		
		<div class="row formlabel_sf" style="height:40%; ">
			<div class="leftTab label" style="width: 13%; ">
				<label for="tipoProcesso">Tipo de Sub Processo</label>
			</div>
			<div class="label" style="width: 85%;">	
				<html:select property="subFlow" styleId="tipoProcesso">
					<html:optionsCollection property="variantes" value="numeroConteudo" label="titulo" />				
				</html:select>
			</div>
		</div>

		<div class="buttonRow">
			<html:submit property="_eventId_subFlow" value="SubFlow" styleClass="btForm" onclick="webflowAjaxRequest(event);" style="margin-top:10px;"/>
			<span style="margin-left:50px;">
				<html:submit property="_eventId_back" value="« Anterior" styleClass="btForm" onclick="webflowAjaxRequest(event);" title="Retroceder ao ecrã anterior"/>
				<html:submit property="_eventId_next" value="Seguinte »" styleClass="btForm" title="Avançar para o ecrã seguinte" onclick="webflowAjaxRequest(event);" />				
				<html:submit property="_eventId_cancel" value="Cancelar" styleClass="btFormEscuro" onclick="if( confirmaCancelar() ) ajaxSubmitReferer(event,'${referer}');" title="Cancelar a operação"/>
			</span>
		</div>
</html:form>

</logic:notPresent>

<%------------------------ RESUMO ------------------------%>
<logic:present name="_resumo" scope="request">

<html:errors/>

<div class="row formlabel_sf">
  	<div class="leftTab label textoBold" style="width: 18%;" title="Descrições do Ecrã 2">
  		Descrições do Ecrã 2:
  	</div>
  		
  	<div class="label formtext_sf" style="width: 75%; " title="Descrições do Ecrã 2">
  		<c:choose>
		<c:when test="${empty teste.ecra1.ecra2s}">
			<c:forEach var='ecra2' items='${teste.ecra1.ecra2s}'>
						${ecra2.descricao} (Descricao)
			</c:forEach>		
		</c:when>
		<c:otherwise>
			Sem descrições do ecrã 2.
		</c:otherwise>
	</c:choose>
	</div>
</div>

<br/>
</logic:present>
