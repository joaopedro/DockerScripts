<script>
$(document).ready(function() {
	$.ajax({
		type: 'POST',
		url: javaVariables.contextPath + "/newlayout/notification.do2",
		data: {nid: "${nid}"},
		dataType: 'html',
		error: function(transport) {
			console.log('Server side Error : ' + transport.status);
		},
		success: function(data) {
			$("#processNotificationDiv").html(data);
		}
	});
});
</script>

<div id="processNotificationDiv" style="font-size: 0.625em;"></div>