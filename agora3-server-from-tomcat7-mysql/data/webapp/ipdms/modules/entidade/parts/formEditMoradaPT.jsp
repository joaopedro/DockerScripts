<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<c:set var="entidade_locale" value="${sessionScope['ipdms.entidade.locale']}" scope="request" />

<fieldset style="margin-left:10px; width:95%;">
<legend><fmt:message key="ipdms.modules.entidade.moradaedit" /></legend>

<div id="errorDivMorada">
	<html:errors />
</div>

<input type="hidden" id="morada_index" name="morada_index" value="${morada_index}" />


<div class="row formlabel_sf">
	 <div class="row formlabel_sf" >
           <div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.entidade.codigopostal'/>">
				<fmt:message key="ipdms.modules.entidade.codigopostal"/>
           </div>
           
           <div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.codigopostal'/>">
               <span id="cp4MoradaDiv" >
					<select name="morada_cp4" id="morada_cp4" onchange="resetLabels();renderSelect('${entidade_locale}', 2);">
						<option value=""></option>			
						<c:forEach items="${cp4List}" var="option">
							<c:set var="selected" value="" />
							<c:if test="${option.value == morada_cp4}">
								<c:set var="selected" value="selected=selected" />
							</c:if>
							<option value="${option.value}" ${selected}>${option.title}</option>
						</c:forEach>
					</select>	&nbsp;-&nbsp;		
				</span>
				<span id="cp4OutroMoradaDiv" style="display: none;">
					<input type="text" id="morada_cp4_outro" name="morada_cp4_outro" size="4" maxlength="4" value="${morada_cp4_outro}" />
				</span>
				<span id="cp3MoradaDiv" >		
						<select name="morada_cp3" id="morada_cp3" onchange="renderSelect('${entidade_locale}', 3);">
							<option value=""></option>			
							<c:forEach items="${cp3List}" var="option">
								<c:set var="selected" value="" />
								<c:if test="${option.value == morada_cp3}">
									<c:set var="selected" value="selected=selected" />
								</c:if>
								<option value="${option.value}" ${selected}>${option.title}</option>
							</c:forEach>
						</select>			
				</span>
				<span id="cp3OutroMoradaDiv" style="display: none;">
					&nbsp;<input type="text" id="morada_cp3_outro" name="morada_cp3_outro" size="3" maxlength="3" value="${morada_cp3_outro}" />
				</span>
           </div>
           
            <div class="leftTab label" style="width: 13%;" title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
				<fmt:message key="ipdms.modules.entidade.localidade"/>
           </div>
           
           <div class="label" style="width: 34%;"  title="<fmt:message key='ipdms.modules.entidade.localidade'/>">
               <div id="localidadeMoradaDiv">
				<select name="morada_localidade" id="morada_localidade" onchange="renderSelect('${entidade_locale}', 4);">
					<option value=""></option>			
					<c:forEach items="${localidadeList}" var="option">
						<c:set var="selected" value="" />
						<c:if test="${option.value == morada_localidade}">
							<c:set var="selected" value="selected=selected" />
						</c:if>
						<option value="${option.value}" ${selected}>${option.title}</option>
					</c:forEach>
				</select>
			
			</div>
			<div id="localidadeOutroMoradaDiv" style="display: none;">
				<input type="text" id="morada_localidade_outro" name="morada_localidade_outro" size="40" maxlength="40" value="${morada_localidade_outro}" />
			</div>
           </div>
       </div>

<div style="clear:both;"></div>

<div class="row formlabel_sf">

	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.entidade.distrito'/>">
  		<fmt:message key="ipdms.modules.entidade.distrito"/>:
  	</div>

 	<div class="label" style="width:14%;" title="<fmt:message key='ipdms.modules.entidade.distrito'/>">
  		<div id="localidadeDistritoDiv"></div>
  	</div>
  	
  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.concelho'/>">
  		<fmt:message key="ipdms.modules.entidade.concelho"/>:
  	</div>
  	<div class="label" style="width:17%;" title="<fmt:message key='ipdms.modules.entidade.concelho'/>">
  		<div id="localidadeConcelhoDiv"></div>
  	</div>

  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.freguesia'/>">
  		<fmt:message key="ipdms.modules.entidade.freguesia"/>:
  	</div>
  	<div class="label" style="width:18%;" title="<fmt:message key='ipdms.modules.entidade.freguesia'/>">
  		<div id="localidadeFreguesiaDiv"></div>
  	</div>
  	
</div>

<div style="clear:both;"></div>

<div class="row formlabel_sf">
	<div class="leftTab label" style="width: 17%; " title="<fmt:message key='ipdms.modules.entidade.morada'/>">
  		<fmt:message key="ipdms.modules.entidade.morada"/>
  	</div>
  	
  	<div class="label" style="width: 30%;" title="<fmt:message key='ipdms.modules.entidade.morada'/>">
  		<div id="moradaMoradaDiv">
			
				<select name="morada_morada" id="morada_morada">
					<option value=""></option>			
					<c:forEach items="${moradaList}" var="option">
						<c:set var="selected" value="" />
						<c:if test="${option.value == morada_morada}">
							<c:set var="selected" value="selected=selected" />
						</c:if>
						<option value="${option.value}" ${selected}>${option.title}</option>
					</c:forEach>
				</select>
		
		</div>
		<div id="moradaOutroMoradaDiv" style="display: none;">
			<input type="text" id="morada_morada_outro" name="morada_morada_outro" style="width:90%" maxlength="60" value="${morada_morada_outro}" />
		</div>
  	</div>
  	
  	<div class="leftTab label" style="width: 13%; " title="<fmt:message key='ipdms.modules.entidade.lote'/>">
  		<fmt:message key="ipdms.modules.entidade.lote"/>
  	</div>
  	
  	<div class="label" style="width: 34%;" title="<fmt:message key='ipdms.modules.entidade.lote'/>">
  		<input type="text" id="morada_lote" name="morada_lote" value="${morada_lote}" size="10"/>
  	</div>
</div>


<div style="clear:both;"></div>

	<div class="buttonRow">
		<input type="button" class="btForm" title="<fmt:message key="ipdms.forms.gravar"/>"
			   value="<fmt:message key="ipdms.forms.gravar"/>" onclick="saveMorada('${entidade_locale}');" />
		<input type="button" class="btFormEscuro" title="<fmt:message key="ipdms.forms.cancelar.title"/>" value="<fmt:message key="ipdms.forms.cancelar"/>" onclick="enableButtons(); Element.update('divNewMorada', '' );" />
	</div>

</fieldset>
<c:if test="${morada_cp4==-1}">
<script>
showOutroPT();
</script>
</c:if>

