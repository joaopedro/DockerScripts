<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<bean:write name="notification" property="body"  filter="false"/>
<br/><br/>
<b>Tipos de Receita MediData</b><br/>
<c:forEach var="tipoReceita" items="${tiposReceita}">
${tipoReceita }<br/>
</c:forEach>

