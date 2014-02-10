<%@ taglib prefix="html" uri="/tags/html"  %>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>
<%@ taglib prefix="logic" uri="http://struts.apache.org/tags-logic"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.etapa.atributosetapa" var="atributosetapa" />
<fmt:message key="ipdms.item.atributo.label" var="label" />
<fmt:message key="ipdms.forms.select" var="select" />
<fmt:message key="ipdms.legenda" var="legenda" />

<script>
showAttribute = function(id){
	var isDisabled=false;
	var parent = document.getElementById(id);

	//ver primeiro se o elemento está 'enabled' ou 'disabled'
	var inputTagNames = new Array('input','select','textarea');
	for(var t=0;t<inputTagNames.length && !isDisabled;t++){
		var inputElements = parent.getElementsByTagName(inputTagNames[t]);
		for(var i=0;i<inputElements.length && !isDisabled;i++){
			if(inputElements[i].disabled)
				isDisabled=true;
		}
	}
	var allChildren = parent.getElementsByTagName('*');
	for(i=0;i<allChildren.length;i++)
		if(allChildren[i].nodeName!='IMG' || !isDisabled)
			allChildren[i].style.visibility='visible';
}

hideAttribute = function(id){
	var parent = document.getElementById(id);
	var allChildren = parent.getElementsByTagName('*');
	for(var i=0;i<allChildren.length;i++)
		allChildren[i].style.visibility='hidden';
}

enableDisableAttribute = function(id,disabled){
	showAttribute(id);
	var parent = document.getElementById(id);
	var inputTagNames = new Array('input','select','textarea');
	for(var t=0;t<inputTagNames.length;t++){
		var inputElements = parent.getElementsByTagName(inputTagNames[t]);
		for(var i=0;i<inputElements.length;i++)
			inputElements[i].disabled=disabled;
	}
	var imgElements = parent.getElementsByTagName('IMG');
	for(i=0;i<imgElements.length;i++)
		imgElements[i].style.visibility = disabled ? 'hidden' : 'visible';
}

enableAttribute = function(id){
	enableDisableAttribute(id,false);
}

disableAttribute = function(id){
	enableDisableAttribute(id,true);
}

limitTextArea = function (e,max){
	if(e != null && max != null && e.value !=null && e.value.length > max)
		e.value = e.value.substring(0,max);
}

</script>

<logic:notEmpty name="notificationForm" property="ipdmsAttributes">
<table class="atributosIpdmsDisplay" width="50%" style="border:none;">
<logic:iterate name="notificationForm" property="ipdmsAttributes" id="ipdmsAttributes" indexId="counter">

	<c:if test="${not empty ipdmsAttributes.radioEntries && ipdmsAttributes.type.name == 'RadioButton'}">
		<script>
			<c:forEach items="${ipdmsAttributes.radioEntries}" var="radioEntry">
				radio${ipdmsAttributes.numeroConteudoItem}${radioEntry.codigo} = function() {
					<c:forEach items="${radioEntry.relations}" var="relation">
						<c:if test="${relation.relationType == 'VISIBLE'}">
							showAttribute('atributo${relation.itemConjunto.numeroConteudo}');
						</c:if>
						<c:if test="${relation.relationType == 'HIDDEN'}">
							hideAttribute('atributo${relation.itemConjunto.numeroConteudo}');
						</c:if>
						<c:if test="${relation.relationType == 'ENABLED'}">
							enableAttribute('atributo${relation.itemConjunto.numeroConteudo}');
						</c:if>
						<c:if test="${relation.relationType == 'DISABLED'}">
							disableAttribute('atributo${relation.itemConjunto.numeroConteudo}');
						</c:if>
					</c:forEach>
				}
			</c:forEach>
		</script>
	</c:if>
							
	<c:if test="${counter==0}">
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 97%; height:25px; margin-left:11px;" title="${atributosetapa}">
			<span class="textoCinzento">${atributosetapa}</span>
		</div>
	</div>
	</c:if>

	<nested:root name="ipdmsAttributes">
		<div class="row formlabel_sf"  id="atributo${ipdmsAttributes.numeroConteudoItem}">
			<div class="leftTab label" style="width: 24%; " title="${label}">
				${ipdmsAttributes.displayName}
				<c:if test="${ipdmsAttributes.obrigatorio}">
					<c:if test="${empty ipdmsAttributes.obrigatorioMask}">
						&nbsp;*&nbsp;
					</c:if>
					<c:if test="${not empty ipdmsAttributes.obrigatorioMask}">
						<c:forEach items="${obrigatorioLegenda}" var="matchedResponses">
							<c:if test="${matchedResponses.key eq ipdmsAttributes.numeroConteudoItem}">
								<c:if test="${not empty matchedResponses.value}">
									&nbsp;**&nbsp;
									<div style="font-size:xx-small;">
										(
											<c:forEach items="${matchedResponses.value}" var="matchedResponse" varStatus="status">
												<c:if test="${status.index ne 0}">, </c:if>
												${matchedResponse}
											</c:forEach>
										)
									</div>
								</c:if>
								<c:if test="${empty matchedResponses.value}">
									&nbsp;*&nbsp;
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				</c:if>
			</div>
			
			<div class="label" style="width:70%;" title="${label}">
				<c:set var="valorAtributo">
					<c:choose>
						<c:when test="${ipdmsAttributes.valor != null}">${ipdmsAttributes.valor}</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${ipdmsAttributes.herdaValor}">
									<c:choose>
										<c:when test="${ipdmsAttributes.valorHeranca != null}">${ipdmsAttributes.valorHeranca}</c:when>
										<c:otherwise>${ipdmsAttributes.defaultValue}</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>${ipdmsAttributes.defaultValue}</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
				</c:set>
				
				<c:set var="disabledvalue" value="${ipdmsAttributes.readOnly || !canPerform}" />
				<c:choose>
					<c:when test="${ipdmsAttributes.type.name == 'String'}">
						<div class="label" style="width: 75%;" title="${label}">
							<nested:textarea property="valor" style="maxlength=${ipdmsAttributes.length}; " rows="${ipdmsAttributes.length/80+1}" cols="80" value="${valorAtributo}" disabled="${disabledvalue}" indexed="true" 
											 onkeydown="limitTextArea(this,${ipdmsAttributes.length})"
											 onkeyup="limitTextArea(this,${ipdmsAttributes.length})"
											 onkeypress="limitTextArea(this,${ipdmsAttributes.length})" />
						</div>
					</c:when>
					<c:when test="${ipdmsAttributes.type.name == 'Calendar'}">
							<div class="label" style="margin-right:2px;">
								<nested:text styleId="valor${counter}" property="valor" maxlength="10" size="10" styleClass="date" onkeypress="return false;" value="${valorAtributo}" disabled="${disabledvalue}" indexed="true"/>
							</div>
							<logic:notEqual name="notification" property="closed" value="true">
								<div class="label">
									<img id="buttonCalendar${ipdmsAttributes.numeroConteudoItem}${propName}" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="${select}" title="${select}"/>
								</div>
							</logic:notEqual>
			                <script type='text/javascript'>
			                	Calendar.setup({ inputField : 'valor${counter}', ifFormat : '%d-%m-%Y', showsTime : false });
			                	Calendar.setup({ inputField : 'valor${counter}', ifFormat : '%d-%m-%Y', button : "buttonCalendar${ipdmsAttributes.numeroConteudoItem}" });
			                </script>
					</c:when>
					<c:when test="${ipdmsAttributes.type.name == 'Reminder'}">
						<div class="row formlabel_sf">
							<div class="label" style="width: 14%;">
								<nested:text styleId="valor${counter}" property="valor"  maxlength="10" size="10" styleClass="date" onkeypress="return false;" indexed="true" disabled="${disabledvalue}"/>
		               		</div>
							<logic:notEqual name="notification" property="closed" value="true">
							<div class="label" style="width: 30%;">
						    	<img style="vertical-align: bottom" id="buttonLembrete${ipdmsAttributes.numeroConteudoItem}" src="${pageContext.request.contextPath}/images/icon/icon-calendario.png" onclick="" class="cursorMao" alt="${select}" title="${select}"/>
							</div>
							</logic:notEqual>
							 <script type='text/javascript'>
			                	Calendar.setup({ inputField : 'valor${counter}', ifFormat : '%d-%m-%Y', showsTime : false });
			                	Calendar.setup({ inputField : 'valor${counter}', ifFormat : '%d-%m-%Y', button : "buttonLembrete${ipdmsAttributes.numeroConteudoItem}" });
			                </script>
						</div>
					</c:when>
					<c:when test="${ipdmsAttributes.type.name == 'ComboBox'}">
						
							<nested:select property="valor" value="${valorAtributo}" indexed="true" disabled="${disabledvalue}">
								<option value=""></option>
								<nested:optionsCollection property="conjuntoCombobox.itensConjunto" label="titulo" value="sigla" />
							</nested:select>
						
					</c:when>
					<c:when test="${ipdmsAttributes.type.name == 'RadioButton'}">
						<div>
							<c:forEach items="${ipdmsAttributes.radioEntries}" var="radioEntry">
								<div>
									<nested:radio property="valor"
												value="${radioEntry.codigo}"
												indexed="true"
												disabled="${disabledvalue}"
												styleClass="radion"
												styleId="${ipdmsAttributes.numeroConteudoItem}${radioEntry.codigo}"
												onchange="radio${ipdmsAttributes.numeroConteudoItem}${radioEntry.codigo}()" /> 
									<label for="${ipdmsAttributes.numeroConteudoItem}${radioEntry.codigo}">
										${radioEntry.descricao}
									</label>
								</div>
							</c:forEach>
						</div>
					</c:when>
				</c:choose>
			</div>
		</div>
		<c:if test="${disabledvalue}"><script>
			disableAttribute('atributo${ipdmsAttributes.numeroConteudoItem}');
		</script></c:if>
	</nested:root>
</logic:iterate>
<div class="row" style="padding-bottom:20px;">
	<div class="leftTab label" style="width: 90%; " title="${legenda}">
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.obrigatorio" /></span>
  		<span class="formlabel_obrigatorio"><fmt:message key="ipdms.etapa.obrigatorio" /></span>
  	</div>
</div>
<%-- chamar os javaScripts que aplicam as relacoes dos radioEntries pré-seleccionados --%>
<logic:iterate name="notificationForm" property="ipdmsAttributes" id="ipdmsAttributes" indexId="counter">
	<c:if test="${ipdmsAttributes.type.name == 'RadioButton'}">
		<c:forEach items="${ipdmsAttributes.radioEntries}" var="radioEntry">
			<c:if test="${radioEntry.codigo eq ipdmsAttributes.valor}">
				<script>radio${ipdmsAttributes.numeroConteudoItem}${radioEntry.codigo}()</script>
			</c:if>
		</c:forEach>
	</c:if>
</logic:iterate>
</table>
</logic:notEmpty>
<script type="text/javascript">setMaxLength();</script>
