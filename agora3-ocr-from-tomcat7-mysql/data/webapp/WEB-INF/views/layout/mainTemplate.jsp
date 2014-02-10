<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="author" content="Powerby SINFIC" />
        <meta name="HandheldFriendly" content="True" />
        <meta name="MobileOptimized" content="320" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
        <title>ÁGORA</title>
        <link rel="shortcut icon" href="<c:url value="/resources/images/icons/Ico_AGORA.png" />" type="image/x-icon"/>
        <link href="<c:url value="/resources/css/estilos.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/menu.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/forms.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/table.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/image_viewer.css" />" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/media.css" />" rel="stylesheet" media="all and (max-width: 1024px)" />
        <script src="<c:url value="/resources/js/jquery-1.10.2.js" />"></script>
    </head>
    <body>
        <div class="container">
            <header><tiles:insertAttribute name="header"/></header>
		    <tiles:insertAttribute name="body"/>
		    <footer><tiles:insertAttribute name="footer"/></footer>
        </div>
    </body>
</html>