<html>
	<head>
		<META HTTP-EQUIV="Pragma" CONTENT="no-cache">
		<META HTTP-EQUIV="Expires" CONTENT="-1">
		<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
	</head>
	<body>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"	prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"	prefix="fmt" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<fmt:setBundle var="ipdmsResources" basename="resources.IPDMSResources"/>

												
<c:if test="${not empty errorMsg}">
	<div style="clear:both"><br /></div>
	<div style="margin:0px;padding:20px;clear:both;">
		<bean:message key="${errorMsg}"  />
	</div>
	<div style="clear:both"><br /></div>
</c:if>


<c:if test="${empty errorMsg}">
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.type']}">
			<bean:message key="ipdms.geographicService.type" />
		</div>
		
		<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.type']}">
			${serviceType}
			<input type="hidden" id="serviceType" name="serviceType" value="${serviceType}" />
		</div>
	</div>
	
	<div class="row formlabel_sf" >
		<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.title']}">
			<bean:message key="ipdms.geographicService.title" /> *
		</div>
		
		<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.title']}">
			<input id="title" name="title" value="${serviceTitle}" style="width: 50%;" />
			<input
				type="button"
				class="btForm"
				value="<bean:message key="ipdms.geographicService.reset" />"
				onclick="$('title').value='${defaultServiceTitle}'" />
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.description']}">
			<bean:message key="ipdms.geographicService.description" />
		</div>
		
		<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.description']}">
			<input id="description" name="description" value="${serviceDescription}" style="width: 50%;" />
			<input
				type="button"
				class="btForm"
				value="<bean:message key="ipdms.geographicService.reset" />"
				onclick="$('description').value='${defaultServiceDescription}'" />
		</div>
	</div>
	
	<div class="row formlabel_sf">
		<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.global']}">
			<bean:message key="ipdms.geographicService.global" />
		</div>
		
		<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.global']}">
			<input type="checkbox" id="global" name="global" ${global ? "checked='checked'" : ""} />
		</div>
	</div>
	
	<c:if test="${serviceType eq 'WMS'}">
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.layers']}">
				<bean:message key="ipdms.geographicService.layers" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.layers']}">
				<ul><c:forEach items="${layers}" var="mapEntry" varStatus="status">
					<li>
						<input
							type="checkbox"
							id="layer${status.count}"
							name="layers"
							value="${mapEntry.key}"
							${mapEntry.value ? 'checked="checked"' : '' } />
						<label for="layer${status.count}">${mapEntry.key}</label>
					</li>
				</c:forEach></ul>
			</div>
		</div>
	</c:if>
	
	<c:if test="${serviceType eq 'WFS'}">
	
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.layer']}">
				<bean:message key="ipdms.geographicService.layer" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.layer']}">
				<select name="layers"><c:forEach var="mapEntry" items="${layers}">
					<option value="${mapEntry.key}" ${mapEntry.value ? 'selected="selected"' : '' }>
						${mapEntry.key}
					</option>
				</c:forEach></select>
			</div>
		</div>
		
		<%--
		  graphics
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics']}">
				<h1>
					<bean:message key="ipdms.geographicService.graphics" />
				</h1>
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics']}">
				<img src="${pageContext.request.contextPath}/images/icon/icon-lixo.png" alt="Eliminar" title="Eliminar" class="cursorMao" />
			</div>
		</div>
		
		<%--
		  defaultGraphic
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.default']}">
				<bean:message key="ipdms.geographicService.graphics.default" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.default']}">
				<input type="checkbox" name="deleteDefaultGraphic" value="on" />
				<input id="defaultGraphicInput" type="file" name="defaultIcon.formFile">
				<c:if test="${not empty defaultGraphic}"><img src="${defaultGraphic}" alt="Imagem por defeito" title="Imagem por defeito"  /></c:if>
			</div>
		</div>
		
		
		<%--
		  temporaryGraphic
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.temporary']}">
				<bean:message key="ipdms.geographicService.graphics.temporary" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.temporary']}">
				<input type="checkbox" name="deleteTemporaryGraphic" value="on" />
				<input type="file" name="temporaryIcon.formFile" value=""> 
				<c:if test="${not empty temporaryGraphic}"><img src="${temporaryGraphic}" alt="Imagem temporária" title="Imagem temporária" /></c:if>
			</div>
		</div>
		
		
		<%--
		  deleteGraphic
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.delete']}">
				<bean:message key="ipdms.geographicService.graphics.delete" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.delete']}">
				<input type="checkbox" name="deleteDeleteGraphic" value="on" />
				<input type="file" name="deleteIcon.formFile" value=""> 
				<c:if test="${not empty deleteGraphic}"><img src="${deleteGraphic}" alt="Apagar imagem" title="Apagar imagem" /></c:if>
			</div>
		</div>
		
		
		<%--
		  currentGraphic
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.current']}">
				<bean:message key="ipdms.geographicService.graphics.current" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.current']}">
				<input type="checkbox" name="deleteCurrentGraphic" value="on" />
				<input type="file" name="currentIcon.formFile" value=""> 
				<c:if test="${not empty currentGraphic}"><img src="${currentGraphic}" alt="Imagem actual" title="Imagem actual" /></c:if>
			</div>
		</div>
		
		<%--
		  highlightedGraphic
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.highlighted']}">
				<bean:message key="ipdms.geographicService.graphics.highlighted" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.highlighted']}">
				<input type="checkbox" name="deleteHighlightedGraphic" value="on" />
				<input type="file" name="highlightedIcon.formFile" value=""> 
				<c:if test="${not empty highlightedGraphic}"><img src="${highlightedGraphic}" alt="Imagem seleccionada" title="Imagem seleccionada" /></c:if>
			</div>
		</div>
		
		
		<%--
		  selectedGraphic
		  --%>
		<div class="row formlabel_sf" >
			<div class="leftTab label" style="width: 17%; " title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.selected']}">
				<bean:message key="ipdms.geographicService.graphics.selected" />
			</div>
			
			<div class="label" style="width: 80%;" title="${ipdmsResources.resourceBundle['ipdms.geographicService.graphics.selected']}">
				<input type="checkbox" name="deleteSelectedGraphic" value="on" />
				<input type="file" name="selectedIcon.formFile" value=""> 
				<c:if test="${not empty selectedGraphic}"><img src="${selectedGraphic}" alt="Imagem seleccionada" title="Imagem seleccionada" /></c:if>
			</div>
		</div>
		
		
	</c:if>

</c:if>

	</body>
</html>