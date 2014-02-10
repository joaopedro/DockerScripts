<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:if test="${not empty field.relations}">

    <script>
        ${dfieldId}_changed = function () {
            var radioValue = $F('${dfieldId}');
            <c:forEach items="${field.relations}" var="rel">
            if(radioValue == '${rel.onValue}') {
                <c:choose>
                <c:when test="${rel.relationType == 'DISABLED'}">
                    $('${rel.affectedField.siglaId}').disable();
                </c:when>
                <c:when test="${rel.relationType == 'ENABLED'}">
                    $('${rel.affectedField.siglaId}').enable();
                </c:when>
                <c:when test="${rel.relationType == 'HIDDEN'}">
                    $('div_${rel.affectedField.siglaId}').hide();
                </c:when>
                <c:when test="${rel.relationType == 'VISIBLE'}">
                    $('div_${rel.affectedField.siglaId}').show();
                </c:when>
                <c:otherwise>
                    alert('unknown action for field ${rel.affectedField.siglaId}');
                </c:otherwise>
            </c:choose>
            }
            </c:forEach>
        };

        ${dfieldId}_changed();

    </script>

</c:if>