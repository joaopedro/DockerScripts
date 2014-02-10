<!-- Start sections/menu.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div id="menubar">	  
<ul id="menu">
	<sec:authorize access="hasAnyRole('GCC_ADMIN_ROLE', 'GCC_NORM_ROLE')">				
		<li class="menu-items" id="admin">
			<spring:message code="menu.label.admin"/>
			<div class="subMenu">
				<ul class="subMenu-content">
					<li onclick="window.location.href='<c:url value='/viewAllUsers.co' />'" class="item">
						<spring:message code="submenu.label.admin.user.manage"/></li>
					<li onclick="window.location.href='<c:url value='/gcctrl/view/v/viewAllConfigurations.co' />'" class="item">
						<spring:message code="submenu.label.admin.config.manage"/></li>						
				</ul>
			</div>
			&nbsp;&nbsp;|&nbsp;&nbsp;
		</li>	
	</sec:authorize>			
		<li class="menu-items" id="ticket">
			<spring:message code="menu.label.ticket"/>
			<div class="subMenu">
				<ul class="subMenu-content">							
					<li onclick="window.location.href='<c:url value='/gcctrl/view/a/addTicket.co' />'" class="item">
						<spring:message code="submenu.label.ticket.raise"/></li>
					<li onclick="window.location.href='<c:url value='/gcctrl/view/display/tbl/viewTickets.co' />'" class="item">
						<spring:message code="submenu.label.ticket.view.tickets"/></li>							
				</ul>
			</div>
		</li>			
</ul>
</div>
<!-- End sections/menu.jsp -->