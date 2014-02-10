<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${field.required}">
	<c:choose>
		<c:when test="${empty field.requiredOnValue}">&nbsp;*&nbsp;</c:when>
		<c:otherwise>
			<c:if test="${not empty obrigatorioLegenda}">
				<c:forEach items="${obrigatorioLegenda}" var="matchedResponses">
					<c:if test="${matchedResponses.key eq dfieldId}">
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
		</c:otherwise>
	</c:choose>
</c:if>