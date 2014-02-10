<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<SCRIPT type="text/javascript">
function showFormNovaInfo() {
	// alterar ícone da imagem
	var fold = 'images/icon/icon-mais.png';
	var open = 'images/icon/icon-menos.png';
	var	abrir = ($('imgnovainfo').src.indexOf(fold) != -1);
	$('imgnovainfo').src = abrir ? open : fold;
	Element.toggle($('novainfo'));
}
toggleComentario = function () {
	$('comentariosanteriores_close').toggle(); 
	$('comentariosanteriores_open').toggle();
	$('comentariosanteriores').toggle();
};
</SCRIPT>
<input type="hidden" id="nid" name="nid" value="${notificationForm.nid }" />
<input type="hidden" name="canPerform" id="canPerform" value="${canPerform}">

	<div id="comentariosanteriores_open" class="titulo2">
	<a href="#" onclick="toggleComentario();" id="showAccao">
		<img src="images/icon/seta_seccao_fecha.png" alt="<fmt:message key='ipdms.observacoes.mostrarComents'/>" title="<fmt:message key='ipdms.observacoes.mostrarComents'/>"/><fmt:message key="ipdms.observacoes.informacaoAdicional"/>
	</a></div>
	<div id="comentariosanteriores_close" class="titulo2" style="display: none;">
	<a href="#" onclick="toggleComentario();" id="hideAccao">
		<img src="images/icon/seta_seccao_abre.png" alt="<fmt:message key='ipdms.observacoes.esconderComents'/>" title="<fmt:message key='ipdms.observacoes.esconderComents'/>"/><fmt:message key="ipdms.observacoes.informacaoAdicional"/>
	</a></div>
		<div id="comentariosanteriores" style="display: none;">
			<jsp:include page="comentariosexistentes.jsp" />
		</div>
		
	<fmt:message key='ipdms.observacoes.criar.confirma' var='criarConfirma'/>
	
	<c:if test="${canPerform }">
		<fieldset style="margin:0px; width:97%">
		<legend><fmt:message key='ipdms.observacoes.novaInfo'/></legend>
		
		 	<div class="row formlabel_sf" >
                <div class="leftTab label" style="width: 10%;">
					<label for="textonovocomentario"><fmt:message key='ipdms.observacoes.novaInfo.Texto'/></label>
                </div>
                
                <div class="label" style="width: 87%;">
                     <input type="text" id="textonovocomentario" name="Novo Comentario" style="width: 80%;" maxlength="150" width="100%" />
                </div>
            </div>
            
            <div class="row formlabel_sf" >
                <div class="leftTab label" style="width: 10%;">
					<label for="tiponovocomentario"><fmt:message key='ipdms.observacoes.novaInfo.Tipo'/></label>
                </div>
                
                <div class="label" style="width: 87%;">
                    <input type="radio" id="tiponovocomentario" name="tiponovocomentario" value="3" class="radion" checked="checked" /><fmt:message key='ipdms.observacoes.novaInfo.Publico'/>
					<input type="radio" id="tiponovocomentario" name="tiponovocomentario" value="1" class="radion" /><fmt:message key='ipdms.observacoes.novaInfo.Privado'/>
                </div>
            </div>
            
            <div class="buttonRow">
            	<input type="button" title="<fmt:message key='ipdms.observacoes.novaInfo.Criar'/>" value="<fmt:message key='ipdms.observacoes.novaInfo.Criar'/>" id="novocomentario"  class="btForm"  onclick="criarComentario('${criarConfirma}');" />		
            </div>
		</fieldset>
	</c:if>	