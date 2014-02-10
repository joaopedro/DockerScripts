<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="viewPrefix" scope="request"><tiles:getAsString name="viewPrefix" /></c:set>
<tiles:insert attribute="ajax-response" />