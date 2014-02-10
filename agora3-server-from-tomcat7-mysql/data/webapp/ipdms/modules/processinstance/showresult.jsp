<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<fmt:message key="ipdms.modules.processinstance.atencao" var="atencao" />

<script type="text/javascript">
		
	var erro = '${error_message}';
	if(erro != ""){		
		showMessageResult('${atencao}!', '${error_message}', 'error');	
	} else {
		showMessageResult('${title}', '${message}', 'info');		
	} 
	
		
	function showMessageResult(title, message, messageType){
		
		var type = Ext.MessageBox.INFO;
		if(messageType == "error"){
			type = Ext.MessageBox.ERROR;
		}
		
		
		Ext.MessageBox.show({
			title: title,
			msg: message,
			buttons: {yes:'Ok'},
			modal : true,
			closable: false,
			icon: type
		});	
	
	}
	
	
</script>
