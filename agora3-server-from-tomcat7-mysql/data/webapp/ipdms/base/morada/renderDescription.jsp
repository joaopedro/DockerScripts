<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="nested" uri="http://struts.apache.org/tags-nested"  %>

<div class="row formlabel_sf" style="height:30px;" >
	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.distrito'/>">
  		<fmt:message key="ipdms.modules.entidade.distrito"/>:
  	</div>

 	<div class="label" style="width:17%;" title="<fmt:message key='ipdms.modules.entidade.distrito'/>">
  		<div id="localidadeDistritoDiv">${distritoDescription}</div>
  	</div>
  	
  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.concelho'/>">
  		<fmt:message key="ipdms.modules.entidade.concelho"/>:
  	</div>
  	<div class="label" style="width:17%;" title="<fmt:message key='ipdms.modules.entidade.concelho'/>">
  		<div id="localidadeConcelhoDiv">${concelhoDescription}</div>
  	</div>

  	<div class="leftTab label" style="width: 10%; " title="<fmt:message key='ipdms.modules.entidade.freguesia'/>">
  		<fmt:message key="ipdms.modules.entidade.freguesia"/>:
  	</div>
  	<div class="label" style="width:18%;" title="<fmt:message key='ipdms.modules.entidade.freguesia'/>">
  		<div id="localidadeFreguesiaDiv">${freguesiaDescription}</div>
  	</div>
</div>