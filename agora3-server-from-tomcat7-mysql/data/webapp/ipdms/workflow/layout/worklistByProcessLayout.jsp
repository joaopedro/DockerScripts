<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<tiles:useAttribute id="title" name="title" ignore="true" scope="request"/>
<tiles:useAttribute id="titleKey" name="titleKey" ignore="true" scope="request"/>

<tiles:insert definition="ipdms.base" flush="false">
	<tiles:put name="header" value="/ipdms/base/header.jsp" />
	<tiles:put name="menu" value="/ipdms/base/menu.jsp" />
	<tiles:put name="main-body" value="/ipdms/workflow/layout/worklistByProcessBody.jsp"></tiles:put>
	<tiles:put name="footer" value="/ipdms/base/footer.jsp" />
</tiles:insert>
