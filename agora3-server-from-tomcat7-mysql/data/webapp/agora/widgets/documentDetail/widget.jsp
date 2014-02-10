<script>
$(document).ready(function() {
	$.ajax({
		type: 'POST',
		url: javaVariables.contextPath + "/agora/documentDetail.do",
		data: {documentId: "${documentId}"},
		dataType: 'html',
		beforeSend: function() {
			$("body").mask(fmtResources.loadingMsg);
		},
		complete: function() {
			$("body").unmask();
		},
		error: function(transport) {
			console.log('Server side Error : ' + transport.status);
		},
		success: function(data) {
			$("#documentDetailDiv").html(data);
		}
	});
});
</script>

<div id="documentDetailDiv" style="font-size: 0.625em;"></div>