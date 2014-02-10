<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${changeline && field.changeLine}">
		<c:set var="styleLabel" value="width: 27%;" />
		<c:set var="styleInput" value="width: 70%;" />
	</c:when>
	<c:otherwise>
		<c:set var="styleLabel" value="padding-right: 20px;" />
		<c:set var="styleInput" value="padding-right: 40px;" />

	</c:otherwise>
</c:choose>

<c:choose>
	<%-- RESUMO: see dynamicform.jsp --%>
	<c:when test="${inputDisabled || resumo}">

		<c:if test="${field.visible}">

			<c:if test="${changeline}">
				<div class="row formlabel_sf">
			</c:if>

			<c:set var="dfieldId" value="${field.siglaId}" scope="request" />

			<div style="${styleInput}" title="${field.label}">
				<!-- Renderizar a label -->
				<c:choose>
					<c:when test="${field.type == 'BOOLEAN'}">
						<c:if test="${fieldInstance.value}">
							<b>${field.label}</b>
						</c:if>
					</c:when>
					<c:otherwise>
						<b>${field.label}:</b>
					</c:otherwise>
				</c:choose>
				<!-- Fim Renderizar Label -->

				<c:choose>
					<c:when test="${field.type == 'STRING'}"><jsp:include
							page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'INTEGER'}"><jsp:include
							page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'DATE'}"><jsp:include
							page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'COMBOBOX'}"><jsp:include
							page="parts/optionvaluesvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'NIVELDIMENSIONAL'}"><jsp:include
							page="parts/niveldimensionalvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'MORADA'}"><jsp:include
							page="parts/moradavaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'DIMENSAO'}"><jsp:include
							page="parts/dimensaovaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'ENTIDADE'}"><jsp:include
							page="parts/entidadevaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'MULTILINE'}"><jsp:include
							page="parts/stringvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'EXTERNALOPTION'}"><jsp:include
							page="parts/externaloptionvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'ORGANICA'}"><jsp:include
							page="parts/organicavaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'COLABORADOR'}"><jsp:include
							page="parts/colaboradorvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'COMENTARIOPESSOAL'}"><jsp:include
							page="parts/comentariopessoalvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'BOOLEAN'}"><jsp:include
							page="parts/booleanvaluepart.jsp" /></c:when>
					<c:when test="${field.type == 'PROCESS'}"><jsp:include
							page="parts/processovaluepart.jsp" /></c:when>
				</c:choose>
			</div>
			<c:set var="changeline" value="${field.changeLine}" scope="request" />
			<c:if test="${changeline}">
				</div>
			</c:if>

		</c:if>

	</c:when>

	<%-- Normal Form --%>
	<c:otherwise>
		<c:if test="${!field.visible}">
			<c:set var="divstyle">style="display: none;"</c:set>
		</c:if>


		<%--    <c:if test="${field.visible}">       --%>
		<%--        <c:set var="divstyle">style="align:right;"</c:set> --%>
		<%--    </c:if> --%>

		<c:set var="dfieldId" value="${field.siglaId}" scope="request" />

		<c:if test="${changeline}">
			<div class="row formlabel_sf">
		</c:if>
		
	<!-- (1) -->	<div id="div_${dfieldId}" ${divstyle}>

			<!--  SE for linear apresenta esta div -->


			<c:if
				test="${dynForm.layout.nameResourceKey=='ipdms.dynamicform.form.linearlayout' }">
				<div class="leftTab label" style="${styleLabel} "
					title="${field.label}">
					<label for="${dfieldId}">${field.label}</label>
					<jsp:include page="parts/requiredpart.jsp" />
				</div>
			</c:if>

			<div class="label" style="${styleInput}" title="${field.label}">
				<!--                Renderizar a label se o layout for grid -->
				<c:if
					test="${dynForm.layout.nameResourceKey=='ipdms.dynamicform.form.gridlayout' }">
					<label for="${dfieldId}">${field.label}</label>
					<jsp:include page="parts/requiredpart.jsp" />
				</c:if>
				<!--                Fim Renderizar Label -->

				<c:choose>
					<c:when test="${field.type == 'STRING'}"><jsp:include
							page="parts/stringinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'INTEGER'}"><jsp:include
							page="parts/intinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'DATE'}"><jsp:include
							page="parts/dateinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'COMBOBOX'}"><jsp:include
							page="parts/comboboxinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'NIVELDIMENSIONAL'}"><jsp:include
							page="parts/niveldimensionalinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'MORADA'}"><jsp:include
							page="parts/moradainputpart.jsp" /></c:when>
					<c:when test="${field.type == 'DIMENSAO'}"><jsp:include
							page="parts/dimensaoinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'ENTIDADE'}"><jsp:include
							page="parts/entidadeinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'MULTILINE'}"><jsp:include
							page="parts/multilineinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'EXTERNALOPTION'}"><jsp:include
							page="parts/externaloptioninputpart.jsp" /></c:when>
					<c:when test="${field.type == 'ORGANICA'}"><jsp:include
							page="parts/organicainputpart.jsp" /></c:when>
					<c:when test="${field.type == 'COLABORADOR'}"><jsp:include
							page="parts/colaboradorinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'COMENTARIOPESSOAL'}"><jsp:include
							page="parts/comentariopessoalinputpart.jsp" /></c:when>
					<c:when test="${field.type == 'BOOLEAN'}"><jsp:include
							page="parts/booleaninputpart.jsp" /></c:when>
					<c:when test="${field.type == 'PROCESS'}"><jsp:include
							page="parts/processoinputpart.jsp" /></c:when>
				</c:choose>
			</div>
		</div>

		<c:set var="changeline" value="${field.changeLine}" scope="request" />
		<c:if test="${changeline}">
			</div>
		</c:if>
		<c:set var="field" value="${field}" scope="request" />
		<jsp:include page="parts/scriptpart.jsp"></jsp:include>
	</c:otherwise>
</c:choose>